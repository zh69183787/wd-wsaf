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
import org.springframework.stereotype.Service;
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
import com.wonders.frame.cpq.model.bo.CpqWorkflow;



/**
 * 系统日志AOP
 * @author Administrator
 *
 */
@Service
public class TodoItemService {
	private static Logger logger=LoggerFactory.getLogger(TodoItemService.class);
	@Resource
	GenericService genericService;
    
	public String addTodoItem(String apiUrl,String title,String stepName,String loginName,String initiator,String appUrl,String processName){
		HashMap<String,Object> addTaskData=new HashMap<String,Object>();
		String todoItemId=null;
		try{
			
			addTaskData.put("app", "cpq");
			addTaskData.put("type", 1);
			addTaskData.put("occurTime", DateFormatUtil.getCurrentDateTime());
			addTaskData.put("title", title);
			addTaskData.put("loginName", "ST/"+loginName);
			addTaskData.put("status", 0);
			addTaskData.put("removed", 0);
			addTaskData.put("typename", processName);
			addTaskData.put("url", URLEncoder.encode(appUrl,"UTF-8"));
			addTaskData.put("pname", processName);
			addTaskData.put("pincident", 1);
			addTaskData.put("cname", processName);
			addTaskData.put("cincident", 1);	
			addTaskData.put("stepName", stepName);
			addTaskData.put("initiator", "ST/"+initiator);
			
			String taskData=JacksonMapper.toJson(addTaskData);
			logger.debug("the data to addTask Api:"+taskData);
			HashMap<String,String> params=new HashMap<String,String>();
			params.put("data", taskData);
			todoItemId=RestAPIUtil.getData(apiUrl, params);
			
//			todoItemId="1234567890ASCFDGDGDDDGDG";

			logger.debug("the return of addTask Api:"+todoItemId);
		}catch(Exception e){
			logger.error("Exception Throwable", e);
		}

		return todoItemId;
	}
	
	public String confirmTodoItem(String apiUrl,String todoItemId){
		String success="0";
		try{
			HashMap<String,String> params=new HashMap<String,String>();
			params.put("data", todoItemId);
//			if(todoItemId.equalsIgnoreCase("1234567890ASCFDGDGDDDGDG")){
//				success="1";
//			}
			success=RestAPIUtil.getData(apiUrl, params);
			logger.debug("the return of updateTask Api with data "+todoItemId+":"+success);
		}catch(Exception e){
			logger.error("Exception Throwable", e);
		}

		return success;
		
	}
	
}
