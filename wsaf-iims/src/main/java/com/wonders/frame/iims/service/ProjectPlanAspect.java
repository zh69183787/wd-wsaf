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
import com.wonders.frame.iims.model.bo.WorkflowLog;



/**
 * 系统日志AOP
 * @author Administrator
 *
 */
@Component
@Aspect
public class ProjectPlanAspect {
	private static Logger logger=LoggerFactory.getLogger(ProjectPlanAspect.class);
	@Resource
	GenericService genericService;
	
	@Resource
	private WorkflowLogService workflowLogService;

	/**
	 * 指定切入点 
	 */
	@Pointcut("execution(* com.wonders.frame.iims.dao.ProjectPlanDao.save(..))")
	public void saveOrUpdateProjectPlan(){}
	
	/**
	 * 添加操作日志(后置通知) 
	 * @param joinPoint
	 * @param rtv
	 */
	@AfterReturning(value="saveOrUpdateProjectPlan()",argNames="rtv", returning="rtv")
	public void addProjectPlanLog(JoinPoint joinPoint, Object rtv) throws Throwable{
		logger.debug("start record workflowLog....... \n");
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder .getRequestAttributes()).getRequest();
		Object obj = joinPoint.getArgs()[0];
		//获取操作内容
		String pType=StringUtils.uncapitalize(obj.getClass().getSimpleName());
		Integer pId=(Integer)ReflectUtil.invokeGet(obj, "id");		
		String projectName=(String)ReflectUtil.invokeGet(obj, "projectName");
		String initiator=(String)ReflectUtil.invokeGet(obj, "initiator");
		String initiatorLoginname=(String)ReflectUtil.invokeGet(obj, "initiatorLoginname");
		String suggestion=(String)ReflectUtil.invokeGet(obj, "suggestion");
		String handler=(String)ReflectUtil.invokeGet(obj, "handler");
		String handlerLoginname=(String)ReflectUtil.invokeGet(obj, "handlerLoginname");	
		String projectStatusCode=(String)ReflectUtil.invokeGet(obj, "projectStatus");
		String statusCode=(String)ReflectUtil.invokeGet(obj, "status");
		
		//获取项目状态和审核状态的中文显示名
		List<FieldProperty> fieldProperties=ReflectUtil.getFieldProperties(obj.getClass(),"projectStatus,status","true");
		int projectStatusIndex=-1;
		int statusIndex=-1;
		for(int i=0;i<fieldProperties.size();i++){
			FieldProperty fieldProperty=fieldProperties.get(i);
			if(fieldProperty.getPath().equalsIgnoreCase("projectStatus")){
				projectStatusIndex=i;
			}else{
				statusIndex=i;
			}
			
		}
		
		FieldProperty projectStatusProperty=fieldProperties.get(projectStatusIndex);
		String projectStatus=projectStatusProperty.getOption().get(projectStatusCode);
		
		FieldProperty statusProperty=fieldProperties.get(statusIndex);
		LinkedHashMap<String,String> statusOption=statusProperty.getCodes().get(projectStatusCode);
		String status=statusOption.get(statusCode);
		
		//拼接流程步骤
		String stepName=projectStatus+"-"+status;
		
