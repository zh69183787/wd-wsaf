package com.wonders.frame.iims.model.bo;

import java.math.BigDecimal;
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
 * IimsSpecial entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_SPECIAL")
@ShowInView(name="年度专项")
public class Special implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 3131472415934740757L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="年度")
	private String year;
	@ShowInView(name="当年计划上报项目预算")
	private BigDecimal planReportBudget;
	@ShowInView(name="当年已批复项目预算")
	private BigDecimal repliedBudget;
	@ShowInView(name="当年未批复项目预算")
	private BigDecimal unrepliedBudget;
	@ShowInView(name="批复率")
	private BigDecimal repliedPercent;
	@ShowInView(name="去年项目资金预算")
	private BigDecimal lastYearBudget;
	@ShowInView(name="当年项目资金预算")
	private BigDecimal thisYearBudget;
	@ShowInView(name="当年计划签订合同金额")
	private BigDecimal planSignAmount;
	@ShowInView(name="当年已签订合同金额")
	private BigDecimal signedAmount;
	@ShowInView(name="当年未签订合同金额")
	private BigDecimal unsignedAmount;
	@ShowInView(name="签订率")
	private BigDecimal signedPercent;
	@ShowInView(name="应支付合同金额")
	private BigDecimal planPaiedAmount;
	@ShowInView(name="已支付合同金额")
	private BigDecimal paiedAmount;
	@ShowInView(name="未支付合同金额")
	private BigDecimal unpaiedAmount;
	@ShowInView(name="支付率")
	private BigDecimal paiedPercent;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)	
	private Integer removed;

	// Constructors

	/** default constructor */
	public Special() {
		this.removed=0;
	}

	/** minimal constructor */
	public Special(Integer id, String year,
			Integer removed) {
		this.id = id;
		this.year = year;
		this.removed = removed;
	}

	/** full constructor */
	public Special(Integer id, String year,
			BigDecimal planReportBudget, BigDecimal repliedBudget,
			BigDecimal unrepliedBudget, BigDecimal repliedPercent,
			BigDecimal lastYearBudget, BigDecimal thisYearBudget,
			BigDecimal planSignAmount, BigDecimal signedAmount, BigDecimal unsignedAmount,
			BigDecimal signedPercent, BigDecimal planPaiedAmount, BigDecimal paiedAmount,
			BigDecimal unpaiedAmount, BigDecimal paiedPercent, Integer removed) {
		this.id = id;
		this.year = year;
		this.planReportBudget = planReportBudget;
		this.repliedBudget = repliedBudget;
		this.unrepliedBudget = unrepliedBudget;
		this.repliedPercent = repliedPercent;
		this.lastYearBudget = lastYearBudget;
		this.thisYearBudget = thisYearBudget;
		this.planSignAmount = planSignAmount;
		this.signedAmount = signedAmount;
		this.unsignedAmount = unsignedAmount;
		this.signedPercent = signedPercent;
		this.planPaiedAmount = planPaiedAmount;
		this.paiedAmount = paiedAmount;
		this.unpaiedAmount = unpaiedAmount;
		this.paiedPercent = paiedPercent;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_special",allocationSize=1)	
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}	

	@Column(name = "YEAR", nullable = false, length = 4)
	public String getYear() {
		return this.year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	@Column(name = "PLAN_REPORT_BUDGET", precision = 12, scale = 2)
	public BigDecimal getPlanReportBudget() {
		return this.planReportBudget;
	}

	public void setPlanReportBudget(BigDecimal planReportBudget) {
		this.planReportBudget = planReportBudget;
	}

	@Column(name = "REPLIED_BUDGET", precision = 12, scale = 2)
	public BigDecimal getRepliedBudget() {
		return this.repliedBudget;
	}

	public void setRepliedBudget(BigDecimal repliedBudget) {
		this.repliedBudget = repliedBudget;
	}

	@Column(name = "UNREPLIED_BUDGET", precision = 12, scale = 2)
	public BigDecimal getUnrepliedBudget() {
		return this.unrepliedBudget;
	}

	public void setUnrepliedBudget(BigDecimal unrepliedBudget) {
		this.unrepliedBudget = unrepliedBudget;
	}

	@Column(name = "REPLIED_PERCENT", precision = 5, scale = 2)
	public BigDecimal getRepliedPercent() {
		return this.repliedPercent;
	}

	public void setRepliedPercent(BigDecimal repliedPercent) {
		this.repliedPercent = repliedPercent;
	}

	@Column(name = "LAST_YEAR_BUDGET", precision = 12, scale = 2)
	public BigDecimal getLastYearBudget() {
		return this.lastYearBudget;
	}

	public void setLastYearBudget(BigDecimal lastYearBudget) {
		this.lastYearBudget = lastYearBudget;
	}

	@Column(name = "THIS_YEAR_BUDGET", precision = 12, scale = 2)
	public BigDecimal getThisYearBudget() {
		return this.thisYearBudget;
	}

	public void setThisYearBudget(BigDecimal thisYearBudget) {
		this.thisYearBudget = thisYearBudget;
	}

	@Column(name = "PLAN_SIGN_AMOUNT", precision = 12, scale = 2)
	public BigDecimal getPlanSignAmount() {
		return this.planSignAmount;
	}

	public void setPlanSignAmount(BigDecimal planSignAmount) {
		this.planSignAmount = planSignAmount;
	}

	@Column(name = "SIGNED_AMOUNT", precision = 12, scale = 2)
	public BigDecimal getSignedAmount() {
		return this.signedAmount;
	}

	public void setSignedAmount(BigDecimal signedAmount) {
		this.signedAmount = signedAmount;
	}

	@Column(name = "UNSIGNED_AMOUNT", precision = 12, scale = 2)
	public BigDecimal getUnsignedAmount() {
		return this.unsignedAmount;
	}

	public void setUnsignedAmount(BigDecimal unsignedAmount) {
		this.unsignedAmount = unsignedAmount;
	}

	@Column(name = "SIGNED_PERCENT", precision = 5, scale = 2)
	public BigDecimal getSignedPercent() {
		return this.signedPercent;
	}

	public void setSignedPercent(BigDecimal signedPercent) {
		this.signedPercent = signedPercent;
	}

	@Column(name = "PLAN_PAIED_AMOUNT", precision = 12, scale = 2)
	public BigDecimal getPlanPaiedAmount() {
		return this.planPaiedAmount;
	}

	public void setPlanPaiedAmount(BigDecimal planPaiedAmount) {
		this.planPaiedAmount = planPaiedAmount;
	}

	@Column(name = "PAIED_AMOUNT", precision = 12, scale = 2)
	public BigDecimal getPaiedAmount() {
		return this.paiedAmount;
	}

	public void setPaiedAmount(BigDecimal paiedAmount) {
		this.paiedAmount = paiedAmount;
	}

	@Column(name = "UNPAIED_AMOUNT", precision = 12, scale = 2)
	public BigDecimal getUnpaiedAmount() {
		return this.unpaiedAmount;
	}

	public void setUnpaiedAmount(BigDecimal unpaiedAmount) {
		this.unpaiedAmount = unpaiedAmount;
	}

	@Column(name = "PAIED_PERCENT", precision = 5, scale = 2)
	public BigDecimal getPaiedPercent() {
		return this.paiedPercent;
	}

	public void setPaiedPercent(BigDecimal paiedPercent) {
		this.paiedPercent = paiedPercent;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}