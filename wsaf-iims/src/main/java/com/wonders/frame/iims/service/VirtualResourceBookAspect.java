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
import com.wonders.frame.iims.model.bo.VirtualResource;
import com.wonders.frame.iims.model.bo.VirtualResourceBook;
import com.wonders.frame.iims.model.bo.WorkflowLog;



/**
 * 系统日志AOP
 * @author Administrator
 *
 */
@Component
@Aspect
public class VirtualResourceBookAspect {
	private static Logger logger=LoggerFactory.getLogger(VirtualResourceBookAspect.class);
	@Resource
	GenericService genericService;
	
	@Resource
	private WorkflowLogService workflowLogService;

	/**
	 * 指定切入点 
	 */
	@Pointcut("execution(* com.wonders.frame.iims.dao.VirtualResourceBookDao.save(..))")
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
		String ip=(String)ReflectUtil.invokeGet(obj, "ip");

		VirtualResource resource=(VirtualResource)genericService.executeMethod("virtualResource",
				"findFinishApplyByIp", new Class[] {String.class}, new Object[] {ip});
		
		boolean hasChange=false;
		String userName=(String)ReflectUtil.invokeGet(obj, "userName");
		Date applyUseTime=(Date)ReflectUtil.invokeGet(obj, "applyUseTime");
		String contactPhone=(String)ReflectUtil.invokeGet(obj, "contactPhone");
		Integer projectId=(Integer)ReflectUtil.invokeGet(obj, "projectId");
		String projectName=(String)ReflectUtil.invokeGet(obj, "projectName");
		String projectPrincipal=(String)ReflectUtil.invokeGet(obj, "projectPrincipal");
		String virtualServer=(String)ReflectUtil.invokeGet(obj, "virtualServer");
		String memory=(String)ReflectUtil.invokeGet(obj, "memory");
		String cpu=(String)ReflectUtil.invokeGet(obj, "cpu");
		String hardDisk=(String)ReflectUtil.invokeGet(obj, "hardDisk");
		String opsys=(String)ReflectUtil.invokeGet(obj, "opsys");
		String opsysDescription=(String)ReflectUtil.invokeGet(obj, "opsysDescription");
		String middleware=(String)ReflectUtil.invokeGet(obj, "middleware");
		String middlewareDescription=(String)ReflectUtil.invokeGet(obj, "middlewareDescription");
		String db=(String)ReflectUtil.invokeGet(obj, "db");
		String dbDescription=(String)ReflectUtil.invokeGet(obj, "dbDescription");		
		String sysName=(String)ReflectUtil.invokeGet(obj, "sysName");
		String hostName=(String)ReflectUtil.invokeGet(obj, "hostName");
		String software=(String)ReflectUtil.invokeGet(obj, "software");		
		String implementUser=(String)ReflectUtil.invokeGet(obj, "implementUser");
		Date implementTime=(Date)ReflectUtil.invokeGet(obj, "implementTime");
		String applyType=(String)ReflectUtil.invokeGet(obj, "applyType");		
		String applyDept=(String)ReflectUtil.invokeGet(obj, "applyDept");
		String applyDeptId=(String)ReflectUtil.invokeGet(obj, "applyDeptId");	
		String applyer=(String)ReflectUtil.invokeGet(obj, "applyer");
		String applyerLoginname=(String)ReflectUtil.invokeGet(obj, "applyerLoginname");
		Date applyTime=(Date)ReflectUtil.invokeGet(obj, "applyTime");
		String remarks=(String)ReflectUtil.invokeGet(obj, "remarks");
		
		Integer id=(Integer)ReflectUtil.invokeGet(obj, "id");
		if(!isValueEquals(resource.getApplyDept(),applyDept)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getProjectId(),projectId)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getProjectName(),projectName)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getProjectPrincipal(),projectPrincipal)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getVirtualServer(),virtualServer)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getMemory(),memory)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getCpu(),cpu)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getHardDisk(),hardDisk)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getOpsys(),opsys)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getOpsysDescription(),opsysDescription)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getMiddleware(),middleware)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getMiddlewareDescription(),middlewareDescription)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getDb(),db)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getDbDescription(),dbDescription)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getSysName(),sysName)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getHostName(),hostName)){
			hasChange=true;
		}
		else if(!isValueEquals(resource.getSoftware(),software)){
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
			resource=(VirtualResource)genericService.executeMethod("virtualResource",
					"updateAllDataById", 
					new Class[] {String.class,Date.class,String.class,String.class,
							String.class,String.class,String.class,String.class,
							String.class,String.class,String.class,String.class,
							String.class,String.class,String.class,String.class,
							String.class,String.class,String.class,String.class,
							Date.class,String.class,String.class,String.class,
							String.class,String.class,Date.class,String.class,
							Integer.class},
							new Object[] {userName,applyUseTime,contactPhone,projectId,
					projectName,projectPrincipal,virtualServer,memory,
					cpu,hardDisk,opsys,opsysDescription,
					middleware,middlewareDescription,db,dbDescription,
					sysName,hostName,software,implementUser,
					implementTime,applyType,applyDept,applyDeptId,
					applyer,applyerLoginname,applyTime,remarks,
					id});
		
			logger.debug("update VirtualResource success:id="+resource.getId()+" \n");
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
