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
import com.wonders.frame.iims.model.bo.AppCount;
import com.wonders.frame.iims.model.bo.AppVersion;
import com.wonders.frame.iims.model.bo.WirelessResourceBook;
import com.wonders.frame.iims.model.bo.WorkflowLog;



/**
 * 系统日志AOP
 * @author Administrator
 *
 */
@Component
@Aspect
public class AppCountAspect {
	private static Logger logger=LoggerFactory.getLogger(AppCountAspect.class);
	@Resource
	GenericService genericService;
	
	@Before("execution(* com.wonders.frame.iims.dao.AppCountDao.removeById(..))")
	public void doBeforeRemove(JoinPoint joinPoint) {
		Object id = joinPoint.getArgs()[0];
		//获取操作内容
		AppCount removedAppCount=(AppCount)genericService.executeMethod("appCount",
				"findById", new Class[] {Integer.class}, new Object[] {id});

					
		genericService.executeMethod("appVersion",
				"removedByDeptAndDeviceNum", new Class[] {String.class,String.class}, new Object[] {removedAppCount.getDept(),removedAppCount.getDeviceNum()});
		
		logger.debug("removeAppVersion....... \n");
		
	}
	
}
