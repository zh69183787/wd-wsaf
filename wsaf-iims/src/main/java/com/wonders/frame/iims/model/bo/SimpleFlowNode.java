package com.wonders.frame.iims.model.bo;

import java.math.BigDecimal;
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
 * IimsWorkflowLog entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_SIMPLE_FLOW_NODE")
@ShowInView(name="流程流转日志")
public class SimpleFlowNode implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 1393773939223261815L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="流程类型编码",operateType=OperateType.HIDDEN)
	private String flowTypeCode;
	@ShowInView(name="节点名称")
	private String nodeName;//部门 - 领导or  other
	
	@ShowInView(name="节点选择分类")
	private String nodeCode;// deptLeader 部门领导   deptUser  部门内其他人员  deptOther 其他部门所有人员 deptOtherLeader 其他部门领导
	
	
	@ShowInView(name="默认处理人部门ID")
	private String dealDeptId;
	@ShowInView(name="默认处理人部门名称")
	private String dealDept;
	@ShowInView(name="默认处理人")
	private String dealUser;
	@ShowInView(name="默认处理人工号")
	private String dealUserLoginname;
	
	@ShowInView(name="处理顺序")
	private Long orderIndex;
	@ShowInView(name="下一步处理节点")
	private Long orderIndexNext;
	
	
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public SimpleFlowNode() {
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_simple_flow_node",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	@Column(name = "FLOW_TYPE_CODE", length = 40)
	public String getFlowTypeCode() {
		return flowTypeCode;
	}


	public void setFlowTypeCode(String flowTypeCode) {
		this.flowTypeCode = flowTypeCode;
	}

	@Column(name = "NODE_NAME", length = 100)
	public String getNodeName() {
		return nodeName;
	}


	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}


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



	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

	@Column(name = "NODE_CODE", length = 100)
	public String getNodeCode() {
		return nodeCode;
	}

	public void setNodeCode(String nodeCode) {
		this.nodeCode = nodeCode;
	}
	@Column(name = "DEAL_DEPT", length = 100)
	public String getDealDept() {
		return dealDept;
	}

	public void setDealDept(String dealDept) {
		this.dealDept = dealDept;
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
	@Column(name = "DEAL_DEPT_ID", length = 40)
	public String getDealDeptId() {
		return dealDeptId;
	}

	public void setDealDeptId(String dealDeptId) {
		this.dealDeptId = dealDeptId;
	}
	

}