		String auditorReviewStatusName=projectStatusProperty.getOption().get("toInfoDept")+"-"+statusOption.get("auditorReview");
		String auditorPassStatusName=projectStatusProperty.getOption().get("toInfoDept")+"-"+statusOption.get("auditorPass");
		String auditorCancelStatusName=projectStatusProperty.getOption().get("toInfoDept")+"-"+statusOption.get("auditorCancel");
		//获取配置文件中相关接口地址
		Properties properties =SpringBeanUtil.getProperties("classpath:iimsConfig.properties");
		String addTaskApiUrl=properties.getProperty("addTaskApiUrl");
		String updateTaskApiUrl=properties.getProperty("updateTaskApiUrl");
		String todoAppUrl=properties.getProperty(projectStatusCode+"-"+statusCode+"-todoAppUrl");
		if(todoAppUrl!=null){
			todoAppUrl=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+todoAppUrl+"?id="+pId;
			logger.debug("todoAppUrl:"+todoAppUrl);
		}
		//待审核信息
		int auditorReviewNum=0;
		int curDealAuditorReviewNum=0;
		StringBuffer auditorReviewInitiator=new StringBuffer("");
		StringBuffer auditorReviewInitiatorLoginname=new StringBuffer("");
		StringBuffer auditorReviewSuggest=new StringBuffer("");
		StringBuffer auditorReviewHandler=new StringBuffer("");
		StringBuffer auditorReviewHandlerLoginname=new StringBuffer("");
		//审核完毕信息
		boolean isAuditorPass=true;
		StringBuffer auditorPassInitiator=new StringBuffer("");
		StringBuffer auditorPassInitiatorLoginname=new StringBuffer("");
		StringBuffer auditorPassSuggest=new StringBuffer("");
		StringBuffer auditorPassHandler=new StringBuffer("");
		StringBuffer auditorPassHandlerLoginname=new StringBuffer("");
							
		//查找并流程流转日志信息的中未处理（处理时间为空）的记录
		List<WorkflowLog> flowLogs=(List<WorkflowLog>)genericService.executeMethod("workflowLog",
				"findUnHandleByPTypeAndPId", new Class[] {String.class,Integer.class}, new Object[] {pType,pId});
		
		if(flowLogs!=null && flowLogs.size()>0){
			for(int k=0;k<flowLogs.size();k++){
			
				WorkflowLog existUnHandleWorkflowLog=flowLogs.get(k);
				String curStatus=existUnHandleWorkflowLog.getStatus();
				//把待处理人为自己或为空的以及发起人包括自己且待处理人相同的记录标记为已处理
				if(initiatorLoginname.equals(existUnHandleWorkflowLog.getHandlerLoginname())||
						(existUnHandleWorkflowLog.getHandlerLoginname()==null||existUnHandleWorkflowLog.getHandlerLoginname().equals(""))||
						(initiatorLoginname.contains(existUnHandleWorkflowLog.getInitiatorLoginname())&&handlerLoginname.equals(existUnHandleWorkflowLog.getHandlerLoginname()))){
					if(auditorReviewStatusName.equals(curStatus)){
						auditorReviewNum++;
						curDealAuditorReviewNum++;
					}
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
				}else{											
					//若待处理记录的处理人为其它用户，且状态为待审核
					if(auditorReviewStatusName.equals(curStatus)){
						auditorReviewNum++;
						appendUnExistWithRegx(auditorReviewInitiator,existUnHandleWorkflowLog.getInitiator(),",");
						appendUnExistWithRegx(auditorReviewInitiatorLoginname,existUnHandleWorkflowLog.getInitiatorLoginname(),",");
						appendUnExistWithRegx(auditorReviewSuggest,existUnHandleWorkflowLog.getSuggestion(),",");
						appendUnExistWithRegx(auditorReviewHandler,existUnHandleWorkflowLog.getHandler(),",");
						appendUnExistWithRegx(auditorReviewHandlerLoginname,existUnHandleWorkflowLog.getHandlerLoginname(),",");

					}else if(auditorPassStatusName.equals(curStatus)||auditorCancelStatusName.equals(curStatus)){
						
						if(auditorCancelStatusName.equals(curStatus)){isAuditorPass=false;}
						
						appendUnExistWithRegx(auditorPassInitiator,existUnHandleWorkflowLog.getInitiator(),",");
						appendUnExistWithRegx(auditorPassInitiatorLoginname,existUnHandleWorkflowLog.getInitiatorLoginname(),",");
						appendUnExistWithRegx(auditorPassSuggest,existUnHandleWorkflowLog.getInitiator()+":\n"+existUnHandleWorkflowLog.getSuggestion(),"\n");
						appendUnExistWithRegx(auditorPassHandler,existUnHandleWorkflowLog.getHandler(),",");
						appendUnExistWithRegx(auditorPassHandlerLoginname,existUnHandleWorkflowLog.getHandlerLoginname(),",");
					}
				}
			}
		}
		//默认发送待办事项及短信
		boolean ifSend=true;
		if(auditorReviewNum>0){//有待审核时，不发送待办项及短信
			ifSend=false;
		}
		String processName="信息化项目计划";
		//记录流转日志并发送待办项及短信（待审批的按照待处理人分发多条日志）
		if(handlerLoginname!=null &&!handlerLoginname.equals("")){
			String[] handlerLoginnames=handlerLoginname.split(",");
			String[] handlers=handler.split(",");
			
			for(int i=0;i<handlerLoginnames.length;i++){	
				String singleHandler=handlers[i];
				String singleHandlerLoginName=handlerLoginnames[i];
				//有待审核，则不发待办项及短信
				workflowLogService.addLogAndSendTodoItemAndSendShortMsg(processName,projectName,pType,pId,initiator,initiatorLoginname,
						suggestion,singleHandler,singleHandlerLoginName,stepName,todoAppUrl,addTaskApiUrl,ifSend);
	
			}
		}else{
			//有待审核，则不发待办项及短信
			workflowLogService.addLogAndSendTodoItemAndSendShortMsg(processName,projectName,pType,pId,initiator,initiatorLoginname,
					suggestion,handler,handlerLoginname,stepName,todoAppUrl,addTaskApiUrl,ifSend);
		}
		
