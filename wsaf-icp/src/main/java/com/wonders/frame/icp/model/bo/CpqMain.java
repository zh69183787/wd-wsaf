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
 * CpqMain entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "CPQ_MAIN")
@ShowInView(name="测评问卷")
public class CpqMain implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 6045022362182748202L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="测评名称")
	private String cpqName;
	@ShowInView(name="有效开始时间")
	private Date startTime;
	@ShowInView(name="有效结束时间")
	private Date endTime;
	@ShowInView(name="被测评部门",operateType=OperateType.SELECT,ccateType="beTestDept")
	private String beTestDept;
    @ShowInView(name="被测评部门中文")
    private String beTestDeptCn;
    @ShowInView(name="测评部门中文")
    private String testDeptCn;
	@ShowInView(name="参与测评部门",operateType=OperateType.SELECT,ccateType="testDept")
	private String testDept;
    @ShowInView(name="参与测评部门名额")
    private String testDeptCount;
	@ShowInView(name="是否开放",operateType=OperateType.SELECT,ccateType="opened")
	private String opened;
	@ShowInView(name="背景描述")
	private String description;
	@ShowInView(name="制定人")
	private String creator;
	@ShowInView(name="制定人工号")
	private String creatorLoginName;
	@ShowInView(name="制定时间")
	private Date createTime;
	@ShowInView(name="状态",operateType=OperateType.SELECT,ccateType="cpqStatus")
	private String status;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public CpqMain() {
		this.removed=0;
	}

    @Column(name = "TEST_DEPT_COUNT", nullable = false, length = 2000)
    public String getTestDeptCount() {
        return testDeptCount;
    }

    public void setTestDeptCount(String testDeptCount) {
        this.testDeptCount = testDeptCount;
    }

    // Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_cpq_main",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 19, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "CPQ_NAME", nullable = false, length = 200)
	public String getCpqName() {
		return this.cpqName;
	}

	public void setCpqName(String cpqName) {
		this.cpqName = cpqName;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "START_TIME")
	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "END_TIME")
	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Column(name = "BE_TEST_DEPT", nullable = false, length = 1000)
	public String getBeTestDept() {
		return this.beTestDept;
	}

	public void setBeTestDept(String beTestDept) {
		this.beTestDept = beTestDept;
	}

	@Column(name = "TEST_DEPT", nullable = false, length = 1000)
	public String getTestDept() {
		return this.testDept;
	}

	public void setTestDept(String testDept) {
		this.testDept = testDept;
	}

	@Column(name = "OPENED", length = 50)
	public String getOpened() {
		return this.opened;
	}

	public void setOpened(String opened) {
		this.opened = opened;
	}

	@Column(name = "DESCRIPTION", length = 4000)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "CREATOR", nullable = false, length = 20)
	public String getCreator() {
		return this.creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	@Column(name = "CREATOR_LOGINNAME", nullable = false, length = 20)
	public String getCreatorLoginName() {
		return this.creatorLoginName;
	}

	public void setCreatorLoginName(String creatorLoginName) {
		this.creatorLoginName = creatorLoginName;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATE_TIME", nullable = false)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "STATUS", nullable = false, length = 50)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

    @Column(name = "BE_TEST_DEPT_CN", nullable = false, length=4000)
    public String getBeTestDeptCn() {
        return beTestDeptCn;
    }

    public void setBeTestDeptCn(String beTestDeptCn) {
        this.beTestDeptCn = beTestDeptCn;
    }

    @Column(name = "TEST_DEPT_CN", nullable = false, length=4000)
    public String getTestDeptCn() {
        return testDeptCn;
    }

    public void setTestDeptCn(String testDeptCn) {
        this.testDeptCn = testDeptCn;
    }
}