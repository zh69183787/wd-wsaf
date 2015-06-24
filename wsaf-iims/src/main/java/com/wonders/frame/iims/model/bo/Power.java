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
 * IimsPrivilege entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_POWER")
@ShowInView(name="权限")
public class Power implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = -1226524428087036918L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	private String users;
	private String modules;
	private String allowOperate;
	private String operator;
	private Date operateTime;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public Power() {
		this.removed=0;
	}

	/** minimal constructor */
	public Power(Integer id, String users, String modules,
			Integer removed) {
		this.id = id;
		this.users = users;
		this.modules = modules;
		this.removed = removed;
	}

	/** full constructor */
	public Power(Integer id, String users, String modules,
			String allowOperate, String operator, Date operateTime,
			Integer removed) {
		this.id = id;
		this.users = users;
		this.modules = modules;
		this.allowOperate = allowOperate;
		this.operator = operator;
		this.operateTime = operateTime;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_power",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "USERS", nullable = false, length = 500)
	public String getUsers() {
		return this.users;
	}

	public void setUsers(String users) {
		this.users = users;
	}

	@Column(name = "MODULES", nullable = false, length = 1000)
	public String getModules() {
		return this.modules;
	}

	public void setModules(String modules) {
		this.modules = modules;
	}

	@Column(name = "ALLOW_OPERATE", length = 50)
	public String getAllowOperate() {
		return this.allowOperate;
	}

	public void setAllowOperate(String allowOperate) {
		this.allowOperate = allowOperate;
	}

	@Column(name = "OPERATOR", length = 50)
	public String getOperator() {
		return this.operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "OPERATE_TIME", length = 7)
	public Date getOperateTime() {
		return this.operateTime;
	}

	public void setOperateTime(Date operateTime) {
		this.operateTime = operateTime;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}