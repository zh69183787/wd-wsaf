package com.wonders.frame.iims.model.bo;

import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import com.wonders.frame.core.tags.ShowInView;
import com.wonders.frame.core.tags.ShowInView.OperateType;

/**
 * IimsWorkflowLog entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_SIMPLE_FLOW_MAIN")
@ShowInView(name="简易流程主表")
public class SimpleFlowMain implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 1393773939223261815L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="流程编码",operateType=OperateType.HIDDEN)
	private String flowCode;
	@ShowInView(name="流程名称")
	private String flowName;
	
	@ShowInView(name="发起人部门ID")
	private String startDeptId;
	@ShowInView(name="发起人部门")
	private String startDept;
	@ShowInView(name="发起人")
	private String startUser;
	@ShowInView(name="发起人工号",operateType=OperateType.HIDDEN)
	private String startUserLoginname;
	@ShowInView(name="发起时间")
	private Date initiateTime;
	@ShowInView(name="发起描述")
	private String suggestion;

	@ShowInView(name="流转状态")
	private String status;  // 0 未开启 1进行中 2 停止
	@ShowInView(name="当前状态")
	private String statusDetail;
	
	@ShowInView(name="结束后处理链接")
	private String dealUrl;
	
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public SimpleFlowMain() {
//		this.flowCode = UUID.randomUUID().toString();
		this.status ="0";
		this.removed = 0;
		//this.initiateTime = new Date();
	}
	
	private SimpleFlowLog nowLog;

	@Transient
	public SimpleFlowLog getNowLog() {
		return nowLog;
	}

	public void setNowLog(SimpleFlowLog nowLog) {
		this.nowLog = nowLog;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_simple_flow_main",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "INITIATE_TIME", nullable = false)
	public Date getInitiateTime() {
		return this.initiateTime;
	}

	public void setInitiateTime(Date initiateTime) {
		this.initiateTime = initiateTime;
	}
	
	@Column(name = "FLOW_NAME", length = 200)
	public String getFlowName() {
		return flowName;
	}


	public void setFlowName(String flowName) {
		this.flowName = flowName;
	}

	@Column(name = "STATUS_DETAIL", length = 200)
	public String getStatusDetail() {
		return statusDetail;
	}


	public void setStatusDetail(String statusDetail) {
		this.statusDetail = statusDetail;
	}


	@Column(name = "FLOW_CODE", length = 40)
	public String getFlowCode() {
		return flowCode;
	}


	public void setFlowCode(String flowCode) {
		this.flowCode = flowCode;
	}

	@Column(name = "START_USER", length = 20)
	public String getStartUser() {
		return startUser;
	}


	public void setStartUser(String startUser) {
		this.startUser = startUser;
	}

	@Column(name = "START_USER_LOGINNAME", length = 40)
	public String getStartUserLoginname() {
		return startUserLoginname;
	}


	public void setStartUserLoginname(String startUserLoginname) {
		this.startUserLoginname = startUserLoginname;
	}


	@Column(name = "SUGGESTION", length = 1500)
	public String getSuggestion() {
		return this.suggestion;
	}

	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}


	@Column(name = "STATUS", nullable = false, length = 50)
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
	@Column(name = "START_DEPT_ID", length = 50)
	public String getStartDeptId() {
		return startDeptId;
	}

	public void setStartDeptId(String startDeptId) {
		this.startDeptId = startDeptId;
	}
	@Column(name = "START_DEPT", length = 200)
	public String getStartDept() {
		return startDept;
	}

	public void setStartDept(String startDept) {
		this.startDept = startDept;
	}
	@Column(name = "DEAL_URL", length = 500)
	public String getDealUrl() {
		return dealUrl;
	}

	public void setDealUrl(String dealUrl) {
		this.dealUrl = dealUrl;
	}

}