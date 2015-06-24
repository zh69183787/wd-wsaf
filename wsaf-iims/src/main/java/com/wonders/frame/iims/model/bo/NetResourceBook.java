package com.wonders.frame.iims.model.bo;

import java.math.BigDecimal;
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
 * IimsNetResource entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_NET_RESOURCE_BOOK")
@ShowInView(name="网络资源台帐")
public class NetResourceBook implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = -258645692993234845L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="使用人姓名")
	private String userName;
	@ShowInView(name="联系电话")
	private String contactPhone;
	@ShowInView(name="位置")
	private String usePlace;
	@ShowInView(name="申请业务类型",operateType=OperateType.SELECT,ccateType="netBusinessType")
	private String applyBusinessType;
	@ShowInView(name="申请使用时间")
	private Date applyUseTime;
	@ShowInView(name="用途")
	private String applyReason;
	@ShowInView(name="终端类型",operateType=OperateType.SELECT,ccateType="netTerminalType")
	private String equipmentType;
	@ShowInView(name="办理工程师")
	private String implementEngineer;
	@ShowInView(name="用户")
	private String implementUser;	
	@ShowInView(name="办理时间")
	private Date implementTime;
	@ShowInView(name="开通位置")
	private String implementPlace;
	@ShowInView(name="申请部门")
	private String applyDept;
	@ShowInView(name="申请部门ID")
	private String applyDeptId;
	@ShowInView(name="申请状态",operateType=OperateType.SELECT,ccateType="wirelessApplyType")	
	private String applyType;
	
	@ShowInView(name="职务")
	private String post;
	@ShowInView(name="交换机设备编号")
	private String switchDeviceCode;
	@ShowInView(name="端口")
	private String port;	
	@ShowInView(name="VLAN")
	private String vlan;
	@ShowInView(name="业务状态",operateType=OperateType.SELECT,ccateType="netStatus")
	private String netStatus;
	@ShowInView(name="接口信息")
	private String interfaceInfo;
	@ShowInView(name="IP地址/掩码")
	private String ip;
	@ShowInView(name="MAC地址")
	private String mac;
	@ShowInView(name="网关")
	private String gateway;
	@ShowInView(name="系统名")
	private String sysName;
	
	@ShowInView(name="申请人")
	private String applyer;
	@ShowInView(name="申请人工号")
	private String applyerLoginname;
	@ShowInView(name="申请时间")	
	private Date applyTime;	
	@ShowInView(name="备注")
	private String remarks;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public NetResourceBook() {
		this.removed=0;
	}

	/** minimal constructor */
	public NetResourceBook(Integer id, String userName, String contactPhone,
			String usePlace, String applyBusinessType, Date applyUseTime,
			String applyDept, String applyDeptId, String applyType,
			String applyer, String applyerLoginname, Date applyTime,
			String initiator, String initiatorLoginname, Date initiateTime,
			Integer removed) {
		this.id = id;
		this.userName = userName;
		this.contactPhone = contactPhone;
		this.usePlace = usePlace;
		this.applyBusinessType = applyBusinessType;
		this.applyUseTime = applyUseTime;
		this.applyDept = applyDept;
		this.applyDeptId = applyDeptId;
		this.applyType = applyType;
		this.applyer = applyer;
		this.applyerLoginname = applyerLoginname;
		this.applyTime = applyTime;
		this.removed = removed;
	}

	/** full constructor */
	public NetResourceBook(Integer id, String userName, String contactPhone,
			String usePlace, String applyBusinessType, Date applyUseTime,
			String applyReason, String equipmentType,String implementEngineer,String implementUser, Date implementTime,
			String implementPlace, String applyDept, String applyDeptId,
			String post, String switchDeviceCode,String port,String vlan, String netStatus,
			String interfaceInfo, String ip, String mac,String gateway, String sysName,
			String applyType, String applyer, String applyerLoginname,
			Date applyTime, String initiator, String initiatorLoginname,
			Date initiateTime, String suggestion, String handler,
			String handlerLoginname, String status, String remarks,
			Integer removed) {
		this.id = id;
		this.userName = userName;
		this.contactPhone = contactPhone;
		this.usePlace = usePlace;
		this.applyBusinessType = applyBusinessType;
		this.applyUseTime = applyUseTime;
		this.applyReason = applyReason;
		this.equipmentType = equipmentType;
		this.implementEngineer = implementEngineer;
		this.implementUser = implementUser;
		this.implementTime = implementTime;
		this.implementPlace = implementPlace;
		
		this.post = post;
		this.switchDeviceCode = switchDeviceCode;
		this.port = port;
		this.vlan = vlan;
		this.netStatus = netStatus;
		this.interfaceInfo = interfaceInfo;
		this.ip = ip;
		this.mac = mac;
		this.gateway = gateway;
		this.sysName = sysName;
		
		this.applyDept = applyDept;
		this.applyDeptId = applyDeptId;
		this.applyType = applyType;
		this.applyer = applyer;
		this.applyerLoginname = applyerLoginname;
		this.applyTime = applyTime;
		this.remarks = remarks;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_net_resource_b",allocationSize=1)
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

	@Column(name = "CONTACT_PHONE", nullable = false, length = 50)
	public String getContactPhone() {
		return this.contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	@Column(name = "USE_PLACE", nullable = false, length = 500)
	public String getUsePlace() {
		return this.usePlace;
	}

	public void setUsePlace(String usePlace) {
		this.usePlace = usePlace;
	}

	@Column(name = "APPLY_BUSINESS_TYPE", nullable = false, length = 50)
	public String getApplyBusinessType() {
		return this.applyBusinessType;
	}

	public void setApplyBusinessType(String applyBusinessType) {
		this.applyBusinessType = applyBusinessType;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "APPLY_USE_TIME", nullable = false, length = 7)
	public Date getApplyUseTime() {
		return this.applyUseTime;
	}

	public void setApplyUseTime(Date applyUseTime) {
		this.applyUseTime = applyUseTime;
	}

	@Column(name = "APPLY_REASON", length = 1000)
	public String getApplyReason() {
		return this.applyReason;
	}

	public void setApplyReason(String applyReason) {
		this.applyReason = applyReason;
	}
	@Column(name = "EQUIPMENT_TYPE", length = 50)
	public String getEquipmentType() {
		return equipmentType;
	}

	public void setEquipmentType(String equipmentType) {
		this.equipmentType = equipmentType;
	}
	
	@Column(name = "IMPLEMENT_ENGINEER", length = 50)
	public String getImplementEngineer() {
		return this.implementEngineer;
	}

	public void setImplementEngineer(String implementEngineer) {
		this.implementEngineer = implementEngineer;
	}
	
	@Column(name = "IMPLEMENT_USER", length = 50)
	public String getImplementUser() {
		return this.implementUser;
	}

	public void setImplementUser(String implementUser) {
		this.implementUser = implementUser;
	}
	
	@Temporal(TemporalType.DATE)
	@Column(name = "IMPLEMENT_TIME", length = 7)
	public Date getImplementTime() {
		return this.implementTime;
	}

	public void setImplementTime(Date implementTime) {
		this.implementTime = implementTime;
	}

	@Column(name = "IMPLEMENT_PLACE", length = 500)
	public String getImplementPlace() {
		return this.implementPlace;
	}

	public void setImplementPlace(String implementPlace) {
		this.implementPlace = implementPlace;
	}
	
	@Column(name = "POST", length = 50)
	public String getPost() {
		return this.post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	@Column(name = "SWITCH_DEVICE_CODE", length = 100)
	public String getSwitchDeviceCode() {
		return this.switchDeviceCode;
	}

	public void setSwitchDeviceCode(String switchDeviceCode) {
		this.switchDeviceCode = switchDeviceCode;
	}

	@Column(name = "PORT", length = 10)
	public String getPort() {
		return this.port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	@Column(name = "VLAN", length = 50)
	public String getVlan() {
		return this.vlan;
	}

	public void setVlan(String vlan) {
		this.vlan = vlan;
	}

	@Column(name = "NET_STATUS", length = 50)
	public String getNetStatus() {
		return this.netStatus;
	}

	public void setNetStatus(String netStatus) {
		this.netStatus = netStatus;
	}

	@Column(name = "INTERFACE_INFO", length = 100)
	public String getInterfaceInfo() {
		return this.interfaceInfo;
	}

	public void setInterfaceInfo(String interfaceInfo) {
		this.interfaceInfo = interfaceInfo;
	}

	@Column(name = "IP", length = 50)
	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Column(name = "MAC", length = 50)
	public String getMac() {
		return this.mac;
	}

	public void setMac(String mac) {
		this.mac = mac;
	}

	@Column(name = "GATEWAY", length = 20)
	public String getGateway() {
		return this.gateway;
	}

	public void setGateway(String gateway) {
		this.gateway = gateway;
	}

	@Column(name = "SYS_NAME", length = 100)
	public String getSysName() {
		return this.sysName;
	}

	public void setSysName(String sysName) {
		this.sysName = sysName;
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

	@Column(name = "APPLY_TYPE", nullable = false, length = 50)
	public String getApplyType() {
		return this.applyType;
	}

	public void setApplyType(String applyType) {
		this.applyType = applyType;
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