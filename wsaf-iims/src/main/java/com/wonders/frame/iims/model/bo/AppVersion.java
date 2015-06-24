package com.wonders.frame.iims.model.bo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.wonders.frame.core.tags.ShowInView;
import com.wonders.frame.core.tags.ShowInView.OperateType;

/**
 * IimsAppVersion entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_APP_VERSION")
@ShowInView(name="正版化")
public class AppVersion implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 5922097249152193752L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="部门",operateType=OperateType.SELECT,ccateType="appDept")
	private String dept;
	@ShowInView(name="设备编号")
	private String deviceNum;
	@ShowInView(name="设备名称")
	private String deviceName;
	@ShowInView(name="Mac地址")
	private String macAddress;
	@ShowInView(name="软件类型",operateType=OperateType.SELECT,ccateType="appType")
	private String appType;
	@ShowInView(name="软件等级",operateType=OperateType.SELECT,ccateType="appLevel")
	private String appLevel;
	@ShowInView(name="软件名称",operateType=OperateType.SELECT,ccateType="appName")
	private String appName;
	@ShowInView(name="版本号",operateType=OperateType.SELECT,ccateType="appVersion")
	private String appVersion;
	@ShowInView(name="授权情况",operateType=OperateType.SELECT,ccateType="authorize")
	private String authorize;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public AppVersion() {
		this.removed=0;
	}

	/** minimal constructor */
	public AppVersion(Integer id, String dept, String deptId,
			String deviceNum, String macAddress, String appType,
			String appName, String authorize, Integer removed) {
		this.id = id;
		this.dept = dept;
		this.deviceNum = deviceNum;
		this.macAddress = macAddress;
		this.appType = appType;
		this.appName = appName;
		this.authorize = authorize;
		this.removed = removed;
	}

	/** full constructor */
	public AppVersion(Integer id, String dept, String deptId,
			String deviceNum, String deviceName, String macAddress,
			String appType, String appLevel, String appName, String appVersion,
			String authorize, Integer removed) {
		this.id = id;
		this.dept = dept;
		this.deviceNum = deviceNum;
		this.deviceName = deviceName;
		this.macAddress = macAddress;
		this.appType = appType;
		this.appLevel = appLevel;
		this.appName = appName;
		this.appVersion = appVersion;
		this.authorize = authorize;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_app_version",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "DEPT", nullable = false, length = 50)
	public String getDept() {
		return this.dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	@Column(name = "DEVICE_NUM", nullable = false, length = 50)
	public String getDeviceNum() {
		return this.deviceNum;
	}

	public void setDeviceNum(String deviceNum) {
		this.deviceNum = deviceNum;
	}

	@Column(name = "DEVICE_NAME", length = 100)
	public String getDeviceName() {
		return this.deviceName;
	}

	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}

	@Column(name = "MAC_ADDRESS", nullable = false, length = 50)
	public String getMacAddress() {
		return this.macAddress;
	}

	public void setMacAddress(String macAddress) {
		this.macAddress = macAddress;
	}

	@Column(name = "APP_TYPE", nullable = false, length = 50)
	public String getAppType() {
		return this.appType;
	}

	public void setAppType(String appType) {
		this.appType = appType;
	}

	@Column(name = "APP_LEVEL", length = 50)
	public String getAppLevel() {
		return this.appLevel;
	}

	public void setAppLevel(String appLevel) {
		this.appLevel = appLevel;
	}

	@Column(name = "APP_NAME", nullable = false, length = 100)
	public String getAppName() {
		return this.appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	@Column(name = "APP_VERSION", length = 50)
	public String getAppVersion() {
		return this.appVersion;
	}

	public void setAppVersion(String appVersion) {
		this.appVersion = appVersion;
	}

	@Column(name = "AUTHORIZE", nullable = false, length = 50)
	public String getAuthorize() {
		return this.authorize;
	}

	public void setAuthorize(String authorize) {
		this.authorize = authorize;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}