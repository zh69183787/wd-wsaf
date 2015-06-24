package com.wonders.frame.ias.model.bo;

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
 * IasStaff entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IAS_STAFF")
@ShowInView(name="考勤人员")
public class IasStaff implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 3489949983026516185L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="人员姓名")
	private String staffName;
	@ShowInView(name="人员编号")
	private String staffCode;
	@ShowInView(name="人员工号")
	private String loginName;
	@ShowInView(name="身份证号")
	private String idCard;
	@ShowInView(name="性别",operateType=OperateType.SELECT,ccateType="iasGender")
	private String gender;
	@ShowInView(name="员工性质",operateType=OperateType.SELECT,ccateType="iasStaffType")
	private String staffType;
	@ShowInView(name="所属单位编码")
	private String unitCode;
	@ShowInView(name="所属单位")
	private String unit;
	@ShowInView(name="所属部门编码")
	private String deptCode;	
	@ShowInView(name="所属部门")
	private String dept;
	@ShowInView(name="调入时间")
	private Date inTime;
	@ShowInView(name="调出时间")
	private Date outTime;
	@ShowInView(name="是否手工录入",operateType=OperateType.SELECT,ccateType="yesOrNo")
	private String manualEntry;
	@ShowInView(name="备注")
	private String remark;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)		
	private Integer removed;

	// Constructors

	/** default constructor */
	public IasStaff() {
		this.removed=0;
	}

	/** minimal constructor */
	public IasStaff(Integer id, String staffName, String staffCode,
			String loginName, String idCard, String gender, Integer removed) {
		this.id = id;
		this.staffName = staffName;
		this.staffCode = staffCode;
		this.loginName = loginName;
		this.idCard = idCard;
		this.gender = gender;
		this.removed = removed;
	}

	/** full constructor */
	public IasStaff(Integer id, String staffName, String staffCode,
			String loginName, String idCard, String gender, String staffType,
			String unit,String unitCode,String dept,String deptCode, Date inTime, Date outTime, String manualEntry,
			String remark, Integer removed) {
		this.id = id;
		this.staffName = staffName;
		this.staffCode = staffCode;
		this.loginName = loginName;
		this.idCard = idCard;
		this.gender = gender;
		this.staffType = staffType;
		this.unitCode = unitCode;
		this.unit = unit;
		this.deptCode = deptCode;		
		this.dept = dept;
		this.inTime = inTime;
		this.outTime = outTime;
		this.manualEntry = manualEntry;
		this.remark = remark;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_ias_staff",allocationSize=1)	
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "STAFF_NAME", nullable = false, length = 50)
	public String getStaffName() {
		return this.staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	@Column(name = "STAFF_CODE", nullable = false, length = 50)
	public String getStaffCode() {
		return this.staffCode;
	}

	public void setStaffCode(String staffCode) {
		this.staffCode = staffCode;
	}

	@Column(name = "LOGIN_NAME", length = 50)
	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@Column(name = "ID_CARD", length = 50)
	public String getIdCard() {
		return this.idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	@Column(name = "GENDER", length = 50)
	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Column(name = "STAFF_TYPE", length = 50)
	public String getStaffType() {
		return this.staffType;
	}

	public void setStaffType(String staffType) {
		this.staffType = staffType;
	}

	@Column(name = "UNIT", length = 100)
	public String getUnit() {
		return this.unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	@Column(name = "UNIT_CODE", length = 20)
	public String getUnitCode() {
		return this.unitCode;
	}

	public void setUnitCode(String unitCode) {
		this.unitCode = unitCode;
	}
	
	@Column(name = "DEPT", length = 100)
	public String getDept() {
		return this.dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}
	
	@Column(name = "DEPT_CODE", length = 20)
	public String getDeptCode() {
		return this.deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "IN_TIME")
	public Date getInTime() {
		return this.inTime;
	}

	public void setInTime(Date inTime) {
		this.inTime = inTime;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "OUT_TIME")
	public Date getOutTime() {
		return this.outTime;
	}

	public void setOutTime(Date outTime) {
		this.outTime = outTime;
	}

	@Column(name = "MANUAL_ENTRY", length = 50)
	public String getManualEntry() {
		return this.manualEntry;
	}

	public void setManualEntry(String manualEntry) {
		this.manualEntry = manualEntry;
	}

	@Column(name = "REMARK", length = 500)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}