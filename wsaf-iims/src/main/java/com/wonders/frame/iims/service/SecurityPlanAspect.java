package com.wonders.frame.iims.service;

import java.net.URLEncoder;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.hibernate.annotations.common.util.impl.Log;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.wonders.frame.core.model.vo.EntityProperty;
import com.wonders.frame.core.model.vo.FieldProperty;
import com.wonders.frame.core.service.GenericService;
import com.wonders.frame.core.utils.DateFormatUtil;
import com.wonders.frame.core.utils.JacksonMapper;
import com.wonders.frame.core.utils.ReflectUtil;
import com.wonders.frame.core.utils.RestAPIUtil;
import com.wonders.frame.core.utils.SpringBeanUtil;
import com.wonders.frame.iims.model.bo.WirelessResourceBook;
import com.wonders.frame.iims.model.bo.WorkflowLog;



/**
 * 系统日志AOP
 * @author Administrator
 *
 */
@Component
@Aspect
public class SecurityPlanAspect {
	private static Logger logger=LoggerFactory.getLogger(SecurityPlanAspect.class);
	@Resource
	GenericService genericService;
	
	@Resource
	private WorkflowLogService workflowLogService;

	/**
	 * 指定切入点 
	 */
	@Pointcut("execution(* com.wonders.frame.iims.dao.SecurityPlanDao.save(..))")
	public void saveOrUpdateSecurityPlan(){}
	/**
	 * 添加操作日志(后置通知) 
	 * @param joinPoint
	 * @param rtv
	 */
	
	@AfterReturning(value="saveOrUpdateSecurityPlan()",argNames="rtv", returning="rtv")
	public void addSecurityPlanLog(JoinPoint joinPoint, Object rtv) throws Throwable{
		logger.debug("start record workflowLog....... \n");
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder .getRequestAttributes()).getRequest();
		Object obj = joinPoint.getArgs()[0];
		//获取操作内容
		String pType=StringUtils.uncapitalize(obj.getClass().getSimpleName());
		Integer pId=(Integer)ReflectUtil.invokeGet(obj, "id");		
		String initiator=(String)ReflectUtil.invokeGet(obj, "initiator");
		String initiatorLoginname=(String)ReflectUtil.invokeGet(obj, "initiatorLoginname");
		String suggestion=(String)ReflectUtil.invokeGet(obj, "suggestion");
		String handler=(String)ReflectUtil.invokeGet(obj, "handler");
		String handlerLoginname=(String)ReflectUtil.invokeGet(obj, "handlerLoginname");	
		String statusCode=(String)ReflectUtil.invokeGet(obj, "status");
		//获取项目状态和审核状态的中文显示名
		EntityProperty entityProperty=ReflectUtil.getEntityProperty(obj.getClass(),"status","true");
		List<FieldProperty> fieldProperties= entityProperty.getFieldProperties();
		
		FieldProperty statusProperty=fieldProperties.get(0);
		String status=statusProperty.getOption().get(statusCode);
		
		//获取配置文件中相关接口地址
		Properties properties =SpringBeanUtil.getProperties("classpath:iimsConfig.properties");
		String addTaskApiUrl=properties.getProperty("addTaskApiUrl");
		String updateTaskApiUrl=properties.getProperty("updateTaskApiUrl");
		String todoAppUrl=properties.getProperty(pType+"-"+statusCode+"-todoAppUrl");
		if(todoAppUrl!=null){
			todoAppUrl=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+todoAppUrl+"?id="+pId;
			logger.debug("todoAppUrl:"+todoAppUrl);
		}

							
		//查找并流程流转日志信息的中未处理（处理时间为空）的记录
		List<WorkflowLog> flowLogs=(List<WorkflowLog>)genericService.executeMethod("workflowLog",
				"findUnHandleByPTypeAndPId", new Class[] {String.class,Integer.class}, new Object[] {pType,pId});
		boolean isSameRec=false;
		if(flowLogs!=null && flowLogs.size()>0){
			for(int k=0;k<flowLogs.size();k++){
			
				WorkflowLog existUnHandleWorkflowLog=flowLogs.get(k);
				String curStatus=existUnHandleWorkflowLog.getStatus();
				if(!curStatus.equals(status)){//未办理的状态和当前保存的状态不一致，则做处理
					//把待代理人为自己（或为空）的以及发起人包括自己且待处理人相同的记录标记为已处理
					if(initiatorLoginname.equals(existUnHandleWorkflowLog.getHandlerLoginname())||
							(existUnHandleWorkflowLog.getHandlerLoginname()==null||existUnHandleWorkflowLog.getHandlerLoginname().equals(""))||
							(initiatorLoginname.contains(existUnHandleWorkflowLog.getInitiatorLoginname())&&handlerLoginname.equals(existUnHandleWorkflowLog.getHandlerLoginname()))){
	
						//更新处理时间及代办项状态
						existUnHandleWorkflowLog.setHandleTime(new Date());
						String exitTodoItemId=existUnHandleWorkflowLog.getTodoItemId();
						
						genericService.executeMethod("workflowLog",
								"save", new Class[] {Object.class}, new Object[] {existUnHandleWorkflowLog});
						
						//更新待办项状态
						if(exitTodoItemId!=null && !exitTodoItemId.equals("")){
						
							//尝试3次更新已处理的待办项
							int loop=3;
							for(int i=0;i<loop;i++){
								String success=workflowLogService.confirmTodoItem(updateTaskApiUrl,exitTodoItemId);
								if(success.equals("1")){break;}
							}
						}
					}
				}else{
					isSameRec=true;
				}
			}
		}
		if(!isSameRec){
			String title=entityProperty.getCnName();
			String stepName=status;
			String processName="信息化"+entityProperty.getCnName();
			//默认发送待办事项及短信		
			//记录流转日志并发送待办项及短信
			workflowLogService.addLogAndSendTodoItemAndSendShortMsg(processName,title,pType,pId,initiator,initiatorLoginname,
					suggestion,handler,handlerLoginname,stepName,todoAppUrl,addTaskApiUrl,true);
		}
		logger.debug("finish record workflowLog....... \n");

	}
	
}
