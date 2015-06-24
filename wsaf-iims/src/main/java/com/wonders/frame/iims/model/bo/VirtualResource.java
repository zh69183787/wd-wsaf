package com.wonders.frame.iims.model.bo;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import com.wonders.frame.core.tags.ShowInView;
import com.wonders.frame.core.tags.ShowInView.OperateType;

/**
 * IimsVirtualResource entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_VIRTUAL_RESOURCE")
@ShowInView(name="虚拟化资源")
public class VirtualResource implements java.io.Serializable {
	@ShowInView(noUse=true)	
	private static final long serialVersionUID = -4683205757589562381L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="使用人姓名")
	private String userName;
	@ShowInView(name="申请使用时间")
	private Date applyUseTime;
	@ShowInView(name="联系电话")
	private String contactPhone;
	@ShowInView(name="所属项目ID")
	private Integer projectId;
	@ShowInView(name="所属项目")
	private String projectName;
	@ShowInView(name="项目负责人")
	private String projectPrincipal;
	@ShowInView(name="虚拟服务器")
	private String virtualServer;
	@ShowInView(name="内存")
	private String memory;
	@ShowInView(name="CPU")
	private String cpu;
	@ShowInView(name="硬盘")
	private String hardDisk;
	@ShowInView(name="操作系统")
	private String opsys;
	@ShowInView(name="操作系统描述")
	private String opsysDescription;
	@ShowInView(name="中间件")
	private String middleware;
	@ShowInView(name="中间件描述")
	private String middlewareDescription;
	@ShowInView(name="数据库")
	private String db;
	@ShowInView(name="数据库描述")
	private String dbDescription;
	@ShowInView(name="系统名")
	private String sysName;
	@ShowInView(name="主机名")
	private String hostName;
	@ShowInView(name="IP")
	private String ip;
	@ShowInView(name="安装软件")
	private String software;
	@ShowInView(name="办理人")
	private String implementUser;
	@ShowInView(name="办理时间")
	private Date implementTime;
	@ShowInView(name="申请类型",operateType=OperateType.SELECT,ccateType="wirelessApplyType")
	private String applyType;	
	@ShowInView(name="申请部门")
	private String applyDept;
	@ShowInView(name="申请部门ID")
	private String applyDeptId;	
	@ShowInView(name="申请人")
	private String applyer;
	@ShowInView(name="申请人工号")
	private String applyerLoginname;
	@NotNull(message="时间不可为空")
	@ShowInView(name="申请时间")	
	private Date applyTime;
	@ShowInView(name="提交人")
	private String initiator;
	@ShowInView(name="提交人工号")
	private String initiatorLoginname;
	@NotNull(message="时间不可为空")
	@ShowInView(name="提交时间")
	private Date initiateTime;
	@ShowInView(name="待处理人")
	private String handler;
	@ShowInView(name="待处理人工号")
	private String handlerLoginname;
	@ShowInView(name="建议&意见")
	private String suggestion;
	@ShowInView(name="审批状态",operateType=OperateType.SELECT,ccateType="virtualStatus")
	private String status;
	@ShowInView(name="备注")
	private String remarks;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;
	// Constructors

	/** default constructor */
	public VirtualResource() {
		this.removed=0;
	}

	/** minimal constructor */
	public VirtualResource(Integer id, String userName,
			Date applyUseTime, String contactPhone, String applyer,
			String applyerLoginname, Date applyTime, String initiator,
			String initiatorLoginname, Date initiateTime, Integer removed) {
		this.id = id;
		this.userName = userName;
		this.applyUseTime = applyUseTime;
		this.contactPhone = contactPhone;
		this.applyer = applyer;
		this.applyerLoginname = applyerLoginname;
		this.applyTime = applyTime;
		this.initiator = initiator;
		this.initiatorLoginname = initiatorLoginname;
		this.initiateTime = initiateTime;
		this.removed = removed;
	}

	/** full constructor */
	public VirtualResource(Integer id, String userName,
			Date applyUseTime, String contactPhone, Integer projectId,
			String projectName, String projectPrincipal, String virtualServer,
			String memory, String cpu, String hardDisk, String opsys,
			String opsysDescription, String middleware,
			String middlewareDescription, String db, String dbDescription,
			String sysName, String hostName,String ip,
			String software, String implementUser, Date implementTime,
			String applyType,String applyDept, String applyDeptId,
			String applyer, String applyerLoginname, Date applyTime,
			String initiator, String initiatorLoginname, Date initiateTime,
			String suggestion, String handler, String handlerLoginname,
			String status, String remarks, Integer removed) {
		this.id = id;
		this.userName = userName;
		this.applyUseTime = applyUseTime;
		this.contactPhone = contactPhone;
		this.projectId = projectId;
		this.projectName = projectName;
		this.projectPrincipal = projectPrincipal;
		this.virtualServer = virtualServer;
		this.memory = memory;
		this.cpu = cpu;
		this.hardDisk = hardDisk;
		this.opsys = opsys;
		this.opsysDescription = opsysDescription;
		this.middleware = middleware;
		this.middlewareDescription = middlewareDescription;
		this.db = db;
		this.dbDescription = dbDescription;
		this.sysName = sysName;
		this.hostName = hostName;
		this.ip = ip;
		this.software = software;
		this.implementUser = implementUser;
		this.implementTime = implementTime;
		this.applyType = applyType;		
		this.applyDept = applyDept;
		this.applyDeptId = applyDeptId;		
		this.applyer = applyer;
		this.applyerLoginname = applyerLoginname;
		this.applyTime = applyTime;
		this.initiator = initiator;
		this.initiatorLoginname = initiatorLoginname;
		this.initiateTime = initiateTime;
		this.suggestion = suggestion;
		this.handler = handler;
		this.handlerLoginname = handlerLoginname;
		this.status = status;
		this.remarks = remarks;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_virtual_resource",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "USER_NAME", nullable = false, length = 50)
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "APPLY_USE_TIME", nullable = false, length = 7)
	public Date getApplyUseTime() {
		return this.applyUseTime;
	}

	public void setApplyUseTime(Date applyUseTime) {
		this.applyUseTime = applyUseTime;
	}

	@Column(name = "CONTACT_PHONE", nullable = false, length = 50)
	public String getContactPhone() {
		return this.contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	@Column(name = "PROJECT_ID", precision = 22, scale = 0)
	public Integer getProjectId() {
		return this.projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	@Column(name = "PROJECT_NAME", length = 200)
	public String getProjectName() {
		return this.projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	@Column(name = "PROJECT_PRINCIPAL", length = 200)
	public String getProjectPrincipal() {
		return this.projectPrincipal;
	}

	public void setProjectPrincipal(String projectPrincipal) {
		this.projectPrincipal = projectPrincipal;
	}

	@Column(name = "VIRTUAL_SERVER", length = 200)
	public String getVirtualServer() {
		return this.virtualServer;
	}

	public void setVirtualServer(String virtualServer) {
		this.virtualServer = virtualServer;
	}

	@Column(name = "MEMORY", length = 200)
	public String getMemory() {
		return this.memory;
	}

	public void setMemory(String memory) {
		this.memory = memory;
	}

	@Column(name = "CPU", length = 200)
	public String getCpu() {
		return this.cpu;
	}

	public void setCpu(String cpu) {
		this.cpu = cpu;
	}

	@Column(name = "HARD_DISK", length = 200)
	public String getHardDisk() {
		return this.hardDisk;
	}

	public void setHardDisk(String hardDisk) {
		this.hardDisk = hardDisk;
	}

	@Column(name = "OPSYS", length = 200)
	public String getOpsys() {
		return this.opsys;
	}

	public void setOpsys(String opsys) {
		this.opsys = opsys;
	}

	@Column(name = "OPSYS_DESCRIPTION", length = 500)
	public String getOpsysDescription() {
		return this.opsysDescription;
	}

	public void setOpsysDescription(String opsysDescription) {
		this.opsysDescription = opsysDescription;
	}

	@Column(name = "MIDDLEWARE", length = 200)
	public String getMiddleware() {
		return this.middleware;
	}

	public void setMiddleware(String middleware) {
		this.middleware = middleware;
	}

	@Column(name = "MIDDLEWARE_DESCRIPTION", length = 500)
	public String getMiddlewareDescription() {
		return this.middlewareDescription;
	}

	public void setMiddlewareDescription(String middlewareDescription) {
		this.middlewareDescription = middlewareDescription;
	}

	@Column(name = "DB", length = 200)
	public String getDb() {
		return this.db;
	}

	public void setDb(String db) {
		this.db = db;
	}

	@Column(name = "DB_DESCRIPTION", length = 500)
	public String getDbDescription() {
		return this.dbDescription;
	}

	public void setDbDescription(String dbDescription) {
		this.dbDescription = dbDescription;
	}
	
	@Column(name = "SYS_NAME", length = 100)
	public String getSysName() {
		return this.sysName;
	}

	public void setSysName(String sysName) {
		this.sysName = sysName;
	}

	@Column(name = "HOST_NAME", length = 100)
	public String getHostName() {
		return this.hostName;
	}

	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	
	@Column(name = "IP", length = 20)
	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Column(name = "SOFTWARE", length = 200)
	public String getSoftware() {
		return this.software;
	}

	public void setSoftware(String software) {
		this.software = software;
	}
	
	@Column(name = "IMPLEMENT_USER", length = 100)
	public String getImplementUser() {
		return this.implementUser;
	}

	public void setImplementUser(String implementUser) {
		this.implementUser = implementUser;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "IMPLEMENT_TIME")
	public Date getImplementTime() {
		return this.implementTime;
	}

	public void setImplementTime(Date implementTime) {
		this.implementTime = implementTime;
	}
	
	
	@Column(name = "APPLY_TYPE", length = 50)
	public String getApplyType() {
		return this.applyType;
	}

	public void setApplyType(String applyType) {
		this.applyType = applyType;
	}

	
	@Column(name = "APPLY_DEPT", nullable = false, length = 50)
	public String getApplyDept() {
		return this.applyDept;
	}

	public void setApplyDept(String applyDept) {
		this.applyDept = applyDept;
	}

	@Column(name = "APPLY_DEPT_ID", nullable = false, length = 50)
	public String getApplyDeptId() {
		return this.applyDeptId;
	}

	public void setApplyDeptId(String applyDeptId) {
		this.applyDeptId = applyDeptId;
	}


	@Column(name = "APPLYER", nullable = false, length = 200)
	public String getApplyer() {
		return this.applyer;
	}

	public void setApplyer(String applyer) {
		this.applyer = applyer;
	}

	@Column(name = "APPLYER_LOGINNAME", nullable = false, length = 200)
	public String getApplyerLoginname() {
		return this.applyerLoginname;
	}

	public void setApplyerLoginname(String applyerLoginname) {
		this.applyerLoginname = applyerLoginname;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "APPLY_TIME", nullable = false, length = 7)
	public Date getApplyTime() {
		return this.applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	@Column(name = "INITIATOR", nullable = false, length = 200)
	public String getInitiator() {
		return this.initiator;
	}

	public void setInitiator(String initiator) {
		this.initiator = initiator;
	}

	@Column(name = "INITIATOR_LOGINNAME", nullable = false, length = 200)
	public String getInitiatorLoginname() {
		return this.initiatorLoginname;
	}

	public void setInitiatorLoginname(String initiatorLoginname) {
		this.initiatorLoginname = initiatorLoginname;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "INITIATE_TIME", nullable = false, length = 7)
	public Date getInitiateTime() {
		return this.initiateTime;
	}

	public void setInitiateTime(Date initiateTime) {
		this.initiateTime = initiateTime;
	}

	@Column(name = "SUGGESTION", length = 1500)
	public String getSuggestion() {
		return this.suggestion;
	}

	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}

	@Column(name = "HANDLER", length = 200)
	public String getHandler() {
		return this.handler;
	}

	public void setHandler(String handler) {
		this.handler = handler;
	}

	@Column(name = "HANDLER_LOGINNAME", length = 200)
	public String getHandlerLoginname() {
		return this.handlerLoginname;
	}

	public void setHandlerLoginname(String handlerLoginname) {
		this.handlerLoginname = handlerLoginname;
	}

	@Column(name = "STATUS", length = 50)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "REMARKS", length = 1500)
	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}