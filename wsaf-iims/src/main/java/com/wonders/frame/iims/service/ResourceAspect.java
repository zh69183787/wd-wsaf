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
import com.wonders.frame.iims.model.bo.AccountResourceBook;
import com.wonders.frame.iims.model.bo.InternetResourceBook;
import com.wonders.frame.iims.model.bo.NetResourceBook;
import com.wonders.frame.iims.model.bo.VirtualResourceBook;
import com.wonders.frame.iims.model.bo.VpnResourceBook;
import com.wonders.frame.iims.model.bo.WirelessResourceBook;
import com.wonders.frame.iims.model.bo.WorkflowLog;



/**
 * 系统日志AOP
 * @author Administrator
 *
 */
@Component
@Aspect
public class ResourceAspect {
	private static Logger logger=LoggerFactory.getLogger(ResourceAspect.class);
	@Resource
	GenericService genericService;
	
	@Resource
	private WorkflowLogService workflowLogService;

	/**
	 * 指定切入点 
	 */
	@Pointcut("execution(* com.wonders.frame.iims.dao.*ResourceDao.save(..))")
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
		//获取操作内容
		String pType=StringUtils.uncapitalize(obj.getClass().getSimpleName());
		Integer pId=(Integer)ReflectUtil.invokeGet(obj, "id");		
		String initiator=(String)ReflectUtil.invokeGet(obj, "initiator");
		String initiatorLoginname=(String)ReflectUtil.invokeGet(obj, "initiatorLoginname");
		String suggestion=(String)ReflectUtil.invokeGet(obj, "suggestion");
		String handler=(String)ReflectUtil.invokeGet(obj, "handler");
		String handlerLoginname=(String)ReflectUtil.invokeGet(obj, "handlerLoginname");	
		String statusCode=(String)ReflectUtil.invokeGet(obj, "status");
		String applyTypeCode=(String)ReflectUtil.invokeGet(obj, "applyType");
		//获取项目状态和审核状态的中文显示名
		EntityProperty entityProperty=ReflectUtil.getEntityProperty(obj.getClass(),"applyType,status","true");
		List<FieldProperty> fieldProperties= entityProperty.getFieldProperties();
		int applyTypeIndex=-1;
		int statusIndex=-1;
		for(int i=0;i<fieldProperties.size();i++){
			FieldProperty fieldProperty=fieldProperties.get(i);
			if(fieldProperty.getPath().equalsIgnoreCase("applyType")){
				applyTypeIndex=i;
			}else{
				statusIndex=i;
			}
			
		}
		
		FieldProperty applyTypeProperty=fieldProperties.get(applyTypeIndex);
		String applyType=applyTypeProperty.getOption().get(applyTypeCode);
		
		FieldProperty statusProperty=fieldProperties.get(statusIndex);
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
		
