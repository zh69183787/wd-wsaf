package com.wonders.frame.iims.crmmodel.bo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="dep_faci_his")
public class DepFaciHis implements Serializable{

	private static final long serialVersionUID = 1L;
	
	// Fields
	private String department;
	private String department2;
	private String serialNo;
	private Date beginTime;
	private Date endTime;
	
	// Constructors
    /** default constructor */
	public DepFaciHis() {}

	/** full constructor */
	public DepFaciHis(String department, String department2, String serialNo,Date beginTime, Date endTime) {
		this.department = department;
		this.department2 = department2;
		this.serialNo = serialNo;
		this.beginTime = beginTime;
		this.endTime = endTime;
	}

	@Id
	@Column(name="serial_no",length=50,nullable=false)
	public String getSerialNo() {
		return serialNo;
	}

	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}
	
	@Column(name="department",length=50)
	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	@Column(name="department2",length=50)
	public String getDepartment2() {
		return department2;
	}

	public void setDepartment2(String department2) {
		this.department2 = department2;
	}

	@Column(name="begin_time")
	@Temporal(TemporalType.TIMESTAMP)
	public Date getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	@Column(name="end_time")
	@Temporal(TemporalType.TIMESTAMP)
	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Override
	public String toString() {
		return "DepFaciHis [department=" + department + ", department2="
				+ department2 + ", serialNo=" + serialNo + ", beginTime="
				+ beginTime + ", endTime=" + endTime + "]";
	}
}
