package com.wonders.frame.icp.model.bo;

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

import com.wonders.frame.core.tags.ShowInView;
import com.wonders.frame.core.tags.ShowInView.OperateType;

/**
 * QteMain entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "QTE_MAIN")
@ShowInView(name="问卷")
public class QteMain implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 1L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="问卷名称")
	private String title;
	@ShowInView(name="有效开始时间")
	private Date startTime;
	@ShowInView(name="有效结束时间")
	private Date endTime;
	@ShowInView(name="参与人员")
	private String participants;
	@ShowInView(name="是否开放",operateType=OperateType.SELECT,ccateType="opened")
	private String isOpend;
	@ShowInView(name="背景描述")
	private String description;
	@ShowInView(name="创建人",operateType=OperateType.HIDDEN)
	private String creator;
	@ShowInView(name="创建人工号",operateType=OperateType.HIDDEN)
	private String loginName;
	@ShowInView(name="创建人所属部门id",operateType=OperateType.HIDDEN)
	private String deptId;
	@ShowInView(name="创建人所属部门",operateType=OperateType.HIDDEN)
	private String deptName;
	@ShowInView(name="状态",operateType=OperateType.HIDDEN)
	private String status;
	@ShowInView(name="类别",operateType=OperateType.HIDDEN)
	private String mainType;
	@ShowInView(name="创建时间",operateType=OperateType.HIDDEN)
	private Date createTime;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public QteMain() {
		this.removed=0;
	}

	/** minimal constructor */
	public QteMain(String title, Date startTime, Date endTime, String isOpend,
			String creator, String loginName, String deptId, String deptName,
			String status, String mainType, Date createTime,
			Integer removed) {
		this.title = title;
		this.startTime = startTime;
		this.endTime = endTime;
		this.isOpend = isOpend;
		this.creator = creator;
		this.loginName = loginName;
		this.deptId = deptId;
		this.deptName = deptName;
		this.status = status;
		this.mainType = mainType;
		this.createTime = createTime;
		this.removed = removed;
	}

	/** full constructor */
	public QteMain(String title, Date startTime, Date endTime,
			String participants, String isOpend, String description,
			String creator, String loginName, String deptId, String deptName,
			String status, String mainType, Date createTime,
			Integer removed) {
		this.title = title;
		this.startTime = startTime;
		this.endTime = endTime;
		this.participants = participants;
		this.isOpend = isOpend;
		this.description = description;
		this.creator = creator;
		this.loginName = loginName;
		this.deptId = deptId;
		this.deptName = deptName;
		this.status = status;
		this.mainType = mainType;
		this.createTime = createTime;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="Generator")
	@SequenceGenerator(name="Generator",sequenceName="seq_qte_main",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "TITLE", nullable = false, length = 500)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "START_TIME", nullable = false)
	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "END_TIME", nullable = false)
	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Column(name = "PARTICIPANTS")
	public String getParticipants() {
		return this.participants;
	}

	public void setParticipants(String participants) {
		this.participants = participants;
	}

	@Column(name = "IS_OPEND", nullable = false, length = 10)
	public String getIsOpend() {
		return this.isOpend;
	}

	public void setIsOpend(String isOpend) {
		this.isOpend = isOpend;
	}

	@Column(name = "DESCRIPTION", length = 4000)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "CREATOR", nullable = false, length = 50)
	public String getCreator() {
		return this.creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	@Column(name = "LOGIN_NAME", nullable = false, length = 50)
	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@Column(name = "DEPT_ID", nullable = false, length = 50)
	public String getDeptId() {
		return this.deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	@Column(name = "DEPT_NAME", nullable = false, length = 50)
	public String getDeptName() {
		return this.deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	@Column(name = "STATUS", nullable = false, length=20)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "MAIN_TYPE", nullable = false, length = 20)
	public String getMainType() {
		return this.mainType;
	}

	public void setMainType(String mainType) {
		this.mainType = mainType;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATE_TIME", nullable = false)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}