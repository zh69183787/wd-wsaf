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
 * IimsSpecialContract entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_SPECIAL_CONTRACT")
@ShowInView(name="年度专项合同")
public class SpecialContract implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 5652107830411207456L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="年度专项预算ID")
	private Integer budgetId;
	@ShowInView(name="合同名称")
	private String contractName;
	@ShowInView(name="计划签订时间")
	private Date planSignTime;
	@ShowInView(name="合同签订年度")
	private String signYear;
	@ShowInView(name="合同签订状态",operateType=OperateType.SELECT,ccateType="signType")
	private String signType;
	@ShowInView(name="合同签订金额")
	private BigDecimal signAmount;
	@ShowInView(name="执行起始年度")
	private String startYear;
	@ShowInView(name="执行终止年度")
	private String endYear;
	@ShowInView(name="本年计划支付")
	private BigDecimal planPay;
	@ShowInView(name="本年已支付")
	private BigDecimal paied;
	@ShowInView(name="支付完成率")
	private BigDecimal percent;
	@ShowInView(name="本年未支付")
	private BigDecimal unpaied;
	@ShowInView(name="累计支付")
	private BigDecimal totalPaied;
	@ShowInView(name="累计支付率")
	private BigDecimal totalPaiedPercent;
	@ShowInView(name="计划预付款")
	private BigDecimal planAdvancePay;
	@ShowInView(name="实际预付款")
	private BigDecimal actualAdvancePay;
	@ShowInView(name="计划进度款")
	private BigDecimal planProgressPay;
	@ShowInView(name="实际进度款")
	private BigDecimal actualProgressPay;
	@ShowInView(name="计划验收款")
	private BigDecimal planAcceptancePay;
	@ShowInView(name="实际验收款")
	private BigDecimal actualAcceptancePay;
	@ShowInView(name="计划质保款")
	private BigDecimal planWarrantyPay;
	@ShowInView(name="实际质保款")
	private BigDecimal actualWarrantyPay;
	@ShowInView(name="执行情况说明")
	private String implementation;
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
	public SpecialContract() {
		this.removed=0;
	}

	/** minimal constructor */
	public SpecialContract(Integer id, Integer budgetId,
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
	public SpecialContract(Integer id, Integer budgetId,
			String contractName, Date planSignTime, String signYear,
			String signType, BigDecimal signAmount, String startYear,
			String endYear, BigDecimal planPay, BigDecimal paied, BigDecimal percent,
			BigDecimal unpaied, BigDecimal totalPaied, BigDecimal totalPaiedPercent,BigDecimal planAdvancePay,
			BigDecimal actualAdvancePay, BigDecimal planProgressPay,
			BigDecimal actualProgressPay, BigDecimal planAcceptancePay,
			BigDecimal actualAcceptancePay, BigDecimal planWarrantyPay,
			BigDecimal actualWarrantyPay, String implementation, String applyer,
			String applyerLoginname, Date applyTime, Integer removed) {
		this.id = id;
		this.budgetId = budgetId;
		this.contractName = contractName;
		this.planSignTime = planSignTime;
		this.signYear = signYear;
		this.signType = signType;
		this.signAmount = signAmount;
		this.startYear = startYear;
		this.endYear = endYear;
		this.planPay = planPay;
		this.paied = paied;
		this.percent = percent;
		this.unpaied = unpaied;
		this.totalPaied = totalPaied;
		this.totalPaiedPercent = totalPaiedPercent;
		this.planAdvancePay = planAdvancePay;
		this.actualAdvancePay = actualAdvancePay;
		this.planProgressPay = planProgressPay;
		this.actualProgressPay = actualProgressPay;
		this.planAcceptancePay = planAcceptancePay;
		this.actualAcceptancePay = actualAcceptancePay;
		this.planWarrantyPay = planWarrantyPay;
		this.actualWarrantyPay = actualWarrantyPay;
		this.implementation = implementation;
		this.applyer = applyer;
		this.applyerLoginname = applyerLoginname;
		this.applyTime = applyTime;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_special_contract",allocationSize=1)	
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

	@Column(name = "CONTRACT_NAME", length = 200)
	public String getContractName() {
		return this.contractName;
	}

	public void setContractName(String contractName) {
		this.contractName = contractName;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "PLAN_SIGN_TIME", length = 7)
	public Date getPlanSignTime() {
		return this.planSignTime;
	}

	public void setPlanSignTime(Date planSignTime) {
		this.planSignTime = planSignTime;
	}

	@Column(name = "SIGN_YEAR", length = 4)
	public String getSignYear() {
		return this.signYear;
	}

	public void setSignYear(String signYear) {
		this.signYear = signYear;
	}

	@Column(name = "SIGN_TYPE", length = 50)
	public String getSignType() {
		return this.signType;
	}

	public void setSignType(String signType) {
		this.signType = signType;
	}

	@Column(name = "SIGN_AMOUNT", precision = 12, scale = 2)
	public BigDecimal getSignAmount() {
		return this.signAmount;
	}

	public void setSignAmount(BigDecimal signAmount) {
		this.signAmount = signAmount;
	}

	@Column(name = "START_YEAR", length = 4)
	public String getStartYear() {
		return this.startYear;
	}

	public void setStartYear(String startYear) {
		this.startYear = startYear;
	}

	@Column(name = "END_YEAR", length = 4)
	public String getEndYear() {
		return this.endYear;
	}

	public void setEndYear(String endYear) {
		this.endYear = endYear;
	}

	@Column(name = "PLAN_PAY", precision = 12, scale = 2)
	public BigDecimal getPlanPay() {
		return this.planPay;
	}

	public void setPlanPay(BigDecimal planPay) {
		this.planPay = planPay;
	}

	@Column(name = "PAIED", precision = 12, scale = 2)
	public BigDecimal getPaied() {
		return this.paied;
	}

	public void setPaied(BigDecimal paied) {
		this.paied = paied;
	}

	@Column(name = "PERCENT", precision = 5, scale = 2)
	public BigDecimal getPercent() {
		return this.percent;
	}

	public void setPercent(BigDecimal percent) {
		this.percent = percent;
	}

	@Column(name = "UNPAIED", precision = 12, scale = 2)
	public BigDecimal getUnpaied() {
		return this.unpaied;
	}

	public void setUnpaied(BigDecimal unpaied) {
		this.unpaied = unpaied;
	}

	@Column(name = "TOTAL_PAIED", precision = 12, scale = 2)
	public BigDecimal getTotalPaied() {
		return this.totalPaied;
	}

	public void setTotalPaied(BigDecimal totalPaied) {
		this.totalPaied = totalPaied;
	}

	@Column(name = "TOTAL_PAIED_PERCENT", precision = 5, scale = 2)
	public BigDecimal getTotalPaiedPercent() {
		return this.totalPaiedPercent;
	}

	public void setTotalPaiedPercent(BigDecimal totalPaiedPercent) {
		this.totalPaiedPercent = totalPaiedPercent;
	}

	
	@Column(name = "PLAN_ADVANCE_PAY", precision = 12, scale = 2)
	public BigDecimal getPlanAdvancePay() {
		return this.planAdvancePay;
	}

	public void setPlanAdvancePay(BigDecimal planAdvancePay) {
		this.planAdvancePay = planAdvancePay;
	}

	@Column(name = "ACTUAL_ADVANCE_PAY", precision = 12, scale = 2)
	public BigDecimal getActualAdvancePay() {
		return this.actualAdvancePay;
	}

	public void setActualAdvancePay(BigDecimal actualAdvancePay) {
		this.actualAdvancePay = actualAdvancePay;
	}

	@Column(name = "PLAN_PROGRESS_PAY", precision = 12, scale = 2)
	public BigDecimal getPlanProgressPay() {
		return this.planProgressPay;
	}

	public void setPlanProgressPay(BigDecimal planProgressPay) {
		this.planProgressPay = planProgressPay;
	}

	@Column(name = "ACTUAL_PROGRESS_PAY", precision = 12, scale = 2)
	public BigDecimal getActualProgressPay() {
		return this.actualProgressPay;
	}

	public void setActualProgressPay(BigDecimal actualProgressPay) {
		this.actualProgressPay = actualProgressPay;
	}

	@Column(name = "PLAN_ACCEPTANCE_PAY", precision = 12, scale = 2)
	public BigDecimal getPlanAcceptancePay() {
		return this.planAcceptancePay;
	}

	public void setPlanAcceptancePay(BigDecimal planAcceptancePay) {
		this.planAcceptancePay = planAcceptancePay;
	}

	@Column(name = "ACTUAL_ACCEPTANCE_PAY", precision = 12, scale = 2)
	public BigDecimal getActualAcceptancePay() {
		return this.actualAcceptancePay;
	}

	public void setActualAcceptancePay(BigDecimal actualAcceptancePay) {
		this.actualAcceptancePay = actualAcceptancePay;
	}

	@Column(name = "PLAN_WARRANTY_PAY", precision = 12, scale = 2)
	public BigDecimal getPlanWarrantyPay() {
		return this.planWarrantyPay;
	}

	public void setPlanWarrantyPay(BigDecimal planWarrantyPay) {
		this.planWarrantyPay = planWarrantyPay;
	}

	@Column(name = "ACTUAL_WARRANTY_PAY", precision = 12, scale = 2)
	public BigDecimal getActualWarrantyPay() {
		return this.actualWarrantyPay;
	}

	public void setActualWarrantyPay(BigDecimal actualWarrantyPay) {
		this.actualWarrantyPay = actualWarrantyPay;
	}

	@Column(name = "IMPLEMENTATION", length = 500)
	public String getImplementation() {
		return this.implementation;
	}

	public void setImplementation(String implementation) {
		this.implementation = implementation;
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