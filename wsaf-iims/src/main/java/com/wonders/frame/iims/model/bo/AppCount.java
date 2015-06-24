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
 * IimsAppCount entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_APP_COUNT")
@ShowInView(name="正版化统计")
public class AppCount implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = -1150398964277967066L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="部门",operateType=OperateType.SELECT,ccateType="appDept")
	private String dept;
	@ShowInView(name="设备编号")
	private String deviceNum;
	@ShowInView(name="设备名称")
	private String deviceName;
	@ShowInView(name="正版操作系统数")
	private Integer authorizeOpsys;
	@ShowInView(name="操作系统数")
	private Integer opsys;
	@ShowInView(name="正版办公软件数")
	private Integer authorizeOa;
	@ShowInView(name="办公软件数")
	private Integer oa;
	@ShowInView(name="正版应用软件数")
	private Integer authorizeApp;
	@ShowInView(name="应用软件数")
	private Integer app;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public AppCount() {
		this.removed=0;
	}

	/** minimal constructor */
	public AppCount(Integer id, String dept, String deptId,
			String deviceNum, Integer removed) {
		this.id = id;
		this.dept = dept;
		this.deviceNum = deviceNum;
		this.removed = removed;
	}

	/** full constructor */
	public AppCount(Integer id, String dept, String deptId,
			String deviceNum, String deviceName, Integer authorizeOpsys,
			Integer opsys, Integer authorizeOa, Integer oa,
			Integer authorizeApp, Integer app, Integer removed) {
		this.id = id;
		this.dept = dept;
		this.deviceNum = deviceNum;
		this.deviceName = deviceName;
		this.authorizeOpsys = authorizeOpsys;
		this.opsys = opsys;
		this.authorizeOa = authorizeOa;
		this.oa = oa;
		this.authorizeApp = authorizeApp;
		this.app = app;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_app_count",allocationSize=1)
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

	@Column(name = "AUTHORIZE_OPSYS", precision = 22, scale = 0)
	public Integer getAuthorizeOpsys() {
		return this.authorizeOpsys;
	}

	public void setAuthorizeOpsys(Integer authorizeOpsys) {
		this.authorizeOpsys = authorizeOpsys;
	}

	@Column(name = "OPSYS", precision = 22, scale = 0)
	public Integer getOpsys() {
		return this.opsys;
	}

	public void setOpsys(Integer opsys) {
		this.opsys = opsys;
	}

	@Column(name = "AUTHORIZE_OA", precision = 22, scale = 0)
	public Integer getAuthorizeOa() {
		return this.authorizeOa;
	}

	public void setAuthorizeOa(Integer authorizeOa) {
		this.authorizeOa = authorizeOa;
	}

	@Column(name = "OA", precision = 22, scale = 0)
	public Integer getOa() {
		return this.oa;
	}

	public void setOa(Integer oa) {
		this.oa = oa;
	}

	@Column(name = "AUTHORIZE_APP", precision = 22, scale = 0)
	public Integer getAuthorizeApp() {
		return this.authorizeApp;
	}

	public void setAuthorizeApp(Integer authorizeApp) {
		this.authorizeApp = authorizeApp;
	}

	@Column(name = "APP", precision = 22, scale = 0)
	public Integer getApp() {
		return this.app;
	}

	public void setApp(Integer app) {
		this.app = app;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}