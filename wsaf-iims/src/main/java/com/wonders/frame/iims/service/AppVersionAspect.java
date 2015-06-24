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
public class AppVersionAspect {
	private static Logger logger=LoggerFactory.getLogger(AppVersionAspect.class);
	@Resource
	GenericService genericService;
	
	@Before("execution(* com.wonders.frame.iims.dao.AppVersionDao.removeById(..))")
	public void doBeforeRemove(JoinPoint joinPoint) {
		Object id = joinPoint.getArgs()[0];
		//获取操作内容
		AppVersion removedAppVersion=(AppVersion)genericService.executeMethod("appVersion",
				"findById", new Class[] {Integer.class}, new Object[] {id});
		
		
		int authorizeOpsys=0,opsys=0,authorizeOa=0,oa=0,authorizeApp=0,app=0;
		
		HashMap<String,Object> filter=new HashMap<String,Object>();
		filter.put("dept", removedAppVersion.getDept());
		filter.put("deviceNum", removedAppVersion.getDeviceNum());
		
		List<AppVersion> appVersions=(List<AppVersion>)genericService.executeMethod("appVersion","findAll", 
				new Class[] {HashMap.class,LinkedHashMap.class}, 
				new Object[] {filter,null});
		
		for(AppVersion appVersion:appVersions){
			if(appVersion.getId().equals(id)){continue;}
			if(appVersion.getAppType().equalsIgnoreCase("opsys")){
				if(appVersion.getAuthorize().equalsIgnoreCase("yes")){
					authorizeOpsys++;
				}
				opsys++;
			}else if(appVersion.getAppType().equalsIgnoreCase("oa")){
				if(appVersion.getAuthorize().equalsIgnoreCase("yes")){
					authorizeOa++;
				}
				oa++;
			}else{
				if(appVersion.getAuthorize().equalsIgnoreCase("yes")){
					authorizeApp++;
				}
				app++;
			}
		}
									
		genericService.executeMethod("appCount",
				"updateCountNumByDeptAndDeviceNum", new Class[] {String.class,String.class,Integer.class,Integer.class,Integer.class,Integer.class,Integer.class,Integer.class},
				new Object[] {removedAppVersion.getDept(),removedAppVersion.getDeviceNum(),authorizeOpsys,opsys,authorizeOa,oa,authorizeApp,app});
	
				
		
		logger.debug("changeAppCount....... \n");
	}
	/**
	 * 指定切入点 
	 */
	@Pointcut("execution(* com.wonders.frame.iims.dao.AppVersionDao.save(..))")
	public void saveOrUpdateAppVersion(){}
	/**
	 * 添加操作日志(后置通知) 
	 * @param joinPoint
	 * @param rtv
	 */
	
	@AfterReturning(value="saveOrUpdateAppVersion()",argNames="rtv", returning="rtv")
	public void changeAppCount(JoinPoint joinPoint, Object rtv) throws Throwable{
		Object obj = joinPoint.getArgs()[0];
		//获取操作内容
		String pType=StringUtils.uncapitalize(obj.getClass().getSimpleName());
		String dept=(String)ReflectUtil.invokeGet(obj, "dept");		
		String deviceNum=(String)ReflectUtil.invokeGet(obj, "deviceNum");
		String appType=(String)ReflectUtil.invokeGet(obj, "appType");		
		String authorize=(String)ReflectUtil.invokeGet(obj, "authorize");
		
		AppCount appCount=(AppCount)genericService.executeMethod("appCount",
				"findByDeptAndDeviceNum", new Class[] {String.class,String.class}, new Object[] {dept,deviceNum});
		
		if(appCount==null){
			appCount=new AppCount();
			appCount.setDept(dept);
			appCount.setDeviceNum(deviceNum);
			appCount.setDeviceName((String)ReflectUtil.invokeGet(obj, "deviceName"));
			appCount.setAuthorizeOpsys(0);
			appCount.setOpsys(0);
			appCount.setAuthorizeOa(0);
			appCount.setOa(0);
			appCount.setAuthorizeApp(0);
			appCount.setApp(0);

			if(appType.equalsIgnoreCase("opsys")){
				if(authorize.equalsIgnoreCase("yes")){
					appCount.setAuthorizeOpsys(1);
				}
				appCount.setOpsys(1);
			}else if(appType.equalsIgnoreCase("oa")){
				if(authorize.equalsIgnoreCase("yes")){
					appCount.setAuthorizeOa(1);
				}
				appCount.setOa(1);
			}else{
				if(authorize.equalsIgnoreCase("yes")){
					appCount.setAuthorizeApp(1);
				}
				appCount.setApp(1);
			}
			
			genericService.executeMethod("appCount",
					"save", new Class[] {Object.class}, new Object[] {appCount});			
		}else{
			int authorizeOpsys=0,opsys=0,authorizeOa=0,oa=0,authorizeApp=0,app=0;
			
			HashMap<String,Object> filter=new HashMap<String,Object>();
			filter.put("dept", dept);
			filter.put("deviceNum", deviceNum);
			
			List<AppVersion> appVersions=(List<AppVersion>)genericService.executeMethod(pType,"findAll", 
					new Class[] {HashMap.class,LinkedHashMap.class}, 
					new Object[] {filter,null});
			
			for(AppVersion appVersion:appVersions){
				
				if(appVersion.getAppType().equalsIgnoreCase("opsys")){
					if(appVersion.getAuthorize().equalsIgnoreCase("yes")){
						authorizeOpsys++;
					}
					opsys++;
				}else if(appVersion.getAppType().equalsIgnoreCase("oa")){
					if(appVersion.getAuthorize().equalsIgnoreCase("yes")){
						authorizeOa++;
					}
					oa++;
				}else{
					if(appVersion.getAuthorize().equalsIgnoreCase("yes")){
						authorizeApp++;
					}
					app++;
				}
			}
										
			genericService.executeMethod("appCount",
					"updateCountNumById", new Class[] {Integer.class,Integer.class,Integer.class,Integer.class,Integer.class,Integer.class,Integer.class},
					new Object[] {appCount.getId(),authorizeOpsys,opsys,authorizeOa,oa,authorizeApp,app});
		}
				
		
		logger.debug("changeAppCount....... \n");

	}
	
}
