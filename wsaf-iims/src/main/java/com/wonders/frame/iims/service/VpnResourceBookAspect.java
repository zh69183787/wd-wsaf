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
import org.springframework.data.repository.query.Param;
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
import com.wonders.frame.iims.model.bo.VpnResource;
import com.wonders.frame.iims.model.bo.VpnResourceBook;
import com.wonders.frame.iims.model.bo.WorkflowLog;



/**
 * 系统日志AOP
 * @author Administrator
 *
 */
@Component
@Aspect
public class VpnResourceBookAspect {
	private static Logger logger=LoggerFactory.getLogger(VpnResourceBookAspect.class);
	@Resource
	GenericService genericService;
	
	@Resource
	private WorkflowLogService workflowLogService;

	/**
	 * 指定切入点 
	 */
	@Pointcut("execution(* com.wonders.frame.iims.dao.VpnResourceBookDao.save(..))")
	public void saveOrUpdateResource(){}
	/**
	 * 添加操作日志(后置通知) 
	 * @param joinPoint
	 * @param rtv
	 */
	
	@AfterReturning(value="saveOrUpdateResource()",argNames="rtv", returning="rtv")
	public void addResourceLog(JoinPoint joinPoint, Object rtv) throws Throwable{
		logger.debug("start record workflowLog....... \n");
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder .getRequestAttributes()).getRequest();
		Object obj = joinPoint.getArgs()[0];
		String accountName=(String)ReflectUtil.invokeGet(obj, "accountName");

		VpnResource resource=(VpnResource)genericService.executeMethod("vpnResource",
				"findFinishApplyByAccountName", new Class[] {String.class}, new Object[] {accountName});
		boolean hasChange=false;
		
		String userName=(String)ReflectUtil.invokeGet(obj, "userName");
		String contactPhone=(String)ReflectUtil.invokeGet(obj, "contactPhone");
		String applyBusinessType=(String)ReflectUtil.invokeGet(obj, "applyBusinessType");
		Date applyUseTime=(Date)ReflectUtil.invokeGet(obj, "applyUseTime");
		String applyReason=(String)ReflectUtil.invokeGet(obj, "applyReason");		
		String implementEngineer=(String)ReflectUtil.invokeGet(obj, "implementEngineer");
		String implementUser=(String)ReflectUtil.invokeGet(obj, "implementUser");
		Date implementTime=(Date)ReflectUtil.invokeGet(obj, "implementTime");
		String post=(String)ReflectUtil.invokeGet(obj, "post");	
		String permissions=(String)ReflectUtil.invokeGet(obj, "permissions");
		String userGroup=(String)ReflectUtil.invokeGet(obj, "userGroup");	
		String applyDept=(String)ReflectUtil.invokeGet(obj, "applyDept");
		String applyDeptId=(String)ReflectUtil.invokeGet(obj, "applyDeptId");
		String applyType=(String)ReflectUtil.invokeGet(obj, "applyType");
		String applyer=(String)ReflectUtil.invokeGet(obj, "applyer");
		String applyerLoginname=(String)ReflectUtil.invokeGet(obj, "applyerLoginname");
		Date applyTime=(Date)ReflectUtil.invokeGet(obj, "applyTime");
		String remarks=(String)ReflectUtil.invokeGet(obj, "remarks");
		
		Integer id=(Integer)ReflectUtil.invokeGet(obj, "id");
		if(!isValueEquals(resource.getAccountName(),accountName)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getApplyBusinessType(),applyBusinessType)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getPost(),post)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getPermissions(),permissions)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getUserGroup(),userGroup)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getApplyDept(),applyDept)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getApplyDeptId(),applyDeptId)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getApplyer(),applyer)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getApplyerLoginname(),applyerLoginname)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getApplyReason(),applyReason)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getApplyTime(),applyTime)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getApplyType(),applyType)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getApplyUseTime(),applyUseTime)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getContactPhone(),contactPhone)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getImplementEngineer(),implementEngineer)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getImplementUser(),implementUser)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getImplementTime(),implementTime)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getRemarks(),remarks)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getUserName(),userName)){
			hasChange=true;
		}
		
		
		
		
		if(hasChange){
			resource=(VpnResource)genericService.executeMethod("vpnResource",
					"updateAllDataById", 
					new Class[] {String.class,String.class,String.class,Date.class,
					String.class,String.class,String.class,Date.class,
					String.class,String.class,String.class,String.class,
					String.class,String.class,String.class,String.class,
					Date.class,String.class,Integer.class},
							new Object[] {userName,contactPhone,applyBusinessType,applyUseTime,
					applyReason,implementEngineer,implementUser,implementTime,
					post,permissions,userGroup,applyDept,
					applyDeptId,applyType,applyer,applyerLoginname,
					applyTime,remarks,id});
		
			logger.debug("update VpnResource success:id="+resource.getId()+" \n");
		}
		logger.debug("finish record workflowLog....... \n");

	}
	
	private boolean isValueEquals(Object obj1,Object obj2){
		boolean isEqual=false;
		if(obj1!=null){
			isEqual=obj1.equals(obj2);
		}else{
			isEqual=(obj2==null);
		}
		return isEqual;
	}
	
}
