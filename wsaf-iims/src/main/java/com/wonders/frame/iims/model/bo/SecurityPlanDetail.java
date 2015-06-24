package com.wonders.frame.iims.model.bo;

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
 * IimsSecurityPlanDetail entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_SECURITY_PLAN_DETAIL")
@ShowInView(name="目标计划详细")
public class SecurityPlanDetail implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = -8478216378411467623L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="目标计划ID",operateType=OperateType.HIDDEN)
	private Integer planId;
	@ShowInView(name="计划类型",operateType=OperateType.SELECT,ccateType="planType")
	private String planType;
	@ShowInView(name="业务层级",operateType=OperateType.SELECT,ccateType="planBusinessLevel")
	private String businessLevel;
	@ShowInView(name="项目编号")
	private String projectNum;
	@ShowInView(name="项目名称")
	private String projectName;
	@ShowInView(name="系统名称")
	private String systemName;
	@ShowInView(name="系统等级",operateType=OperateType.SELECT,ccateType="planSystemLevel")
	private String systemLevel;
	@ShowInView(name="主要内容")
	private String mainContent;
	@ShowInView(name="实施方",operateType=OperateType.SELECT,ccateType="planImplement")
	private String implement;
	@ShowInView(name="计划开始时间")
	private Date planStartTime;
	@ShowInView(name="计划结束时间")
	private Date planEndTime;
	@ShowInView(name="费用")
	private String cost;
	@ShowInView(name="目标计划")
	private String targetPlan;
	@ShowInView(name="实际完成时间")
	private Date completeTime;
	@ShowInView(name="完成状态标志位")
	private Integer finished;
	@ShowInView(name="备注")
	private String remarks;

	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public SecurityPlanDetail() {
		this.removed=0;
	}

	/** minimal constructor */
	public SecurityPlanDetail(Integer id, Integer planId,
			String planType, Integer finished,Integer removed) {
		this.id = id;
		this.planId = planId;
		this.planType = planType;
		this.finished = finished;
		this.removed = removed;
	}

	/** full constructor */
	public SecurityPlanDetail(Integer id, Integer planId,
			String planType, String businessLevel, String projectNum,
			String projectName, String systemName, String systemLevel,
			String mainContent, String implement, Date planStartTime,
			Date planEndTime, String cost, String targetPlan,
			Date completeTime, Integer finished, String remarks,
			Integer removed) {
		this.id = id;
		this.planId = planId;
		this.planType = planType;
		this.businessLevel = businessLevel;
		this.projectNum = projectNum;
		this.projectName = projectName;
		this.systemName = systemName;
		this.systemLevel = systemLevel;
		this.mainContent = mainContent;
		this.implement = implement;
		this.planStartTime = planStartTime;
		this.planEndTime = planEndTime;
		this.cost = cost;
		this.targetPlan = targetPlan;
		this.completeTime = completeTime;
		this.finished = finished;
		this.remarks = remarks;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_security_plan_d",allocationSize=1)	
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "PLAN_ID", nullable = false, precision = 22, scale = 0)
	public Integer getPlanId() {
		return this.planId;
	}

	public void setPlanId(Integer planId) {
		this.planId = planId;
	}

	@Column(name = "PLAN_TYPE", nullable = false, length = 50)
	public String getPlanType() {
		return this.planType;
	}

	public void setPlanType(String planType) {
		this.planType = planType;
	}

	@Column(name = "BUSINESS_LEVEL", length = 50)
	public String getBusinessLevel() {
		return this.businessLevel;
	}

	public void setBusinessLevel(String businessLevel) {
		this.businessLevel = businessLevel;
	}

	@Column(name = "PROJECT_NUM", length = 20)
	public String getProjectNum() {
		return this.projectNum;
	}

	public void setProjectNum(String projectNum) {
		this.projectNum = projectNum;
	}

	@Column(name = "PROJECT_NAME", length = 200)
	public String getProjectName() {
		return this.projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	@Column(name = "SYSTEM_NAME", length = 200)
	public String getSystemName() {
		return this.systemName;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}

	@Column(name = "SYSTEM_LEVEL", length = 50)
	public String getSystemLevel() {
		return this.systemLevel;
	}

	public void setSystemLevel(String systemLevel) {
		this.systemLevel = systemLevel;
	}

	@Column(name = "MAIN_CONTENT", length = 500)
	public String getMainContent() {
		return this.mainContent;
	}

	public void setMainContent(String mainContent) {
		this.mainContent = mainContent;
	}

	@Column(name = "IMPLEMENT", length = 50)
	public String getImplement() {
		return this.implement;
	}

	public void setImplement(String implement) {
		this.implement = implement;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "PLAN_START_TIME", length = 7)
	public Date getPlanStartTime() {
		return this.planStartTime;
	}

	public void setPlanStartTime(Date planStartTime) {
		this.planStartTime = planStartTime;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "PLAN_END_TIME", length = 7)
	public Date getPlanEndTime() {
		return this.planEndTime;
	}

	public void setPlanEndTime(Date planEndTime) {
		this.planEndTime = planEndTime;
	}

	@Column(name = "COST", length = 20)
	public String getCost() {
		return this.cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	@Column(name = "TARGET_PLAN", length = 500)
	public String getTargetPlan() {
		return this.targetPlan;
	}

	public void setTargetPlan(String targetPlan) {
		this.targetPlan = targetPlan;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "COMPLETE_TIME", length = 7)
	public Date getCompleteTime() {
		return this.completeTime;
	}

	public void setCompleteTime(Date completeTime) {
		this.completeTime = completeTime;
	}

	@Column(name = "FINISHED", nullable = false, precision = 22, scale = 0)
	public Integer getFinished() {
		return this.finished;
	}

	public void setFinished(Integer finished) {
		this.finished = finished;
	}

	@Column(name = "REMARKS", length = 500)
	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}


	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}