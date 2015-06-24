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
 * QteOption entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "QTE_OPTION")
@ShowInView(name="选项")
public class QteOption implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 1L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="所属问题id",operateType=OperateType.HIDDEN)
	private Integer quesId;
	@ShowInView(name="选项")
	private String code;
	@ShowInView(name="选项值")
	private String value;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public QteOption() {
		this.removed=0;
	}

	/** full constructor */
	public QteOption(Integer quesId, String code, String value,
			Integer removed) {
		this.quesId = quesId;
		this.code = code;
		this.value = value;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="Generator")
	@SequenceGenerator(name="Generator",sequenceName="seq_qte_option",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "QUES_ID", nullable = false, precision = 22, scale = 0)
	public Integer getQuesId() {
		return this.quesId;
	}

	public void setQuesId(Integer quesId) {
		this.quesId = quesId;
	}

	@Column(name = "CODE", nullable = false, length = 10)
	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "VALUE", nullable = false, length = 500)
	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}