package com.wonders.frame.cpq.service;

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
import com.wonders.frame.cpq.model.bo.CpqMain;




/**
 * 系统日志AOP
 * @author Administrator
 *
 */
@Component
@Aspect
public class CpqWorkflowAspect {
	private static Logger logger=LoggerFactory.getLogger(CpqWorkflowAspect.class);
	@Resource
	GenericService genericService;
	
	@Resource
	private TodoItemService todoItemService;
	
	/**
	 * 指定切入点 
	 */
	@Pointcut("execution(* com.wonders.frame.cpq.dao.CpqWorkflowDao.save(..))")
	public void saveCpqWorkflow(){}
	/**
	 * 添加操作日志(后置通知) 
	 * @param joinPoint
	 * @param rtv
	 */
	
	@AfterReturning(value="saveCpqWorkflow()",argNames="rtv", returning="rtv")
	public void saveWorkflow(JoinPoint joinPoint, Object rtv) throws Throwable{
		try{
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder .getRequestAttributes()).getRequest();
			
			//获取待办项接口地址以及办理页面的URL
			Properties properties =SpringBeanUtil.getProperties("classpath:cpqConfig.properties");
			String addTaskApiUrl=properties.getProperty("addTaskApiUrl");
			String updateTaskApiUrl=properties.getProperty("updateTaskApiUrl");

			
			Object obj = joinPoint.getArgs()[0];
			//获取操作内容
			String pType=StringUtils.uncapitalize(obj.getClass().getSimpleName());
			Date handleTime=(Date)ReflectUtil.invokeGet(obj, "handleTime");
			//办理时间不为空，则去除待办项
			if(handleTime!=null){
				String todoItemId=(String)ReflectUtil.invokeGet(obj, "todoItemId");
				String success=todoItemService.confirmTodoItem(updateTaskApiUrl,todoItemId);
				if(success.equals("1")){
					logger.debug("confirmTodoItem:"+todoItemId);
				}
				
			}else{//办理时间为空，则添加待办项
			
				Integer id=(Integer)ReflectUtil.invokeGet(obj, "id");		
				Integer cpqId=(Integer)ReflectUtil.invokeGet(obj, "cpqId");
				String initiatorLoginname=(String)ReflectUtil.invokeGet(obj, "initiatorLoginname");		
				String handlerLoginname=(String)ReflectUtil.invokeGet(obj, "handlerLoginname");			
				String status=(String)ReflectUtil.invokeGet(obj, "status");
				
				//获取状态的中文显示名
				List<FieldProperty> fieldProperties=ReflectUtil.getFieldProperties(obj.getClass(),"status","true");
				
				FieldProperty StatusProperty=fieldProperties.get(0);
				String statusCn=StatusProperty.getOption().get(status);
				
	
				String todoAppUrl=properties.getProperty(status+"-todoAppUrl");
				if(todoAppUrl!=null){
					Integer paramId=id;
					if(!status.equalsIgnoreCase("assign")){
						paramId=cpqId;
					}
					todoAppUrl=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+todoAppUrl+"?id="+paramId;
					logger.debug("todoAppUrl:"+todoAppUrl);
				}
				
				
				//获取测评名称
				CpqMain cpqMain=(CpqMain)genericService.executeMethod("cpqMain",
						"findById", new Class[] {Integer.class}, new Object[] {cpqId});
			
				
				String todoItemId=todoItemService.addTodoItem(addTaskApiUrl,cpqMain.getCpqName(),statusCn,handlerLoginname,initiatorLoginname,todoAppUrl,"网上测评");
										
				genericService.executeMethod("cpqWorkflow","updateTodoItemIdById", new Class[] {Integer.class,String.class},new Object[] {id,todoItemId});
				
				logger.debug("add TodoItem:"+todoItemId);
			}
		}catch(Exception e){
			logger.error("throw error in CpqWorkflowAspect", e);
		}

	}
	
}
