package com.wonders.frame.core.model.bo;

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
 * AfObjRelation entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "af_relation")
@ShowInView(name="关联信息")
public class Relation implements java.io.Serializable {

	// Fields
	@ShowInView(noUse=true)
	private static final long serialVersionUID = -4049405238385014656L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="上级联对象")
	private String ptype;
	@ShowInView(name="上级联对象ID")
	private Integer pid;
	@ShowInView(name="下级联对象")
	private String ntype;
	@ShowInView(name="下级联对象ID")
	private Integer nid;
	
	/**2014-12-12:taoweiwei*/
	//配置规则
	@ShowInView(name="配置规则类型")
	private String type;
	
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public Relation() {
		this.removed=0;
	}
	public Relation(String ptype, Integer pid, String ntype, Integer nid) {
		this.ptype = ptype;
		this.pid = pid;
		this.ntype = ntype;
		this.nid = nid;
		this.removed = 0;
	}
	
	public Relation(String ptype, Integer pid, String ntype, Integer nid,
			Integer removed) {
		this.ptype = ptype;
		this.pid = pid;
		this.ntype = ntype;
		this.nid = nid;
		this.removed = removed;
	}
	
	/** full constructor */
	public Relation(String ptype, Integer pid, String ntype, Integer nid,
			String type, Integer removed) {
		this.ptype = ptype;
		this.pid = pid;
		this.ntype = ntype;
		this.nid = nid;
		this.type = type;
		this.removed = removed;
	}
	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_af_relation",allocationSize=1)   
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "P_TYPE", length = 20, nullable = false)
	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	@Column(name = "P_ID", nullable = false)
	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	@Column(name = "N_TYPE", length = 20, nullable = false)
	public String getNtype() {
		return ntype;
	}

	public void setNtype(String ntype) {
		this.ntype = ntype;
	}

	@Column(name = "N_ID", nullable = false)
	public Integer getNid() {
		return nid;
	}

	public void setNid(Integer nid) {
		this.nid = nid;
	}
	
	@Column(name="TYPE",length=50,nullable=false)
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "REMOVED", nullable = false)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}