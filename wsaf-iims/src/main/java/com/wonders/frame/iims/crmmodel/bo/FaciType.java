package com.wonders.frame.iims.crmmodel.bo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 设备类型
 * @author Administrator
 */
@Entity
@Table(name="faci_type")
public class FaciType implements Serializable{

	private static final long serialVersionUID = 1L;
	
	// Fields
	private Integer id;
	private String lei1;
	private String name;
	private String fatherLei;
	
	// Constructors
    /** default constructor */
	public FaciType() {}

	/** full constructor */
	public FaciType(Integer id, String lei1, String name, String fatherLei) {
		this.id = id;
		this.lei1 = lei1;
		this.name = name;
		this.fatherLei = fatherLei;
	}

	@Id
	@Column(name="id")
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name="lei1",length=50,nullable=false)
	public String getLei1() {
		return lei1;
	}

	public void setLei1(String lei1) {
		this.lei1 = lei1;
	}

	@Column(name="name",length=50)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name="father_lei",length=50)
	public String getFatherLei() {
		return fatherLei;
	}

	public void setFatherLei(String fatherLei) {
		this.fatherLei = fatherLei;
	}
}
