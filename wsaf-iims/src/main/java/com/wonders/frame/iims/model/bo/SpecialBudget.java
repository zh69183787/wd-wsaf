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
 * IimsSpecialBudget entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_SPECIAL_BUDGET")
@ShowInView(name="年度专项预算")
public class SpecialBudget implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 3468461147424095365L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="年度专项ID")
	private Integer specialId;
	@ShowInView(name="年度")
	private String year;
	@ShowInView(name="项目年度预算")
	private BigDecimal budget;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)	
	private Integer removed;

	// Constructors

	/** default constructor */
	public SpecialBudget() {
		this.removed=0;
	}

	/** minimal constructor */
	public SpecialBudget(Integer id, Integer specialId, String year,
			Integer removed) {
		this.id = id;
		this.specialId = specialId;
		this.year = year;
		this.removed = removed;
	}

	/** full constructor */
	public SpecialBudget(Integer id, Integer specialId, String year,
			BigDecimal budget, Integer removed) {
		this.id = id;
		this.specialId = specialId;
		this.year = year;
		this.budget = budget;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_special_budget",allocationSize=1)	
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "SPECIAL_ID", nullable = false, precision = 22, scale = 0)
	public Integer getSpecialId() {
		return this.specialId;
	}

	public void setSpecialId(Integer specialId) {
		this.specialId = specialId;
	}

	@Column(name = "YEAR", nullable = false, length = 4)
	public String getYear() {
		return this.year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	@Column(name = "BUDGET", precision = 12, scale = 2)
	public BigDecimal getBudget() {
		return this.budget;
	}

	public void setBudget(BigDecimal budget) {
		this.budget = budget;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}