		//针对审核过程中的情况，若有待审核处理的记录，则修改业务记录相关状态及发起人、处理人信息；若无待审核处理信息，则自动发起审核完毕流程
		if("toInfoDept".equals(projectStatusCode)&&("auditorPass".equals(statusCode)||"auditorCancel".equals(statusCode))){
			//若存在需要其他人处理的待审核记录
			if(auditorReviewNum>0&&auditorReviewNum-curDealAuditorReviewNum>0){//除了当前处理的仍旧有待审核，更新当前记录状态为待审核
				if(!auditorReviewInitiatorLoginname.equals("")&&!auditorReviewHandlerLoginname.toString().equals("")){
				
					genericService.executeMethod(pType,"updateFlowInfoById", 
							new Class[] {String.class,String.class,String.class,String.class,String.class,String.class,Integer.class}, 
							new Object[] {auditorReviewInitiator.substring(1),
							auditorReviewInitiatorLoginname.substring(1),
							auditorReviewHandler.substring(1),
							auditorReviewHandlerLoginname.substring(1),
							auditorReviewSuggest.substring(1),
							"auditorReview",pId});
				}
			}else if(auditorReviewNum>0&&auditorReviewNum==curDealAuditorReviewNum){//除了当前处理的无其它待审核，自动发起审核完毕的流程
				if(!auditorPassInitiatorLoginname.equals("")&&!auditorPassHandlerLoginname.toString().equals("")){
					
					if("auditorCancel".equals(statusCode)){isAuditorPass=false;}

					ReflectUtil.invokeSet(obj, "initiator",insertUnExist(auditorPassInitiator, initiator));
					ReflectUtil.invokeSet(obj, "initiatorLoginname",insertUnExist(auditorPassInitiatorLoginname,initiatorLoginname));
					ReflectUtil.invokeSet(obj, "suggestion",insertUnExist(auditorPassSuggest, initiator+":\n"+suggestion));
					ReflectUtil.invokeSet(obj, "handler",insertUnExist(auditorPassHandler, handler));
					ReflectUtil.invokeSet(obj, "handlerLoginname",insertUnExist(auditorPassHandlerLoginname, handlerLoginname));
					ReflectUtil.invokeSet(obj, "status",isAuditorPass?"auditorPass":"auditorCancel");
					
					genericService.executeMethod(pType,"save", new Class[] {Object.class}, new Object[] {obj});
				}
			}
		}
		
		logger.debug("finish record workflowLog....... \n");

	}

	private void appendUnExistWithRegx(StringBuffer sb,String s,String regx){
		if(!sb.toString().contains(s)){
			sb.append(regx).append(s);
		}
	}
	
	private String insertUnExist(StringBuffer sb,String s){
		String rs="";
		if(!sb.toString().contains(s)){
			sb.insert(0,s);
			rs=sb.toString();
		}else{
			rs=sb.substring(1);
		}
		return rs;
	}
	
}
