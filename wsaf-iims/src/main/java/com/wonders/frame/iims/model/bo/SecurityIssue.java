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
 * IimsSecurityIssue entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_SECURITY_ISSUE")
@ShowInView(name="安全问题")
public class SecurityIssue implements java.io.Serializable {

	@ShowInView(noUse=true)
	private static final long serialVersionUID = -7888293791436241171L;
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
	@ShowInView(name="问题来源")
	private String issueSource;
	@ShowInView(name="问题描述")
	private String issueDescription;
	@ShowInView(name="业务类别",operateType=OperateType.SELECT,ccateType="securityIssueCate")
	private String issueCate;
	@ShowInView(name="科目",operateType=OperateType.SELECT,ccateType="securityIssueSubject")
	private String issueSubject;
	@ShowInView(name="科目子类",operateType=OperateType.SELECT,ccateType="securityIssueItem")
	private String issueItem;
	@ShowInView(name="整改方案",operateType=OperateType.SELECT,ccateType="rectifyPlan")
	private String rectifyPlan;
	@ShowInView(name="实际情况",operateType=OperateType.SELECT,ccateType="actualSituation")
	private String actualSituation;
	@ShowInView(name="计划开始时间")
	private Date startTime;
	@ShowInView(name="计划完成时间")
	private Date finishTime;
	@ShowInView(name="整改方案备注")
	private String rectifyRemark;
	@ShowInView(name="复核情况",operateType=OperateType.SELECT,ccateType="checkSituation")
	private String checkSituation;
	@ShowInView(name="跟踪日期")
	private Date traceDate;
	@ShowInView(name="跟踪信息备注")
	private String traceRemark;
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
	@ShowInView(name="审批状态",operateType=OperateType.SELECT,ccateType="securityIssueStatus")
	private String status;		
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public SecurityIssue() {
		this.removed=0;
	}

	/** minimal constructor */
	public SecurityIssue(Integer id, String companyId, String company,
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
	public SecurityIssue(Integer id, String companyId, String company,
			Date findTime, String relateSys, String issueSource,
			String issueDescription, String issueCate, String issueSubject,
			String issueItem, String rectifyPlan, String actualSituation,
			Date startTime, Date finishTime, String rectifyRemark,
			String checkSituation, Date traceDate, String traceRemark,
			String applyer, String applyerLoginname, Date applyTime,
			String initiator, String initiatorLoginname, Date initiateTime,
			String suggestion, String handler, String handlerLoginname,
			String status, Integer removed) {
		this.id = id;
		this.companyId = companyId;
		this.company = company;
		this.findTime = findTime;
		this.relateSys = relateSys;
		this.issueSource = issueSource;
		this.issueDescription = issueDescription;
		this.issueCate = issueCate;
		this.issueSubject = issueSubject;
		this.issueItem = issueItem;
		this.rectifyPlan = rectifyPlan;
		this.actualSituation = actualSituation;
		this.startTime = startTime;
		this.finishTime = finishTime;
		this.rectifyRemark = rectifyRemark;
		this.checkSituation = checkSituation;
		this.traceDate = traceDate;
		this.traceRemark = traceRemark;
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
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_security_issue",allocationSize=1)	
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

	@Column(name = "ISSUE_SOURCE", length = 200)
	public String getIssueSource() {
		return this.issueSource;
	}

	public void setIssueSource(String issueSource) {
		this.issueSource = issueSource;
	}

	@Column(name = "ISSUE_DESCRIPTION", length = 500)
	public String getIssueDescription() {
		return this.issueDescription;
	}

	public void setIssueDescription(String issueDescription) {
		this.issueDescription = issueDescription;
	}

	@Column(name = "ISSUE_CATE", length = 50)
	public String getIssueCate() {
		return this.issueCate;
	}

	public void setIssueCate(String issueCate) {
		this.issueCate = issueCate;
	}

	@Column(name = "ISSUE_SUBJECT", length = 50)
	public String getIssueSubject() {
		return this.issueSubject;
	}

	public void setIssueSubject(String issueSubject) {
		this.issueSubject = issueSubject;
	}

	@Column(name = "ISSUE_ITEM", length = 50)
	public String getIssueItem() {
		return this.issueItem;
	}

	public void setIssueItem(String issueItem) {
		this.issueItem = issueItem;
	}

	@Column(name = "RECTIFY_PLAN", length = 2000)
	public String getRectifyPlan() {
		return this.rectifyPlan;
	}

	public void setRectifyPlan(String rectifyPlan) {
		this.rectifyPlan = rectifyPlan;
	}

	@Column(name = "ACTUAL_SITUATION", length = 1000)
	public String getActualSituation() {
		return this.actualSituation;
	}

	public void setActualSituation(String actualSituation) {
		this.actualSituation = actualSituation;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "START_TIME", length = 7)
	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "FINISH_TIME", length = 7)
	public Date getFinishTime() {
		return this.finishTime;
	}

	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}

	@Column(name = "RECTIFY_REMARK", length = 500)
	public String getRectifyRemark() {
		return this.rectifyRemark;
	}

	public void setRectifyRemark(String rectifyRemark) {
		this.rectifyRemark = rectifyRemark;
	}

	@Column(name = "CHECK_SITUATION", length = 1000)
	public String getCheckSituation() {
		return this.checkSituation;
	}

	public void setCheckSituation(String checkSituation) {
		this.checkSituation = checkSituation;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "TRACE_DATE", length = 7)
	public Date getTraceDate() {
		return this.traceDate;
	}

	public void setTraceDate(Date traceDate) {
		this.traceDate = traceDate;
	}

	@Column(name = "TRACE_REMARK", length = 500)
	public String getTraceRemark() {
		return this.traceRemark;
	}

	public void setTraceRemark(String traceRemark) {
		this.traceRemark = traceRemark;
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