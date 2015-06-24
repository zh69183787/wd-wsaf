package com.wonders.frame.core.model.bo;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import com.wonders.frame.core.tags.ShowInView;
import com.wonders.frame.core.tags.ShowInView.OperateType;

/**
 * RelationRuleType entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "AF_RELATION_RULE_TYPE", schema = "WSAF")
public class RelationRuleType implements java.io.Serializable {

	/**
	 * 
	 */
	//Fields
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 1828291678489761322L;
	// Fields
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@NotEmpty(message="名称不能为空")
	private String name;
	private String relationObj;
	private Integer removed;

	// Constructors

	/** default constructor */
	public RelationRuleType() {
	}

	/** minimal constructor */
	public RelationRuleType(String name, Integer removed) {
		this.name = name;
		this.removed = removed;
	}

	/** full constructor */
	public RelationRuleType(String name, String relationObj,
			Integer removed) {
		this.name = name;
		this.relationObj = relationObj;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="Generator")
	@SequenceGenerator(name="Generator",sequenceName="seq_af_relation_rule_type")
	@Column(name="ID",unique=true,nullable=false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "NAME", nullable = false, length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "RELATION_OBJ")
	public String getRelationObj() {
		return this.relationObj;
	}

	public void setRelationObj(String relationObj) {
		this.relationObj = relationObj;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}