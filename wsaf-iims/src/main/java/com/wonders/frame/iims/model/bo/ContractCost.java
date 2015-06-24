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
 * IimsContractCost entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_CONTRACT_COST")
@ShowInView(name="合同成本")
public class ContractCost implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 3792182178961519349L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)	
	private Integer id;
	@ShowInView(name="项目成本ID")
	private Integer projectId;
	@ShowInView(name="合同名称")
	private String contractName;
	@ShowInView(name="计划签订时间")
	private Date planSignTime;
	@ShowInView(name="合同金额 ")
	private BigDecimal amount;
	@ShowInView(name="已支付 ")
	private BigDecimal paied;
	@ShowInView(name="未支付 ")
	private BigDecimal unpaied;
	@ShowInView(name="支付率")
	private BigDecimal percent;
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
	@ShowInView(name="执行情况说明 ")
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
	public ContractCost() {
		this.removed=0;
	}

	/** minimal constructor */
	public ContractCost(Integer id, Integer projectId,String contractName,
			String applyer, String applyerLoginname, Date applyTime,
			Integer removed) {
		this.id = id;
		this.contractName=contractName;
		this.projectId = projectId;
		this.applyer = applyer;
		this.applyerLoginname = applyerLoginname;
		this.applyTime = applyTime;
		this.removed = removed;
	}

	/** full constructor */
	public ContractCost(Integer id, Integer projectId,String contractName,
			Date planSignTime, BigDecimal amount, BigDecimal paied, BigDecimal unpaied,
			BigDecimal percent, BigDecimal planAdvancePay, BigDecimal actualAdvancePay,
			BigDecimal planProgressPay, BigDecimal actualProgressPay,
			BigDecimal planAcceptancePay, BigDecimal actualAcceptancePay,
			BigDecimal planWarrantyPay, BigDecimal actualWarrantyPay,
			String implementation, String applyer, String applyerLoginname,
			Date applyTime, Integer removed) {
		this.id = id;
		this.contractName=contractName;
		this.projectId = projectId;
		this.planSignTime = planSignTime;
		this.amount = amount;
		this.paied = paied;
		this.unpaied = unpaied;
		this.percent = percent;
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
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_contract_cost",allocationSize=1)	
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "PROJECT_ID", nullable = false, precision = 22, scale = 0)
	public Integer getProjectId() {
		return this.projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}
	
	@Column(name = "CONTRACT_NAME", nullable = false, length=200)
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

	@Column(name = "AMOUNT", precision = 12,scale = 2)
	public BigDecimal getAmount() {
		return this.amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	@Column(name = "PAIED", precision = 12,scale = 2)
	public BigDecimal getPaied() {
		return this.paied;
	}

	public void setPaied(BigDecimal paied) {
		this.paied = paied;
	}

	@Column(name = "UNPAIED", precision = 12,scale = 2)
	public BigDecimal getUnpaied() {
		return this.unpaied;
	}

	public void setUnpaied(BigDecimal unpaied) {
		this.unpaied = unpaied;
	}

	@Column(name = "PERCENT", precision = 5,scale = 2)
	public BigDecimal getPercent() {
		return this.percent;
	}

	public void setPercent(BigDecimal percent) {
		this.percent = percent;
	}

	@Column(name = "PLAN_ADVANCE_PAY", precision = 12,scale = 2)
	public BigDecimal getPlanAdvancePay() {
		return this.planAdvancePay;
	}

	public void setPlanAdvancePay(BigDecimal planAdvancePay) {
		this.planAdvancePay = planAdvancePay;
	}

	@Column(name = "ACTUAL_ADVANCE_PAY", precision = 12,scale = 2)
	public BigDecimal getActualAdvancePay() {
		return this.actualAdvancePay;
	}

	public void setActualAdvancePay(BigDecimal actualAdvancePay) {
		this.actualAdvancePay = actualAdvancePay;
	}

	@Column(name = "PLAN_PROGRESS_PAY", precision = 12,scale = 2)
	public BigDecimal getPlanProgressPay() {
		return this.planProgressPay;
	}

	public void setPlanProgressPay(BigDecimal planProgressPay) {
		this.planProgressPay = planProgressPay;
	}

	@Column(name = "ACTUAL_PROGRESS_PAY", precision = 12,scale = 2)
	public BigDecimal getActualProgressPay() {
		return this.actualProgressPay;
	}

	public void setActualProgressPay(BigDecimal actualProgressPay) {
		this.actualProgressPay = actualProgressPay;
	}

	@Column(name = "PLAN_ACCEPTANCE_PAY", precision = 12,scale = 2)
	public BigDecimal getPlanAcceptancePay() {
		return this.planAcceptancePay;
	}

	public void setPlanAcceptancePay(BigDecimal planAcceptancePay) {
		this.planAcceptancePay = planAcceptancePay;
	}

	@Column(name = "ACTUAL_ACCEPTANCE_PAY", precision = 12,scale = 2)
	public BigDecimal getActualAcceptancePay() {
		return this.actualAcceptancePay;
	}

	public void setActualAcceptancePay(BigDecimal actualAcceptancePay) {
		this.actualAcceptancePay = actualAcceptancePay;
	}

	@Column(name = "PLAN_WARRANTY_PAY", precision = 12,scale = 2)
	public BigDecimal getPlanWarrantyPay() {
		return this.planWarrantyPay;
	}

	public void setPlanWarrantyPay(BigDecimal planWarrantyPay) {
		this.planWarrantyPay = planWarrantyPay;
	}

	@Column(name = "ACTUAL_WARRANTY_PAY", precision = 12,scale = 2)
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