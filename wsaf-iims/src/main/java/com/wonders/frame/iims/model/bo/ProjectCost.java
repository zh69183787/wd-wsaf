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

import com.wonders.frame.core.tags.ShowInView;
import com.wonders.frame.core.tags.ShowInView.OperateType;

/**
 * IimsProjectCost entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_PROJECT_COST")
@ShowInView(name="项目成本")
public class ProjectCost implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 7975247078664575789L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)	
	private Integer id;
	@ShowInView(name="年度成本ID")
	private Integer annualId;
	@ShowInView(name="编号")
	private String projectCode;
	@ShowInView(name="项目名称")
	private String projectName;
	@ShowInView(name="预算金额")
	private BigDecimal budget;
	@ShowInView(name="上报预算金额 ")
	private BigDecimal reportBudget;
	@ShowInView(name="填报人")
	private String applyer;
	@ShowInView(name="填报人工号")
	private String applyerLoginname;
	@ShowInView(name="填报时间")	
	private Date applyTime;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)	
	private Integer removed;

	// Constructors

	/** default constructor */
	public ProjectCost() {
		this.removed=0;
	}

	/** minimal constructor */
	public ProjectCost(Integer id, Integer annualId,
			String projectName, String applyer, String applyerLoginname,
			Date applyTime, Integer removed) {
		this.id = id;
		this.annualId = annualId;
		this.projectName = projectName;
		this.applyer = applyer;
		this.applyerLoginname = applyerLoginname;
		this.applyTime = applyTime;
		this.removed = removed;
	}

	/** full constructor */
	public ProjectCost(Integer id, Integer annualId,
			String projectCode, String projectName, BigDecimal budget,
			BigDecimal reportBudget, String applyer, String applyerLoginname,
			Date applyTime, Integer removed) {
		this.id = id;
		this.annualId = annualId;
		this.projectCode = projectCode;
		this.projectName = projectName;
		this.budget = budget;
		this.reportBudget = reportBudget;
		this.applyer = applyer;
		this.applyerLoginname = applyerLoginname;
		this.applyTime = applyTime;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_project_cost",allocationSize=1)	
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "ANNUAL_ID", nullable = false, precision = 22, scale = 0)
	public Integer getAnnualId() {
		return this.annualId;
	}

	public void setAnnualId(Integer annualId) {
		this.annualId = annualId;
	}

	@Column(name = "PROJECT_CODE", length = 50)
	public String getProjectCode() {
		return this.projectCode;
	}

	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
	}

	@Column(name = "PROJECT_NAME", nullable = false, length = 200)
	public String getProjectName() {
		return this.projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	@Column(name = "BUDGET", precision = 12,scale = 2)
	public BigDecimal getBudget() {
		return this.budget;
	}

	public void setBudget(BigDecimal budget) {
		this.budget = budget;
	}

	@Column(name = "REPORT_BUDGET", precision = 12,scale = 2)
	public BigDecimal getReportBudget() {
		return this.reportBudget;
	}

	public void setReportBudget(BigDecimal reportBudget) {
		this.reportBudget = reportBudget;
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

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}