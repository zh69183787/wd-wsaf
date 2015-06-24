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
 * QteGroup entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "QTE_GROUP")
@ShowInView(name="分组")
public class QteGroup implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 1L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="所属问卷id",operateType=OperateType.HIDDEN)
	private Integer mainId;
	@ShowInView(name="分组名称")
	private String name;
	@ShowInView(name="次序号")
	private Integer orders;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public QteGroup() {
		this.removed=0;
	}

	/** full constructor */
	public QteGroup(Integer mainId, String name, Integer orders,
			Integer removed) {
		this.mainId = mainId;
		this.name = name;
		this.orders = orders;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="Generator")
	@SequenceGenerator(name="Generator",sequenceName="seq_qte_group",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "MAIN_ID", nullable = false, precision = 22, scale = 0)
	public Integer getMainId() {
		return this.mainId;
	}

	public void setMainId(Integer mainId) {
		this.mainId = mainId;
	}

	@Column(name = "NAME", nullable = false, length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
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