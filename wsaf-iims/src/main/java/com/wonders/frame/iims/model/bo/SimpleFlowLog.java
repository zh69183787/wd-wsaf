package com.wonders.frame.iims.model.bo;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
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
@Table(name = "IIMS_SIMPLE_FLOW_LOG")
@ShowInView(name="流程流转日志")
public class SimpleFlowLog implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 1393773939223261815L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="流程编码",operateType=OperateType.HIDDEN)
	private String flowCode;
	@ShowInView(name="节点名称")
	private String nodeName;//部门 - 领导or  other
	
	@ShowInView(name="节点ID")
	private Integer nodeId;//部门 - 领导or  other
	@ShowInView(name="主表ID")
	private Integer mainId;//部门 - 领导or  other

	@ShowInView(name="处理人部门ID")
	private String dealDeptId;
	@ShowInView(name="处理人部门名称")
	private String dealDept;
	@ShowInView(name="处理人")
	private String dealUser;
	@ShowInView(name="处理人工号")
	private String dealUserLoginname;
	
	@ShowInView(name="处理顺序")
	private Long orderIndex;
	@ShowInView(name="下一步处理节点")
	private Long orderIndexNext;

	@ShowInView(name="处理时间")
	private Date dealTime;
	@ShowInView(name="建议&意见")
	private String suggestion;
	
	@Column(name = "ORDER_INDEX", length = 100)
	public Long getOrderIndex() {
		return orderIndex;
	}


	public void setOrderIndex(Long orderIndex) {
		this.orderIndex = orderIndex;
	}

	@Column(name = "ORDER_INDEX_NEXT", length = 100)
	public Long getOrderIndexNext() {
		return orderIndexNext;
	}


	public void setOrderIndexNext(Long orderIndexNext) {
		this.orderIndexNext = orderIndexNext;
	}
	
	@ShowInView(name="待办项ID")
	private String todoItemId;
	
	@ShowInView(name="当前状态")
	private String status; // 0未处理  1处理中  2处理完成 
	
	
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;
	
	
	private SimpleFlowMain main;
	
	private SimpleFlowNode node;
	
	private SimpleFlowLog nextLog;
	
	// Constructors

	/** default constructor */
	public SimpleFlowLog() {
	}

	public SimpleFlowLog(String flowCode,Long orderIndex,Long orderIndexNext,int status) {
		this.flowCode = flowCode;
		this.removed = 0;
	}
	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_simple_flow_log",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	@Column(name = "FLOW_CODE", length = 40)
	public String getFlowCode() {
		return flowCode;
	}


	public void setFlowCode(String flowCode) {
		this.flowCode = flowCode;
	}

	@Column(name = "NODE_NAME", length = 100)
	public String getNodeName() {
		return nodeName;
	}


	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}

	@Column(name = "DEAL_USER", length = 40)
	public String getDealUser() {
		return dealUser;
	}


	public void setDealUser(String dealUser) {
		this.dealUser = dealUser;
	}

	@Column(name = "DEAL_USER_LOGINNAME", length = 40)
	public String getDealUserLoginname() {
		return dealUserLoginname;
	}


	public void setDealUserLoginname(String dealUserLoginname) {
		this.dealUserLoginname = dealUserLoginname;
	}


	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DEAL_TIME")
	public Date getDealTime() {
		return dealTime;
	}

	@Column(name = "DEAL_DEPT", length = 100)
	public String getDealDept() {
		return dealDept;
	}

	public void setDealDept(String dealDept) {
		this.dealDept = dealDept;
	}

	public void setDealTime(Date dealTime) {
		this.dealTime = dealTime;
	}

	@Column(name = "SUGGESTION", length = 1500)
	public String getSuggestion() {
		return this.suggestion;
	}

	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}


	@Column(name = "TODO_ITEM_ID", length = 50)
	public String getTodoItemId() {
		return this.todoItemId;
	}

	public void setTodoItemId(String todoItemId) {
		this.todoItemId = todoItemId;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}
	
	@Column(name = "STATUS", nullable = false, length = 50)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	@Column(name = "NODE_ID", length = 100)
	public Integer getNodeId() {
		return nodeId;
	}

	public void setNodeId(Integer nodeId) {
		this.nodeId = nodeId;
	}

	@OneToOne
	@JoinColumn(name = "MAIN_ID",insertable=false, updatable=false) 
	public SimpleFlowMain getMain() {
		return main;
	}

	public void setMain(SimpleFlowMain main) {
		this.main = main;
	}
	@OneToOne
	@JoinColumn(name = "NODE_ID",insertable=false, updatable=false) 
	public SimpleFlowNode getNode() {
		return node;
	}

	public void setNode(SimpleFlowNode node) {
		this.node = node;
	}
	@Column(name = "MAIN_ID", length = 50)
	public Integer getMainId() {
		return mainId;
	}

	public void setMainId(Integer mainId) {
		this.mainId = mainId;
	}
	
	@Transient
	public SimpleFlowLog getNextLog() {
		return nextLog;
	}

	public void setNextLog(SimpleFlowLog nextLog) {
		this.nextLog = nextLog;
	}
	
	@Column(name = "DEAL_DEPT_ID", length = 40)
	public String getDealDeptId() {
		return dealDeptId;
	}


	public void setDealDeptId(String dealDeptId) {
		this.dealDeptId = dealDeptId;
	}
	
}