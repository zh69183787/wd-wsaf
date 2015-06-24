package com.wonders.frame.icp.model.bo;

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
 * CpqQuestion entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "CPQ_QUESTION")
@ShowInView(name="测评问题")
public class CpqQuestion implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = -3220679766607891879L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="测评问卷ID")
	private Integer cpqId;
	@ShowInView(name="类别")
	private String itemType;
	@ShowInView(name="考评项目")
	private String item;
	@ShowInView(name="考评标准")
	private String standard;
	@ShowInView(name="排序号")
	private Integer orders;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public CpqQuestion() {
		this.removed=0;
	}

	/** full constructor */
	public CpqQuestion(Integer id, Integer cpqId, String itemType,
			String item, String standard, Integer orders, Integer removed) {
		this.id = id;
		this.cpqId = cpqId;
		this.itemType = itemType;
		this.item = item;
		this.standard = standard;
		this.orders = orders;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_cpq_question",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "CPQ_ID", nullable = false, precision = 22, scale = 0)
	public Integer getCpqId() {
		return this.cpqId;
	}

	public void setCpqId(Integer cpqId) {
		this.cpqId = cpqId;
	}

	@Column(name = "ITEM_TYPE", nullable = false, length = 50)
	public String getItemType() {
		return this.itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

	@Column(name = "ITEM", nullable = false, length = 100)
	public String getItem() {
		return this.item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	@Column(name = "STANDARD", nullable = false, length = 500)
	public String getStandard() {
		return this.standard;
	}

	public void setStandard(String standard) {
		this.standard = standard;
	}

	@Column(name = "ORDERS", nullable = false, precision = 22, scale = 0)
	public Integer getOrders() {
		return this.orders;
	}

	public void setOrders(Integer orders) {
		this.orders = orders;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}