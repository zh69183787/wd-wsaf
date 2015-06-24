package com.wonders.frame.ias.service;

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




/**
 * 系统日志AOP
 * @author Administrator
 *
 */
@Component
@Aspect
public class WorkflowAspect {
	private static Logger logger=LoggerFactory.getLogger(WorkflowAspect.class);
	@Resource
	GenericService genericService;
	
	@Resource
	private TodoItemService todoItemService;
	
	/**
	 * 指定切入点 
	 */
	@Pointcut("execution(* com.wonders.frame.ias.dao.IasWorkflowDao.save(..))")
	public void saveWorkflow(){}
	/**
	 * 添加操作日志(后置通知) 
	 * @param joinPoint
	 * @param rtv
	 */
	
	@AfterReturning(value="saveWorkflow()",argNames="rtv", returning="rtv")
	public void saveWorkflow(JoinPoint joinPoint, Object rtv) throws Throwable{
		try{
			HttpServletRequest request = null;
            try {
                request = ((ServletRequestAttributes) RequestContextHolder .getRequestAttributes()).getRequest();
            }catch(Exception e){

            }
			
			//获取待办项接口地址以及办理页面的URL
			Properties properties =SpringBeanUtil.getProperties("classpath:iasConfig.properties");
			String addTaskApiUrl=properties.getProperty("addTaskApiUrl");
			String updateTaskApiUrl=properties.getProperty("updateTaskApiUrl");
			
			Object obj = joinPoint.getArgs()[0];

			//Date handleTime=(Date)ReflectUtil.invokeGet(obj, "handleTime");
			String status=(String)ReflectUtil.invokeGet(obj, "status");
			//去除待办项
			String todoItemId=(String)ReflectUtil.invokeGet(obj, "todoItemId");
			
			if(!status.equalsIgnoreCase("draft") && todoItemId!=null &&!todoItemId.equalsIgnoreCase("")){//非保存，且待办项不为空，则去除待办项
				
				String success=todoItemService.confirmTodoItem(updateTaskApiUrl,todoItemId);
				if(success.equals("1")){
					logger.debug("confirmTodoItem:"+todoItemId);
				}
				
			}

            //draft 每月 提示 插入待办项
            if("draft".equalsIgnoreCase(status) && request == null){
                String localIp = properties.getProperty("localIp");
                String todoAppUrl = localIp + properties.getProperty("back"+"-todoAppUrl");
                String iasName=(String)ReflectUtil.invokeGet(obj, "iasName");
                String initiatorLoginname=(String)ReflectUtil.invokeGet(obj, "initiatorLoginname");
                String handlerLoginname=(String)ReflectUtil.invokeGet(obj, "handlerLoginname");
                Integer id=(Integer)ReflectUtil.invokeGet(obj, "id");
                todoItemId = todoItemService.addTodoItem(addTaskApiUrl, "部门考勤（每月23日定时提醒）",
                        "", handlerLoginname, initiatorLoginname,
                        todoAppUrl, "部门考勤");
                genericService.executeMethod("iasWorkflow", "updateTodoItemIdById",
                        new Class[]{Integer.class, String.class}, new Object[]{id, todoItemId});
            }else


			//更新待办项
			if(status.equalsIgnoreCase("review")||status.equalsIgnoreCase("back")){//提交，待审批/退回，发待办项
			
				Integer id=(Integer)ReflectUtil.invokeGet(obj, "id");		
				String iasName=(String)ReflectUtil.invokeGet(obj, "iasName");
				String initiatorLoginname=(String)ReflectUtil.invokeGet(obj, "initiatorLoginname");		
				String handlerLoginname=(String)ReflectUtil.invokeGet(obj, "handlerLoginname");			
				if(status.equalsIgnoreCase("back")){
					initiatorLoginname=(String)ReflectUtil.invokeGet(obj, "handlerLoginname");		
					handlerLoginname=(String)ReflectUtil.invokeGet(obj, "initiatorLoginname");	
				}
				
				//获取状态的中文显示名
				List<FieldProperty> fieldProperties=ReflectUtil.getFieldProperties(obj.getClass(),"status","true");
				
				FieldProperty StatusProperty=fieldProperties.get(0);
				String statusCn=StatusProperty.getOption().get(status);
				
	
				String todoAppUrl=properties.getProperty(status+"-todoAppUrl");
				if(todoAppUrl!=null){
					todoAppUrl=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+todoAppUrl+"?id="+id;

					todoItemId=todoItemService.addTodoItem(addTaskApiUrl,iasName,statusCn,handlerLoginname,initiatorLoginname,todoAppUrl,"部门考勤");
					
					genericService.executeMethod("iasWorkflow","updateTodoItemIdById", new Class[] {Integer.class,String.class},new Object[] {id,todoItemId});
					
					logger.debug("add TodoItem:"+todoItemId);
				}
				
				
			}
		}catch(Exception e){
			logger.error("throw error in iasWorkflowAspect", e);
		}

	}
	
}
