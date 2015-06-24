package com.wonders.frame.iims.model.bo;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import com.wonders.frame.core.model.vo.GenericEnum;
import com.wonders.frame.core.tags.ShowInView;
import com.wonders.frame.core.tags.ShowInView.OperateType;

/**
 * IimsSecurityPlan entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_SECURITY_PLAN")
@ShowInView(name="目标计划")
public class SecurityPlan implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = -9012833049131013496L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="单位",operateType=OperateType.SELECT,ccateType="securityCompany")
	private String company;
	@ShowInView(name="计划年度",operateType=OperateType.SELECT,ccateType="planYear",allowOptionNull=false)
	private String planYear;
	@ShowInView(name="通知工作负责人")
	private YesOrNo nodifyDeptLeader;
	@ShowInView(name="业务状态",operateType=OperateType.SELECT,ccateType="planBusinessStatus")
	private String businessStatus;
	@ShowInView(name="申请人")
	private String applyer;
	@ShowInView(name="申请人工号")
	private String applyerLoginname;
	@NotNull(message="时间不可为空")
	@ShowInView(name="申请时间")	
	private Date applyTime;
	@ShowInView(name="提交人")
	private String initiator;
	@ShowInView(name="提交人工号")
	private String initiatorLoginname;
	@NotNull(message="时间不可为空")
	@ShowInView(name="提交时间")
	private Date initiateTime;
	@ShowInView(name="待处理人")
	private String handler;
	@ShowInView(name="待处理人工号")
	private String handlerLoginname;
	@ShowInView(name="建议&意见")
	private String suggestion;
	@ShowInView(name="审批状态",operateType=OperateType.SELECT,ccateType="securityPlanStatus")
	private String status;
	@ShowInView(name="是否历史记录")
	private Integer ishistory;		
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public SecurityPlan() {
		this.removed=0;
	}

	/** minimal constructor */
	public SecurityPlan(Integer id, String company, String planYear,
			String applyer, String applyerLoginname, Date applyTime,
			String initiator, String initiatorLoginname, Date initiateTime,
			Integer ishistory,Integer removed) {
		this.id = id;
		this.company = company;
		this.planYear = planYear;
		this.applyer = applyer;
		this.applyerLoginname = applyerLoginname;
		this.applyTime = applyTime;
		this.initiator = initiator;
		this.initiatorLoginname = initiatorLoginname;
		this.initiateTime = initiateTime;
		this.ishistory=ishistory;
		this.removed = removed;
	}

	/** full constructor */
	public SecurityPlan(Integer id, String company, String planYear,
			YesOrNo nodifyDeptLeader, String businessStatus, String applyer,
			String applyerLoginname, Date applyTime, String initiator,
			String initiatorLoginname, Date initiateTime, String suggestion,
			String handler, String handlerLoginname, String status,
			Integer ishistory,Integer removed) {
		this.id = id;
		this.company = company;
		this.planYear = planYear;
		this.nodifyDeptLeader = nodifyDeptLeader;
		this.businessStatus = businessStatus;
		this.applyer = applyer;
		this.applyerLoginname = applyerLoginname;
		this.applyTime = applyTime;
		this.initiator = initiator;
		this.initiatorLoginname = initiatorLoginname;
		this.initiateTime = initiateTime;
		this.suggestion = suggestion;
		this.handler = handler;
		this.handlerLoginname = handlerLoginname;
		this.status = status;
		this.ishistory=ishistory;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_security_plan",allocationSize=1)	
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "COMPANY", nullable = false, length = 50)
	public String getCompany() {
		return this.company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	@Column(name = "PLAN_YEAR", nullable = false, length = 4)
	public String getPlanYear() {
		return this.planYear;
	}

	public void setPlanYear(String planYear) {
		this.planYear = planYear;
	}

	@Column(name = "NODIFY_DEPT_LEADER", length = 50)
	@Enumerated(EnumType.STRING)
	public YesOrNo getNodifyDeptLeader() {
		return this.nodifyDeptLeader;
	}

	public void setNodifyDeptLeader(YesOrNo nodifyDeptLeader) {
		this.nodifyDeptLeader = nodifyDeptLeader;
	}

	@Column(name = "BUSINESS_STATUS", length = 50)
	public String getBusinessStatus() {
		return this.businessStatus;
	}

	public void setBusinessStatus(String businessStatus) {
		this.businessStatus = businessStatus;
	}

	@Column(name = "APPLYER", nullable = false, length = 200)
	public String getApplyer() {
		return this.applyer;
	}

	public void setApplyer(String applyer) {
		this.applyer = applyer;
	}

	@Column(name = "APPLYER_LOGINNAME", nullable = false, length = 200)
	public String getApplyerLoginname() {
		return this.applyerLoginname;
	}

	public void setApplyerLoginname(String applyerLoginname) {
		this.applyerLoginname = applyerLoginname;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "APPLY_TIME", nullable = false, length = 7)
	public Date getApplyTime() {
		return this.applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	@Column(name = "INITIATOR", nullable = false, length = 200)
	public String getInitiator() {
		return this.initiator;
	}

	public void setInitiator(String initiator) {
		this.initiator = initiator;
	}

	@Column(name = "INITIATOR_LOGINNAME", nullable = false, length = 200)
	public String getInitiatorLoginname() {
		return this.initiatorLoginname;
	}

	public void setInitiatorLoginname(String initiatorLoginname) {
		this.initiatorLoginname = initiatorLoginname;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "INITIATE_TIME", nullable = false, length = 7)
	public Date getInitiateTime() {
		return this.initiateTime;
	}

	public void setInitiateTime(Date initiateTime) {
		this.initiateTime = initiateTime;
	}

	@Column(name = "SUGGESTION", length = 1500)
	public String getSuggestion() {
		return this.suggestion;
	}

	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}

	@Column(name = "HANDLER", length = 200)
	public String getHandler() {
		return this.handler;
	}

	public void setHandler(String handler) {
		this.handler = handler;
	}

	@Column(name = "HANDLER_LOGINNAME", length = 200)
	public String getHandlerLoginname() {
		return this.handlerLoginname;
	}

	public void setHandlerLoginname(String handlerLoginname) {
		this.handlerLoginname = handlerLoginname;
	}

	@Column(name = "STATUS", length = 50)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Column(name = "ISHISTORY", nullable = false, precision = 22, scale = 0)
	public Integer getIshistory() {
		return this.ishistory;
	}

	public void setIshistory(Integer ishistory) {
		this.ishistory = ishistory;
	}	

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}
	public static enum YesOrNo implements GenericEnum{
		YES(1,"是"), NO(2,"否");

		private int code;
		private String description;
		
		private YesOrNo(int code,String description){
			this.code=code;	
			this.description=description;	
		}
		public int code(){
			return code;
		}
		public String description(){
			return description;
		}
	}
}