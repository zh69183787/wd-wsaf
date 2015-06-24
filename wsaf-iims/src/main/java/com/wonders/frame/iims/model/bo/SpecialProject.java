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
 * IimsSpecialProject entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_SPECIAL_PROJECT")
@ShowInView(name="年度专项项目")
public class SpecialProject implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 1050876260140248903L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="年度专项预算ID")
	private Integer budgetId;
	@ShowInView(name="项目名称")
	private String projectName;
	@ShowInView(name="项目批复预算")
	private BigDecimal repliedBudget;
	@ShowInView(name="预算批复状态",operateType=OperateType.SELECT,ccateType="replyType")
	private String repliedType;
	@ShowInView(name="项目金额")
	private BigDecimal projectAmount;
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
	public SpecialProject() {
		this.removed=0;
	}

	/** minimal constructor */
	public SpecialProject(Integer id, Integer budgetId,
			String applyer, String applyerLoginname, Date applyTime,
			Integer removed) {
		this.id = id;
		this.budgetId = budgetId;
		this.applyer = applyer;
		this.applyerLoginname = applyerLoginname;
		this.applyTime = applyTime;
		this.removed = removed;
	}

	/** full constructor */
	public SpecialProject(Integer id, Integer budgetId,
			String projectName, BigDecimal repliedBudget, String repliedType,
			BigDecimal projectAmount, String applyer, String applyerLoginname,
			Date applyTime, Integer removed) {
		this.id = id;
		this.budgetId = budgetId;
		this.projectName = projectName;
		this.repliedBudget = repliedBudget;
		this.repliedType = repliedType;
		this.projectAmount = projectAmount;
		this.applyer = applyer;
		this.applyerLoginname = applyerLoginname;
		this.applyTime = applyTime;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_special_project",allocationSize=1)	
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "BUDGET_ID", nullable = false, precision = 22, scale = 0)
	public Integer getBudgetId() {
		return this.budgetId;
	}

	public void setBudgetId(Integer budgetId) {
		this.budgetId = budgetId;
	}

	@Column(name = "PROJECT_NAME", length = 200)
	public String getProjectName() {
		return this.projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	@Column(name = "REPLIED_BUDGET", precision = 12, scale = 2)
	public BigDecimal getRepliedBudget() {
		return this.repliedBudget;
	}

	public void setRepliedBudget(BigDecimal repliedBudget) {
		this.repliedBudget = repliedBudget;
	}

	@Column(name = "REPLIED_TYPE", length = 50)
	public String getRepliedType() {
		return this.repliedType;
	}

	public void setRepliedType(String repliedType) {
		this.repliedType = repliedType;
	}

	@Column(name = "PROJECT_AMOUNT", precision = 12, scale = 2)
	public BigDecimal getProjectAmount() {
		return this.projectAmount;
	}

	public void setProjectAmount(BigDecimal projectAmount) {
		this.projectAmount = projectAmount;
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