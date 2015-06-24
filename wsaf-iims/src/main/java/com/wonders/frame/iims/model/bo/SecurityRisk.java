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
import javax.validation.constraints.NotNull;

import com.wonders.frame.core.tags.ShowInView;
import com.wonders.frame.core.tags.ShowInView.OperateType;

/**
 * IimsSecurityRisk entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_SECURITY_RISK")
@ShowInView(name="安全风险")
public class SecurityRisk implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 304923703845687468L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="单位ID")
	private String companyId;
	@ShowInView(name="单位名称")
	private String company;
	@ShowInView(name="发现时间")
	private Date findTime;
	@ShowInView(name="关联系统")
	private String relateSys;
	@ShowInView(name="风险类别",operateType=OperateType.SELECT,ccateType="securityRiskType")
	private String riskType;
	@ShowInView(name="风险等级",operateType=OperateType.SELECT,ccateType="securityRiskLevel")
	private String riskLevel;
	@ShowInView(name="风险描述")
	private String riskDescription;
	@ShowInView(name="风险来源")
	private String riskSource;
	@ShowInView(name="风险处置方案",operateType=OperateType.SELECT,ccateType="securityRiskHandle")
	private String handlePlan;
	@ShowInView(name="处理跟踪情况",operateType=OperateType.SELECT,ccateType="securityRiskTrace")
	private String traceCase;
	@ShowInView(name="跟踪日期")
	private Date traceDate;
	@ShowInView(name="风险处置时限")
	private String handleTimeLimit;
	@ShowInView(name="风险确认日期")
	private Date confirmDate;
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
	@ShowInView(name="提交时间")
	private Date initiateTime;
	@ShowInView(name="待处理人")
	private String handler;
	@ShowInView(name="待处理人工号")
	private String handlerLoginname;
	@ShowInView(name="建议&意见")
	private String suggestion;
	@ShowInView(name="审批状态",operateType=OperateType.SELECT,ccateType="securityRiskStatus")
	private String status;		
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public SecurityRisk() {
		this.removed=0;
	}

	/** minimal constructor */
	public SecurityRisk(Integer id, String companyId, String company,
			String applyer, String applyerLoginname, Date applyTime,
			String initiator, String initiatorLoginname, Date initiateTime,
			Integer removed) {
		this.id = id;
		this.companyId = companyId;
		this.company = company;
		this.applyer = applyer;
		this.applyerLoginname = applyerLoginname;
		this.applyTime = applyTime;
		this.initiator = initiator;
		this.initiatorLoginname = initiatorLoginname;
		this.initiateTime = initiateTime;
		this.removed = removed;
	}

	/** full constructor */
	public SecurityRisk(Integer id, String companyId, String company,
			Date findTime, String relateSys, String riskType, String riskLevel,
			String riskDescription, String riskSource, String handlePlan,
			String traceCase, Date traceDate, String handleTimeLimit,
			Date confirmDate, String applyer, String applyerLoginname,
			Date applyTime, String initiator, String initiatorLoginname,
			Date initiateTime, String suggestion, String handler,
			String handlerLoginname, String status, Integer removed) {
		this.id = id;
		this.companyId = companyId;
		this.company = company;
		this.findTime = findTime;
		this.relateSys = relateSys;
		this.riskType = riskType;
		this.riskLevel = riskLevel;
		this.riskDescription = riskDescription;
		this.riskSource = riskSource;
		this.handlePlan = handlePlan;
		this.traceCase = traceCase;
		this.traceDate = traceDate;
		this.handleTimeLimit = handleTimeLimit;
		this.confirmDate = confirmDate;
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
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_security_risk",allocationSize=1)	
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "COMPANY_ID", nullable = false, length = 10)
	public String getCompanyId() {
		return this.companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	@Column(name = "COMPANY", nullable = false, length = 50)
	public String getCompany() {
		return this.company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "FIND_TIME", length = 7)
	public Date getFindTime() {
		return this.findTime;
	}

	public void setFindTime(Date findTime) {
		this.findTime = findTime;
	}

	@Column(name = "RELATE_SYS", length = 50)
	public String getRelateSys() {
		return this.relateSys;
	}

	public void setRelateSys(String relateSys) {
		this.relateSys = relateSys;
	}

	@Column(name = "RISK_TYPE", length = 50)
	public String getRiskType() {
		return this.riskType;
	}

	public void setRiskType(String riskType) {
		this.riskType = riskType;
	}

	@Column(name = "RISK_LEVEL", length = 50)
	public String getRiskLevel() {
		return this.riskLevel;
	}

	public void setRiskLevel(String riskLevel) {
		this.riskLevel = riskLevel;
	}

	@Column(name = "RISK_DESCRIPTION", length = 500)
	public String getRiskDescription() {
		return this.riskDescription;
	}

	public void setRiskDescription(String riskDescription) {
		this.riskDescription = riskDescription;
	}

	@Column(name = "RISK_SOURCE", length = 200)
	public String getRiskSource() {
		return this.riskSource;
	}

	public void setRiskSource(String riskSource) {
		this.riskSource = riskSource;
	}

	@Column(name = "HANDLE_PLAN", length = 2000)
	public String getHandlePlan() {
		return this.handlePlan;
	}

	public void setHandlePlan(String handlePlan) {
		this.handlePlan = handlePlan;
	}

	@Column(name = "TRACE_CASE", length = 1000)
	public String getTraceCase() {
		return this.traceCase;
	}

	public void setTraceCase(String traceCase) {
		this.traceCase = traceCase;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "TRACE_DATE", length = 7)
	public Date getTraceDate() {
		return this.traceDate;
	}

	public void setTraceDate(Date traceDate) {
		this.traceDate = traceDate;
	}

	@Column(name = "HANDLE_TIME_LIMIT", length = 50)
	public String getHandleTimeLimit() {
		return this.handleTimeLimit;
	}

	public void setHandleTimeLimit(String handleTimeLimit) {
		this.handleTimeLimit = handleTimeLimit;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "CONFIRM_DATE", length = 7)
	public Date getConfirmDate() {
		return this.confirmDate;
	}

	public void setConfirmDate(Date confirmDate) {
		this.confirmDate = confirmDate;
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

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}