package com.wonders.frame.core.model.bo;

import java.io.Serializable;

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
 * 
 * @author taoweiwei
 *
 */
@Entity
@Table(name="af_relation_rule")
@ShowInView(name="关联规则配置")
public class RelationRule implements Serializable{

	//Fields
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 1L;
	
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="上级联对象")
	private String ptype;
	@ShowInView(name="下级联对象")
	private String ntype;
	@ShowInView(name="配置规则类型")
	private String type;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;
	
	@ShowInView(name="上级联对象ID")
	private Integer pid;
	@ShowInView(name="下级联对象ID")
	private Integer nid;
	
	
	//Constructors
	/**default constructor*/
	public RelationRule() {
		this.removed=0;
	}

	/**full constructor*/
	public RelationRule(String ptype, String ntype, String type, Integer removed, Integer pid, Integer nid) {
		this.ptype = ptype;
		this.ntype = ntype;
		this.type = type;
		this.removed = removed;
		this.pid = pid;
		this.nid = nid;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="Generator")
	@SequenceGenerator(name="Generator",sequenceName="seq_af_relation_rule")
	@Column(name="ID",unique=true,nullable=false)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name="P_TYPE",length=20,nullable=false)
	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	@Column(name="N_TYPE",length=20,nullable=false)
	public String getNtype() {
		return ntype;
	}

	public void setNtype(String ntype) {
		this.ntype = ntype;
	}

	@Column(name="TYPE",length=50,nullable=false)
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name="REMOVED",nullable=false)
	public Integer getRemoved() {
		return removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

	@Column(name = "P_ID", nullable = false)
	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	@Column(name = "N_ID", nullable = false)
	public Integer getNid() {
		return nid;
	}

	public void setNid(Integer nid) {
		this.nid = nid;
	}
	
}
