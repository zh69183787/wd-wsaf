package com.wonders.frame.iims.model.bo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="IIMS_TARGET")
public class Target implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String type;
	private String key;
	private String value;
	private String time;
	private Integer removed;
	
	public Target() {
		this.removed=0;
	}

	public Target(String type, String key, String value,Integer removed) {
		this.type = type;
		this.key = key;
		this.value = value;
		this.removed=removed;
	}

	public Target(String type, String key, String value, String time,Integer removed) {
		this.type = type;
		this.key = key;
		this.value = value;
		this.time = time;
		this.removed=removed;
	}

	public Target(Integer id, String type, String key, String value, String time,Integer removed) {
		this.id = id;
		this.type = type;
		this.key = key;
		this.value = value;
		this.time = time;
		this.removed=removed;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="Generator")
	@SequenceGenerator(name="Generator",sequenceName="seq_iims_target",allocationSize=1)
	@Column(name="ID",unique=true,nullable=false,precision=22,scale=0)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name="TYPE",length=30,nullable=false)
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name="KEY",length=50,nullable=false)
	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	@Column(name="VALUE",nullable=false)
	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Column(name="TIME",length=20,nullable=true)
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
	@Column(name="REMOVED",nullable=false)
	public Integer getRemoved() {
		return removed;
	}
	
	public void setRemoved(Integer removed) {
		this.removed = removed;
	}
}
