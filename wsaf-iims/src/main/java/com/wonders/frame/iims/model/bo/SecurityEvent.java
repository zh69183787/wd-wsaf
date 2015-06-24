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
 * IimsSecurityEvent entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_SECURITY_EVENT")
@ShowInView(name="安全事件")
public class SecurityEvent implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = -2804370747983992076L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="单位ID")
	private String companyId;
	@ShowInView(name="单位名称")
	private String company;
	@ShowInView(name="报告时间")
	private Date reportTime;
	@ShowInView(name="联系方式")
	private String contactWay;
	@ShowInView(name="实践报告人")
	private String reporter;
	@ShowInView(name="事件发生时间")
	private Date occurTime;
	@ShowInView(name="信息来源",operateType=OperateType.SELECT,ccateType="securityEventSource")
	private String infoSource;
	@ShowInView(name="业务分类",operateType=OperateType.SELECT,ccateType="securityEventCate")
	private String eventCate;
	@ShowInView(name="事件类型",operateType=OperateType.SELECT,ccateType="securityEventType")
	private String eventType;
	@ShowInView(name="事件等级",operateType=OperateType.SELECT,ccateType="securityEventLevel")
	private String eventLevel;
	@ShowInView(name="事件描述")
	private String eventDescription;
	@ShowInView(name="涉及网络或系统")
	private String relateNetSys;
	@ShowInView(name="处理结果")
	private String handleResult;
	@ShowInView(name="处理过程")
	private String handleProcess;
	@ShowInView(name="事件原因分析")
	private String reasonAnalyze;
	@ShowInView(name="备注")
	private String remark;
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
	@ShowInView(name="审批状态",operateType=OperateType.SELECT,ccateType="securityEventStatus")
	private String status;		
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public SecurityEvent() {
		this.removed=0;
	}

	/** minimal constructor */
	public SecurityEvent(Integer id, String companyId, String company,
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
	public SecurityEvent(Integer id, String companyId, String company,
			Date reportTime, String contactWay, String reporter,
			Date occurTime, String infoSource, String eventCate,
			String eventType, String eventLevel, String eventDescription,
			String relateNetSys, String handleResult, String handleProcess,
			String reasonAnalyze, String remark, String applyer,
			String applyerLoginname, Date applyTime, String initiator,
			String initiatorLoginname, Date initiateTime, String suggestion,
			String handler, String handlerLoginname, String status,
			Integer removed) {
		this.id = id;
		this.companyId = companyId;
		this.company = company;
		this.reportTime = reportTime;
		this.contactWay = contactWay;
		this.reporter = reporter;
		this.occurTime = occurTime;
		this.infoSource = infoSource;
		this.eventCate = eventCate;
		this.eventType = eventType;
		this.eventLevel = eventLevel;
		this.eventDescription = eventDescription;
		this.relateNetSys = relateNetSys;
		this.handleResult = handleResult;
		this.handleProcess = handleProcess;
		this.reasonAnalyze = reasonAnalyze;
		this.remark = remark;
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
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_security_event",allocationSize=1)	
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
	@Column(name = "REPORT_TIME", length = 7)
	public Date getReportTime() {
		return this.reportTime;
	}

	public void setReportTime(Date reportTime) {
		this.reportTime = reportTime;
	}

	@Column(name = "CONTACT_WAY", length = 50)
	public String getContactWay() {
		return this.contactWay;
	}

	public void setContactWay(String contactWay) {
		this.contactWay = contactWay;
	}

	@Column(name = "REPORTER", length = 50)
	public String getReporter() {
		return this.reporter;
	}

	public void setReporter(String reporter) {
		this.reporter = reporter;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "OCCUR_TIME", length = 7)
	public Date getOccurTime() {
		return this.occurTime;
	}

	public void setOccurTime(Date occurTime) {
		this.occurTime = occurTime;
	}

	@Column(name = "INFO_SOURCE", length = 200)
	public String getInfoSource() {
		return this.infoSource;
	}

	public void setInfoSource(String infoSource) {
		this.infoSource = infoSource;
	}

	@Column(name = "EVENT_CATE", length = 50)
	public String getEventCate() {
		return this.eventCate;
	}

	public void setEventCate(String eventCate) {
		this.eventCate = eventCate;
	}

	@Column(name = "EVENT_TYPE", length = 50)
	public String getEventType() {
		return this.eventType;
	}

	public void setEventType(String eventType) {
		this.eventType = eventType;
	}

	@Column(name = "EVENT_LEVEL", length = 50)
	public String getEventLevel() {
		return this.eventLevel;
	}

	public void setEventLevel(String eventLevel) {
		this.eventLevel = eventLevel;
	}

	@Column(name = "EVENT_DESCRIPTION", length = 500)
	public String getEventDescription() {
		return this.eventDescription;
	}

	public void setEventDescription(String eventDescription) {
		this.eventDescription = eventDescription;
	}

	@Column(name = "RELATE_NET_SYS", length = 100)
	public String getRelateNetSys() {
		return this.relateNetSys;
	}

	public void setRelateNetSys(String relateNetSys) {
		this.relateNetSys = relateNetSys;
	}

	@Column(name = "HANDLE_RESULT", length = 200)
	public String getHandleResult() {
		return this.handleResult;
	}

	public void setHandleResult(String handleResult) {
		this.handleResult = handleResult;
	}

	@Column(name = "HANDLE_PROCESS", length = 1000)
	public String getHandleProcess() {
		return this.handleProcess;
	}

	public void setHandleProcess(String handleProcess) {
		this.handleProcess = handleProcess;
	}

	@Column(name = "REASON_ANALYZE", length = 1000)
	public String getReasonAnalyze() {
		return this.reasonAnalyze;
	}

	public void setReasonAnalyze(String reasonAnalyze) {
		this.reasonAnalyze = reasonAnalyze;
	}

	@Column(name = "REMARK", length = 500)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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