		if(flowLogs!=null && flowLogs.size()>0){
			for(int k=0;k<flowLogs.size();k++){
			
				WorkflowLog existUnHandleWorkflowLog=flowLogs.get(k);
				String curStatus=existUnHandleWorkflowLog.getStatus();
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
			}
		}
		String title=entityProperty.getCnName()+applyType;
		String stepName=status;
		String processName="信息化"+entityProperty.getCnName();
		//默认发送待办事项及短信		
		//记录流转日志并发送待办项及短信
		workflowLogService.addLogAndSendTodoItemAndSendShortMsg(processName,title,pType,pId,initiator,initiatorLoginname,
				suggestion,handler,handlerLoginname,stepName,todoAppUrl,addTaskApiUrl,true);
		
		
		if(statusCode!=null && statusCode.equalsIgnoreCase("finish")){
			
			if(applyTypeCode!=null&&(applyTypeCode.equalsIgnoreCase("apply")||applyTypeCode.equalsIgnoreCase("change"))){
				if(pType.equalsIgnoreCase("wirelessResource")){
					insertWirelessResourceBook(obj);
				}else if(pType.equalsIgnoreCase("netResource")){
					insertNetResourceBook(obj);
				}else if(pType.equalsIgnoreCase("internetResource")){
					insertInternetResourceBook(obj);
				}else if(pType.equalsIgnoreCase("accountResource")){
					insertAccountResourceBook(obj);
				}else if(pType.equalsIgnoreCase("vpnResource")){
					insertVpnResourceBook(obj);
				}else if(pType.equalsIgnoreCase("virtualResource")){
					insertVirtualResourceBook(obj);
				}
			}else if(applyTypeCode!=null&&applyTypeCode.equalsIgnoreCase("cancel")){
				if(pType.equalsIgnoreCase("wirelessResource")){
					removeWirelessResourceBook(obj);
				}else if(pType.equalsIgnoreCase("netResource")){
					removeNetResourceBook(obj);
				}else if(pType.equalsIgnoreCase("internetResource")){
					removeInternetResourceBook(obj);
				}else if(pType.equalsIgnoreCase("accountResource")){
					removeAccountResourceBook(obj);
				}else if(pType.equalsIgnoreCase("vpnResource")){
					removeVpnResourceBook(obj);
				}else if(pType.equalsIgnoreCase("virtualResource")){
					removeVirtualResourceBook(obj);
				}
			}
		}
		logger.debug("finish record workflowLog....... \n");

	}
	
	private void insertWirelessResourceBook(Object obj){
		WirelessResourceBook book = new WirelessResourceBook();
		book.setAccountName((String)ReflectUtil.invokeGet(obj, "accountName"));
		book.setApplyBusinessType((String)ReflectUtil.invokeGet(obj, "applyBusinessType"));
		book.setBusinessCode((String)ReflectUtil.invokeGet(obj, "businessCode"));
		book.setStartDate((Date)ReflectUtil.invokeGet(obj, "startDate"));
		book.setEndDate((Date)ReflectUtil.invokeGet(obj, "endDate"));		
		book.setCompanyName((String)ReflectUtil.invokeGet(obj, "companyName"));
		book.setStaffCardId((String)ReflectUtil.invokeGet(obj, "staffCardId"));
		book.setApplyDept((String)ReflectUtil.invokeGet(obj, "applyDept"));
		book.setApplyDeptId((String)ReflectUtil.invokeGet(obj, "applyDeptId"));
		book.setApplyer((String)ReflectUtil.invokeGet(obj, "applyer"));
		book.setApplyerLoginname((String)ReflectUtil.invokeGet(obj, "applyerLoginname"));
		book.setApplyReason((String)ReflectUtil.invokeGet(obj, "applyReason"));
		book.setApplyTime((Date)ReflectUtil.invokeGet(obj, "applyTime"));
		book.setApplyType((String)ReflectUtil.invokeGet(obj, "applyType"));
		book.setApplyUseTime((Date)ReflectUtil.invokeGet(obj, "applyUseTime"));
		book.setContactPhone((String)ReflectUtil.invokeGet(obj, "contactPhone"));
		book.setEquipmentType((String)ReflectUtil.invokeGet(obj, "equipmentType"));
		book.setHandledCondition((String)ReflectUtil.invokeGet(obj, "handledCondition"));
		book.setImplementEngineer((String)ReflectUtil.invokeGet(obj, "implementEngineer"));
		book.setImplementUser((String)ReflectUtil.invokeGet(obj, "implementUser"));
		book.setImplementTime((Date)ReflectUtil.invokeGet(obj, "implementTime"));
		book.setMacAddress((String)ReflectUtil.invokeGet(obj, "macAddress"));
		book.setRemarks((String)ReflectUtil.invokeGet(obj, "remarks"));
		book.setUsePlace((String)ReflectUtil.invokeGet(obj, "usePlace"));
		book.setUsePosition((String)ReflectUtil.invokeGet(obj, "usePosition"));
		book.setUsePosition2((String)ReflectUtil.invokeGet(obj, "usePosition2"));				
		book.setUserName((String)ReflectUtil.invokeGet(obj, "userName"));
		book.setUserPost((String)ReflectUtil.invokeGet(obj, "userPost"));
		book.setRemoved(0);
		
		book=(WirelessResourceBook)genericService.executeMethod("wirelessResourceBook",
				"save", new Class[] {Object.class}, new Object[] {book});
		
		logger.debug("insert new record to wirelessResourceBook success:id="+book.getId()+" \n");
	}
	
	private void removeWirelessResourceBook(Object obj){
		String macAddress=(String)ReflectUtil.invokeGet(obj, "macAddress");
		Integer successNum=(Integer)genericService.executeMethod("wirelessResourceBook",
				"removedByMacAddress", new Class[] {String.class}, new Object[] {macAddress});
	
		logger.debug(successNum+"record update success:update wirelessResourceBook set removed=1 where macAddress='"+macAddress+"' \n");
	}
	
	private void insertNetResourceBook(Object obj){
		NetResourceBook book = new NetResourceBook();		
		book.setUserName((String)ReflectUtil.invokeGet(obj, "userName"));
		book.setContactPhone((String)ReflectUtil.invokeGet(obj, "contactPhone"));
		book.setUsePlace((String)ReflectUtil.invokeGet(obj, "usePlace"));
		book.setApplyBusinessType((String)ReflectUtil.invokeGet(obj, "applyBusinessType"));
		book.setApplyUseTime((Date)ReflectUtil.invokeGet(obj, "applyUseTime"));
		book.setApplyReason((String)ReflectUtil.invokeGet(obj, "applyReason"));
		book.setEquipmentType((String)ReflectUtil.invokeGet(obj, "equipmentType"));
		book.setImplementEngineer((String)ReflectUtil.invokeGet(obj, "implementEngineer"));
		book.setImplementUser((String)ReflectUtil.invokeGet(obj, "implementUser"));
		book.setImplementTime((Date)ReflectUtil.invokeGet(obj, "implementTime"));
		book.setImplementPlace((String)ReflectUtil.invokeGet(obj, "implementPlace"));
		book.setApplyDept((String)ReflectUtil.invokeGet(obj, "applyDept"));
		book.setApplyDeptId((String)ReflectUtil.invokeGet(obj, "applyDeptId"));		
		book.setApplyType((String)ReflectUtil.invokeGet(obj, "applyType"));
		book.setPost((String)ReflectUtil.invokeGet(obj, "post"));
		book.setSwitchDeviceCode((String)ReflectUtil.invokeGet(obj, "switchDeviceCode"));
		book.setPort((String)ReflectUtil.invokeGet(obj, "port"));
		book.setVlan((String)ReflectUtil.invokeGet(obj, "vlan"));
		book.setNetStatus((String)ReflectUtil.invokeGet(obj, "netStatus"));
		book.setInterfaceInfo((String)ReflectUtil.invokeGet(obj, "interfaceInfo"));
		book.setIp((String)ReflectUtil.invokeGet(obj, "ip"));
		book.setMac((String)ReflectUtil.invokeGet(obj, "mac"));
		book.setGateway((String)ReflectUtil.invokeGet(obj, "gateway"));
		book.setSysName((String)ReflectUtil.invokeGet(obj, "sysName"));		
		book.setApplyer((String)ReflectUtil.invokeGet(obj, "applyer"));
		book.setApplyerLoginname((String)ReflectUtil.invokeGet(obj, "applyerLoginname"));
		book.setApplyTime((Date)ReflectUtil.invokeGet(obj, "applyTime"));
		book.setRemarks((String)ReflectUtil.invokeGet(obj, "remarks"));
		book.setRemoved(0);
		
		book=(NetResourceBook)genericService.executeMethod("netResourceBook",
				"save", new Class[] {Object.class}, new Object[] {book});
		
		logger.debug("insert new record to netResourceBook success:id="+book.getId()+" \n");
	}
	
	private void removeNetResourceBook(Object obj){
		String switchDeviceCode=(String)ReflectUtil.invokeGet(obj, "switchDeviceCode");
		String port=(String)ReflectUtil.invokeGet(obj, "port");
		Integer successNum=(Integer)genericService.executeMethod("netResourceBook",
				"removedBySwitchDeviceCodeAndPort", new Class[] {String.class,String.class}, new Object[] {switchDeviceCode,port});
	
		logger.debug(successNum+"record update success:update netResourceBook set removed=1 where switchDeviceCode='"+switchDeviceCode+"' and port='"+port+"'\n");
	}
	
	private void insertAccountResourceBook(Object obj){
		AccountResourceBook book = new AccountResourceBook();		
		book.setUserName((String)ReflectUtil.invokeGet(obj, "userName"));
		book.setContactPhone((String)ReflectUtil.invokeGet(obj, "contactPhone"));
		book.setDept((String)ReflectUtil.invokeGet(obj, "dept"));
		book.setPost((String)ReflectUtil.invokeGet(obj, "post"));
		book.setSysName((String)ReflectUtil.invokeGet(obj, "sysName"));	
		book.setLoginName((String)ReflectUtil.invokeGet(obj, "loginName"));	
		book.setApplyBusinessType((String)ReflectUtil.invokeGet(obj, "applyBusinessType"));
		book.setApplyUseTime((Date)ReflectUtil.invokeGet(obj, "applyUseTime"));
		book.setApplyReason((String)ReflectUtil.invokeGet(obj, "applyReason"));
		book.setImplementEngineer((String)ReflectUtil.invokeGet(obj, "implementEngineer"));
		book.setImplementUser((String)ReflectUtil.invokeGet(obj, "implementUser"));
		book.setImplementTime((Date)ReflectUtil.invokeGet(obj, "implementTime"));
		book.setAccountName((String)ReflectUtil.invokeGet(obj, "accountName"));
		book.setPlace((String)ReflectUtil.invokeGet(obj, "place"));
		book.setApplyDept((String)ReflectUtil.invokeGet(obj, "applyDept"));
		book.setApplyDeptId((String)ReflectUtil.invokeGet(obj, "applyDeptId"));		
		book.setApplyType((String)ReflectUtil.invokeGet(obj, "applyType"));
		book.setApplyer((String)ReflectUtil.invokeGet(obj, "applyer"));
		book.setApplyerLoginname((String)ReflectUtil.invokeGet(obj, "applyerLoginname"));
		book.setApplyTime((Date)ReflectUtil.invokeGet(obj, "applyTime"));
		book.setRemarks((String)ReflectUtil.invokeGet(obj, "remarks"));
		book.setRemoved(0);
		
		book=(AccountResourceBook)genericService.executeMethod("accountResourceBook",
				"save", new Class[] {Object.class}, new Object[] {book});
		
		logger.debug("insert new record to accountResourceBook success:id="+book.getId()+" \n");
	}
	
	private void removeAccountResourceBook(Object obj){
		String accountName=(String)ReflectUtil.invokeGet(obj, "accountName");
		Integer successNum=(Integer)genericService.executeMethod("accountResourceBook",
				"removedByAccountName", new Class[] {String.class}, new Object[] {accountName});
	
		logger.debug(successNum+"record update success:update accountResourceBook set removed=1 where accountName='"+accountName+"'\n");
	}
	
	private void insertInternetResourceBook(Object obj){
		InternetResourceBook book = new InternetResourceBook();
		book.setUserName((String)ReflectUtil.invokeGet(obj, "userName"));
		book.setContactPhone((String)ReflectUtil.invokeGet(obj, "contactPhone"));
		book.setUsePlace((String)ReflectUtil.invokeGet(obj, "usePlace"));		
		book.setDept((String)ReflectUtil.invokeGet(obj, "dept"));	
		book.setPost((String)ReflectUtil.invokeGet(obj, "post"));	
		book.setEquipmentType((String)ReflectUtil.invokeGet(obj, "equipmentType"));
		book.setApplyUseTime((Date)ReflectUtil.invokeGet(obj, "applyUseTime"));
		book.setApplyReason((String)ReflectUtil.invokeGet(obj, "applyReason"));		
		book.setImplementEngineer((String)ReflectUtil.invokeGet(obj, "implementEngineer"));
		book.setImplementUser((String)ReflectUtil.invokeGet(obj, "implementUser"));
		book.setImplementTime((Date)ReflectUtil.invokeGet(obj, "implementTime"));
		book.setImplementPlace((String)ReflectUtil.invokeGet(obj, "implementPlace"));		
		book.setApplyBusinessType((String)ReflectUtil.invokeGet(obj, "applyBusinessType"));
		book.setApplyDept((String)ReflectUtil.invokeGet(obj, "applyDept"));
		book.setApplyDeptId((String)ReflectUtil.invokeGet(obj, "applyDeptId"));
		book.setApplyType((String)ReflectUtil.invokeGet(obj, "applyType"));
		book.setApplyer((String)ReflectUtil.invokeGet(obj, "applyer"));
		book.setApplyerLoginname((String)ReflectUtil.invokeGet(obj, "applyerLoginname"));
		book.setApplyTime((Date)ReflectUtil.invokeGet(obj, "applyTime"));
		book.setRemarks((String)ReflectUtil.invokeGet(obj, "remarks"));
		book.setRemoved(0);
		
		book=(InternetResourceBook)genericService.executeMethod("internetResourceBook",
				"save", new Class[] {Object.class}, new Object[] {book});
		
		logger.debug("insert new record to internetResourceBook success:id="+book.getId()+" \n");
	}
	
	private void removeInternetResourceBook(Object obj){
		String implementUser=(String)ReflectUtil.invokeGet(obj, "implementUser");
		Integer successNum=(Integer)genericService.executeMethod("internetResourceBook",
				"removedByImplementUser", new Class[] {String.class}, new Object[] {implementUser});
	
		logger.debug(successNum+"record update success:update internetResourceBook set removed=1 where implementUser='"+implementUser+"'\n");
	}
	
	private void insertVpnResourceBook(Object obj){
		VpnResourceBook book = new VpnResourceBook();
		book.setUserName((String)ReflectUtil.invokeGet(obj, "userName"));
		book.setContactPhone((String)ReflectUtil.invokeGet(obj, "contactPhone"));
		book.setApplyBusinessType((String)ReflectUtil.invokeGet(obj, "applyBusinessType"));
		book.setApplyUseTime((Date)ReflectUtil.invokeGet(obj, "applyUseTime"));
		book.setApplyReason((String)ReflectUtil.invokeGet(obj, "applyReason"));		
		book.setImplementEngineer((String)ReflectUtil.invokeGet(obj, "implementEngineer"));
		book.setImplementUser((String)ReflectUtil.invokeGet(obj, "implementUser"));
		book.setImplementTime((Date)ReflectUtil.invokeGet(obj, "implementTime"));
		book.setAccountName((String)ReflectUtil.invokeGet(obj, "accountName"));
		book.setPost((String)ReflectUtil.invokeGet(obj, "post"));	
		book.setPermissions((String)ReflectUtil.invokeGet(obj, "permissions"));
		book.setUserGroup((String)ReflectUtil.invokeGet(obj, "userGroup"));	
		book.setApplyDept((String)ReflectUtil.invokeGet(obj, "applyDept"));
		book.setApplyDeptId((String)ReflectUtil.invokeGet(obj, "applyDeptId"));
		book.setApplyType((String)ReflectUtil.invokeGet(obj, "applyType"));
		book.setApplyer((String)ReflectUtil.invokeGet(obj, "applyer"));
		book.setApplyerLoginname((String)ReflectUtil.invokeGet(obj, "applyerLoginname"));
		book.setApplyTime((Date)ReflectUtil.invokeGet(obj, "applyTime"));
		book.setRemarks((String)ReflectUtil.invokeGet(obj, "remarks"));
		book.setRemoved(0);
		
		book=(VpnResourceBook)genericService.executeMethod("vpnResourceBook",
				"save", new Class[] {Object.class}, new Object[] {book});
		
		logger.debug("insert new record to vpnResourceBook success:id="+book.getId()+" \n");
	}
	
	private void removeVpnResourceBook(Object obj){
		String accountName=(String)ReflectUtil.invokeGet(obj, "accountName");
		Integer successNum=(Integer)genericService.executeMethod("vpnResourceBook",
				"removedByAccountName", new Class[] {String.class}, new Object[] {accountName});
	
		logger.debug(successNum+"record update success:update vpnResourceBook set removed=1 where accountName='"+accountName+"'\n");
	}
	
	private void insertVirtualResourceBook(Object obj){
		VirtualResourceBook book = new VirtualResourceBook();
		book.setUserName((String)ReflectUtil.invokeGet(obj, "userName"));
		book.setApplyUseTime((Date)ReflectUtil.invokeGet(obj, "applyUseTime"));
		book.setContactPhone((String)ReflectUtil.invokeGet(obj, "contactPhone"));
		book.setProjectId((Integer)ReflectUtil.invokeGet(obj, "projectId"));
		book.setProjectName((String)ReflectUtil.invokeGet(obj, "projectName"));
		book.setProjectPrincipal((String)ReflectUtil.invokeGet(obj, "projectPrincipal"));
		book.setVirtualServer((String)ReflectUtil.invokeGet(obj, "virtualServer"));
		book.setMemory((String)ReflectUtil.invokeGet(obj, "memory"));
		book.setCpu((String)ReflectUtil.invokeGet(obj, "cpu"));
		book.setHardDisk((String)ReflectUtil.invokeGet(obj, "hardDisk"));
		book.setOpsys((String)ReflectUtil.invokeGet(obj, "opsys"));
		book.setOpsysDescription((String)ReflectUtil.invokeGet(obj, "opsysDescription"));
		book.setMiddleware((String)ReflectUtil.invokeGet(obj, "middleware"));
		book.setMiddlewareDescription((String)ReflectUtil.invokeGet(obj, "middlewareDescription"));
		book.setDb((String)ReflectUtil.invokeGet(obj, "db"));
		book.setDbDescription((String)ReflectUtil.invokeGet(obj, "dbDescription"));		
		book.setSysName((String)ReflectUtil.invokeGet(obj, "sysName"));
		book.setHostName((String)ReflectUtil.invokeGet(obj, "hostName"));
		book.setIp((String)ReflectUtil.invokeGet(obj, "ip"));
		book.setSoftware((String)ReflectUtil.invokeGet(obj, "software"));		
		book.setImplementUser((String)ReflectUtil.invokeGet(obj, "implementUser"));
		book.setImplementTime((Date)ReflectUtil.invokeGet(obj, "implementTime"));
		book.setApplyType((String)ReflectUtil.invokeGet(obj, "applyType"));		
		book.setApplyDept((String)ReflectUtil.invokeGet(obj, "applyDept"));
		book.setApplyDeptId((String)ReflectUtil.invokeGet(obj, "applyDeptId"));	
		book.setApplyer((String)ReflectUtil.invokeGet(obj, "applyer"));
		book.setApplyerLoginname((String)ReflectUtil.invokeGet(obj, "applyerLoginname"));
		book.setApplyTime((Date)ReflectUtil.invokeGet(obj, "applyTime"));
		book.setRemarks((String)ReflectUtil.invokeGet(obj, "remarks"));
		book.setRemoved(0);
		
		book=(VirtualResourceBook)genericService.executeMethod("virtualResourceBook",
				"save", new Class[] {Object.class}, new Object[] {book});
		
		logger.debug("insert new record to virtualResourceBook success:id="+book.getId()+" \n");
	}
	
	private void removeVirtualResourceBook(Object obj){
		String ip=(String)ReflectUtil.invokeGet(obj, "ip");
		Integer successNum=(Integer)genericService.executeMethod("virtualResourceBook",
				"removedByIp", new Class[] {String.class}, new Object[] {ip});
	
		logger.debug(successNum+"record update success:update virtualResourceBook set removed=1 where ip='"+ip+"'\n");
	}
}
