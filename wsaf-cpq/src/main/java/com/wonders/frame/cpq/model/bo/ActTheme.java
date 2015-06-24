package com.wonders.frame.cpq.model.bo;

import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.wonders.frame.core.tags.ShowInView;
import com.wonders.frame.core.tags.ShowInView.OperateType;

/**
 * ActCollectTheme entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "ACT_THEME")
@ShowInView(name="征集意见主题")
public class ActTheme implements java.io.Serializable {

	// Fields
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 1L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="征集名称")
	private String name;
	@ShowInView(name="意见类别",operateType=OperateType.SELECT,ccateType="collectSuggestType")
	private String colCategory;
	@ShowInView(name="征集开始时间")
	private Date startTime;
	@ShowInView(name="征集结束时间")
	private Date endTime;
	@ShowInView(name="参与人员")
	private String participant;
	@ShowInView(name="是否开放",operateType=OperateType.SELECT,ccateType="opened")
	private String isOpend;
	@ShowInView(name="征集内容")
	private String content;
	@ShowInView(name="创建人",operateType=OperateType.HIDDEN)
	private String creater;
	@ShowInView(name="创建人工号",operateType=OperateType.HIDDEN)
	private String loginName;
	@ShowInView(name="创建人所属部门",operateType=OperateType.HIDDEN)
	private String deptName;
	@ShowInView(name="创建人所属部门id",operateType=OperateType.HIDDEN)
	private Integer deptId;
	@ShowInView(name="创建时间",operateType=OperateType.HIDDEN)
	private Date createTime;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public ActTheme() {
		this.removed=0;
	}

	/** minimal constructor */
	public ActTheme(String name, String colCategory, Date startTime,
			Date endTime, String isOpend, String content, String creater,
			String loginName, String deptName, Integer deptId,
			Date createTime) {
		this.name = name;
		this.colCategory = colCategory;
		this.startTime = startTime;
		this.endTime = endTime;
		this.isOpend = isOpend;
		this.content = content;
		this.creater = creater;
		this.loginName = loginName;
		this.deptName = deptName;
		this.deptId = deptId;
		this.createTime = createTime;
		this.removed = 0;
	}

	/** full constructor */
	public ActTheme(String name, String colCategory, Date startTime,
			Date endTime, String participant, String isOpend, String content,
			String creater, String loginName, String deptName,
			Integer deptId, Date createTime, Integer removed) {
		this.name = name;
		this.colCategory = colCategory;
		this.startTime = startTime;
		this.endTime = endTime;
		this.participant = participant;
		this.isOpend = isOpend;
		this.content = content;
		this.creater = creater;
		this.loginName = loginName;
		this.deptName = deptName;
		this.deptId = deptId;
		this.createTime = createTime;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="Generator")
	@SequenceGenerator(name="Generator",sequenceName="seq_act_theme",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "NAME", nullable = false, length = 200)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "COL_CATEGORY", nullable = false, length = 20)
	public String getColCategory() {
		return this.colCategory;
	}

	public void setColCategory(String colCategory) {
		this.colCategory = colCategory;
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

	@Lob 
	@Basic(fetch=FetchType.LAZY) 
	@Column(name = "PARTICIPANT", length = 4000,columnDefinition="CLOB",nullable=false)
	public String getParticipant() {
		return this.participant;
	}

	public void setParticipant(String participant) {
		this.participant = participant;
	}

	@Column(name = "IS_OPEND", nullable = false, length = 10)
	public String getIsOpend() {
		return this.isOpend;
	}

	public void setIsOpend(String isOpend) {
		this.isOpend = isOpend;
	}

	@Column(name = "CONTENT", nullable = false, length = 4000)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "CREATER", nullable = false, length = 50)
	public String getCreater() {
		return this.creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	@Column(name = "LOGIN_NAME", nullable = false, length = 50)
	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@Column(name = "DEPT_NAME", nullable = false, length = 50)
	public String getDeptName() {
		return this.deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	@Column(name = "DEPT_ID", nullable = false, precision = 22, scale = 0)
	public Integer getDeptId() {
		return this.deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "CREATE_TIME", nullable = false, length = 7)
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