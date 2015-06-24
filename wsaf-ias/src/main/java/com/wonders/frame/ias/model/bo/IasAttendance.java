package com.wonders.frame.ias.model.bo;

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
 * IasAttendance entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IAS_ATTENDANCE")
@ShowInView(name="考勤记录")
public class IasAttendance implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 7546419291750984110L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="流转情况ID")
	private Integer workflowId;
	@ShowInView(name="考勤人员ID")
	private Integer staffId;
	@ShowInView(name="人员姓名")
	private String staffName;	
	@ShowInView(name="人员编号")
	private String staffCode;
	@ShowInView(name="考勤月份")
	private String iasMonth;	
	@ShowInView(name="考勤记录",operateType=OperateType.SELECT,ccateType="iasAttendanceType")
	private String rec;
	@ShowInView(name="备注")
	private String remark;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)	
	private Integer removed;

	// Constructors

	/** default constructor */
	public IasAttendance() {
		this.removed=0;
	}

	/** minimal constructor */
	public IasAttendance(Integer id, Integer staffId, String iasMonth,
			Integer removed) {
		this.id = id;
		this.staffId = staffId;
		this.iasMonth = iasMonth;
		this.removed = removed;
	}

	/** full constructor */
	public IasAttendance(Integer id, Integer workflowId,
			Integer staffId,String staffName,String staffCode,String iasMonth, String rec, String remark, Integer removed) {
		this.id = id;
		this.staffName = staffName;
		this.staffCode = staffCode;
		this.workflowId = workflowId;
		this.staffId = staffId;
		this.iasMonth = iasMonth;
		this.rec = rec;
		this.remark = remark;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_ias_attendance",allocationSize=1)	
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "WORKFLOW_ID", precision = 22, scale = 0)
	public Integer getWorkflowId() {
		return this.workflowId;
	}

	public void setWorkflowId(Integer workflowId) {
		this.workflowId = workflowId;
	}

	@Column(name = "STAFF_ID", nullable = false, precision = 22, scale = 0)
	public Integer getStaffId() {
		return this.staffId;
	}

	public void setStaffId(Integer staffId) {
		this.staffId = staffId;
	}


	@Column(name = "STAFF_NAME", length = 50)
	public String getStaffName() {
		return this.staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	

	@Column(name = "STAFF_CODE", length = 50)
	public String getStaffCode() {
		return this.staffCode;
	}

	public void setStaffCode(String staffCode) {
		this.staffCode = staffCode;
	}
	
	@Column(name = "IAS_MONTH", nullable = false, length = 7)
	public String getIasMonth() {
		return this.iasMonth;
	}

	public void setIasMonth(String iasMonth) {
		this.iasMonth = iasMonth;
	}
	
	@Column(name = "REC", length = 2000)
	public String getRec() {
		return this.rec;
	}

	public void setRec(String rec) {
		this.rec = rec;
	}

	@Column(name = "REMARK", length = 200)
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