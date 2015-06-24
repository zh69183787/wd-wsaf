package com.wonders.frame.icp.service;

import java.util.Date;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.wonders.frame.core.service.GenericService;
import com.wonders.frame.core.utils.ReflectUtil;
import com.wonders.frame.core.utils.SpringBeanUtil;

/**
 * 系统日志AOP
 * @author Administrator
 *
 */
@Component
@Aspect
public class QteMainWorkflowAspect {
	private static Logger logger=LoggerFactory.getLogger(QteMainWorkflowAspect.class);
	
	@Resource
	GenericService genericService;
	
	@Resource
	private TodoItemService todoItemService;

	/**
	 * 指定切入点
	 */
	@Pointcut("execution(* com.wonders.frame.icp.dao.QteMainWorkflowDao.save(..))")
	public void saveQteMainWorkflow(){}
	
	/**
	 * 添加后置操作
	 * @param joinPoint
	 * @param rtv
	 */
	@AfterReturning(value="saveQteMainWorkflow()",argNames="rtv", returning="rtv")
	public void saveWorkflow(JoinPoint joinPoint,Object rtv)throws Throwable{
		try {
	            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder .getRequestAttributes()).getRequest();
				
				//获取待办项接口地址以及办理页面的URL
				Properties properties =SpringBeanUtil.getProperties("classpath:icpConfig.properties");
				String addTaskApiUrl=properties.getProperty("addTaskApiUrl");
				String updateTaskApiUrl=properties.getProperty("updateTaskApiUrl");
				
				Object obj=joinPoint.getArgs()[0];
				Integer id=(Integer)ReflectUtil.invokeGet(obj,"id");
				//更新QteMain表问卷的状态
			    Integer qteId=(Integer)ReflectUtil.invokeGet(obj,"qteId");
			    String status=((String)ReflectUtil.invokeGet(obj,"status")).trim();
			    String qteTitle=(String)ReflectUtil.invokeGet(obj, "qteTitle");
			    Date handleTime=(Date)ReflectUtil.invokeGet(obj, "handleTime");
			    String handlerLoginname=(String)ReflectUtil.invokeGet(obj, "handlerLoginname");
				String initiatorLoginname=(String)ReflectUtil.invokeGet(obj, "initiatorLoginname");
			    
			    genericService.executeMethod("qteMain","updateStatusById", new Class[]{String.class,Integer.class}, new Object[]{status,qteId});
				
				if(handleTime!=null){//处理时间不为空或待条线审核时，去掉代办项
					String todoItemId=(String)ReflectUtil.invokeGet(obj,"todoItemId");
					String success=todoItemService.confirmTodoItem(updateTaskApiUrl, todoItemId);
					if(success.equals("1")){
						logger.debug("confirmTodoItem:"+todoItemId);
					}
					//将流转记录中的代办项清空
					genericService.executeMethod("qteMainWorkflow","updateTodoItemIdById", new Class[]{String.class,Integer.class}, new Object[]{" ",id});
				}else{//处理时间为空
					
					if(status.equals("inDeptAudit") || status.equals("inLineAudit")){//添加代办项
						
						if(status.equals("inLineAudit")){
							String todoItemId=(String)ReflectUtil.invokeGet(obj,"todoItemId");
							String success=todoItemService.confirmTodoItem(updateTaskApiUrl, todoItemId);
							if(success.equals("1")){
								logger.debug("confirmTodoItem:"+todoItemId);
							}
							//将流转记录中的代办项清空
							genericService.executeMethod("qteMainWorkflow","updateTodoItemIdById", new Class[]{String.class,Integer.class}, new Object[]{" ",id});
						}
						
						//获取审核操作页面地址,同时将审核的记录id带过去(该地址还未配置):一个是部门领导审核界面，一个是条线领导审核界面
						String todoAppUrl="";
						if(status.equals("inDeptAudit")){
							todoAppUrl=properties.getProperty("inDeptAudit-todoAppUrl");
						}else{
							todoAppUrl=properties.getProperty("inLineAudit-todoAppUrl");
						}
						
						status=status.equals("inDeptAudit")?"待部门领导审核":"待条线管理员审核";
						if(todoAppUrl!=null){
							Integer paramId=qteId;
							todoAppUrl=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+todoAppUrl+"?mainId="+paramId;
						    logger.debug("todoAppUrl:"+todoAppUrl);
						}
						//添加代办项
						String todoItemId=todoItemService.addTodoItem(addTaskApiUrl,qteTitle,status,handlerLoginname,initiatorLoginname,todoAppUrl,"党办问卷调查流程");
						//将代办项id保存到当前流转对象中
						genericService.executeMethod("qteMainWorkflow","updateTodoItemIdById", new Class[]{String.class,Integer.class}, new Object[]{todoItemId,id});
						logger.debug("add todoItem："+todoItemId);
					}
				}
		} catch (Exception e) {
			logger.error("throw error in QteMainWorkflowAspect",e);
		}
	}

}
