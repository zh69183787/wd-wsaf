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
 * IimsAnnualCost entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_ANNUAL_COST")
@ShowInView(name="年度成本")
public class AnnualCost implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = -5686013443636966705L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="类别",operateType=OperateType.SELECT,ccateType="annualCostType")
	private String type;
	@ShowInView(name="年度")
	private String year;
	@ShowInView(name="总计预算金额")
	private BigDecimal totalBudget;
	@ShowInView(name="总计已签订合同金额 ")
	private BigDecimal totalSigned;
	@ShowInView(name="总计已支付合同金额 ")
	private BigDecimal totalPaied;
	@ShowInView(name="投资完成率")
	private BigDecimal signedPercent;
	@ShowInView(name="资金支付率")
	private BigDecimal paiedPercent;
	@ShowInView(name="总计未签订合同金额")
	private BigDecimal totalUnsigned;
	@ShowInView(name="总计未支付合同金额")
	private BigDecimal totalUnpaied;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)	
	private Integer removed;

	// Constructors

	/** default constructor */
	public AnnualCost() {
		this.removed=0;
	}

	/** minimal constructor */
	public AnnualCost(Integer id, String type, String year,
			Integer removed) {
		this.id = id;
		this.type = type;
		this.year = year;
		this.removed = removed;
	}

	/** full constructor */
	public AnnualCost(Integer id, String type, String year,
			BigDecimal totalBudget, BigDecimal totalSigned, BigDecimal totalPaied,
			BigDecimal signedPercent, BigDecimal paiedPercent, BigDecimal totalUnsigned,
			BigDecimal totalUnpaied, Integer removed) {
		this.id = id;
		this.type = type;
		this.year = year;
		this.totalBudget = totalBudget;
		this.totalSigned = totalSigned;
		this.totalPaied = totalPaied;
		this.signedPercent = signedPercent;
		this.paiedPercent = paiedPercent;
		this.totalUnsigned = totalUnsigned;
		this.totalUnpaied = totalUnpaied;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_annual_cost",allocationSize=1)	
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "TYPE", nullable = false, length = 50)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "YEAR", nullable = false, length = 4)
	public String getYear() {
		return this.year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	@Column(name = "TOTAL_BUDGET", precision = 12, scale = 2)
	public BigDecimal getTotalBudget() {
		return this.totalBudget;
	}

	public void setTotalBudget(BigDecimal totalBudget) {
		this.totalBudget = totalBudget;
	}

	@Column(name = "TOTAL_SIGNED", precision = 12, scale = 2)
	public BigDecimal getTotalSigned() {
		return this.totalSigned;
	}

	public void setTotalSigned(BigDecimal totalSigned) {
		this.totalSigned = totalSigned;
	}

	@Column(name = "TOTAL_PAIED", precision = 12, scale = 2)
	public BigDecimal getTotalPaied() {
		return this.totalPaied;
	}

	public void setTotalPaied(BigDecimal totalPaied) {
		this.totalPaied = totalPaied;
	}

	@Column(name = "SIGNED_PERCENT", precision = 5, scale = 2)
	public BigDecimal getSignedPercent() {
		return this.signedPercent;
	}

	public void setSignedPercent(BigDecimal signedPercent) {
		this.signedPercent = signedPercent;
	}

	@Column(name = "PAIED_PERCENT", precision = 5, scale = 2)
	public BigDecimal getPaiedPercent() {
		return this.paiedPercent;
	}

	public void setPaiedPercent(BigDecimal paiedPercent) {
		this.paiedPercent = paiedPercent;
	}

	@Column(name = "TOTAL_UNSIGNED", precision = 12, scale = 2)
	public BigDecimal getTotalUnsigned() {
		return this.totalUnsigned;
	}

	public void setTotalUnsigned(BigDecimal totalUnsigned) {
		this.totalUnsigned = totalUnsigned;
	}

	@Column(name = "TOTAL_UNPAIED", precision = 12, scale = 2)
	public BigDecimal getTotalUnpaied() {
		return this.totalUnpaied;
	}

	public void setTotalUnpaied(BigDecimal totalUnpaied) {
		this.totalUnpaied = totalUnpaied;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}