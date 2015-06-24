package com.wonders.frame.ias.model.bo;

import com.wonders.frame.core.tags.ShowInView;
import com.wonders.frame.core.tags.ShowInView.OperateType;

import javax.persistence.*;
import java.util.Date;

/**
 * IasStaff entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IAS_REG")
@ShowInView(name="考勤填报人员")
public class IasReg implements java.io.Serializable {
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
	private String unitCode;
	@ShowInView(name="所属单位")
	private String unit;
	@ShowInView(name="所属部门编码")
	private String deptCode;
	@ShowInView(name="所属部门")
	private String dept;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public IasReg() {
		this.removed=0;
	}

	/** minimal constructor */
	public IasReg(Integer id, String staffName, String staffCode,
                  String loginName, String idCard, String gender, Integer removed) {
		this.id = id;
		this.staffName = staffName;
		this.staffCode = staffCode;
		this.loginName = loginName;
		this.removed = removed;
	}

	/** full constructor */
	public IasReg(Integer id, String staffName, String staffCode,
                  String loginName, String idCard, String gender, String staffType,
                  String unit, String unitCode, String dept, String deptCode, Date inTime, Date outTime, String manualEntry,
                  String remark, Integer removed) {
		this.id = id;
		this.staffName = staffName;
		this.staffCode = staffCode;
		this.loginName = loginName;
		this.unitCode = unitCode;
		this.unit = unit;
		this.deptCode = deptCode;		
		this.dept = dept;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_ias_reg",allocationSize=1)
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

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}