package com.wonders.frame.cpq.model.bo;

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
 * CpqWorkflow entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "CPQ_WORKFLOW")
@ShowInView(name="测评流转情况")
public class CpqWorkflow implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 1735445836678939214L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="测评问卷ID")
	private Integer cpqId;
	@ShowInView(name="参与测评部门")
	private String testDept;
	@ShowInView(name="发起人")
	private String initiator;
	@ShowInView(name="发起人工号")
	private String initiatorLoginname;
	@ShowInView(name="发起时间")
	private Date initiateTime;
	@ShowInView(name="处理人")
	private String handler;
	@ShowInView(name="处理人工号")
	private String handlerLoginname;
	@ShowInView(name="处理时间")
	private Date handleTime;
	@ShowInView(name="流转状态",operateType=OperateType.SELECT,ccateType="cpqWorkflowStatus")
	private String status;
	@ShowInView(name="待办事项ID")
	private String todoItemId;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public CpqWorkflow() {
		this.removed=0;
	}

	/** minimal constructor */
	public CpqWorkflow(Integer id, Integer cpqId, String testDept,
			String initiator, String initiatorLoginname, Date initiateTime,
			String handler, String handlerLoginname, String status,
			Integer removed) {
		this.id = id;
		this.cpqId = cpqId;
		this.testDept = testDept;
		this.initiator = initiator;
		this.initiatorLoginname = initiatorLoginname;
		this.initiateTime = initiateTime;
		this.handler = handler;
		this.handlerLoginname = handlerLoginname;
		this.status = status;
		this.removed = removed;
	}

	/** full constructor */
	public CpqWorkflow(Integer id, Integer cpqId, String testDept,
			String initiator, String initiatorLoginname, Date initiateTime,
			String handler, String handlerLoginname, Date handleTime,
			String status, String todoItemId, Integer removed) {
		this.id = id;
		this.cpqId = cpqId;
		this.testDept = testDept;
		this.initiator = initiator;
		this.initiatorLoginname = initiatorLoginname;
		this.initiateTime = initiateTime;
		this.handler = handler;
		this.handlerLoginname = handlerLoginname;
		this.handleTime = handleTime;
		this.status = status;
		this.todoItemId = todoItemId;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_cpq_workflow",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "CPQ_ID", nullable = false, precision = 22, scale = 0)
	public Integer getCpqId() {
		return this.cpqId;
	}

	public void setCpqId(Integer cpqId) {
		this.cpqId = cpqId;
	}

	@Column(name = "TEST_DEPT", nullable = false, length = 50)
	public String getTestDept() {
		return this.testDept;
	}

	public void setTestDept(String testDept) {
		this.testDept = testDept;
	}

	@Column(name = "INITIATOR", nullable = false, length = 20)
	public String getInitiator() {
		return this.initiator;
	}

	public void setInitiator(String initiator) {
		this.initiator = initiator;
	}

	@Column(name = "INITIATOR_LOGINNAME", nullable = false, length = 20)
	public String getInitiatorLoginname() {
		return this.initiatorLoginname;
	}

	public void setInitiatorLoginname(String initiatorLoginname) {
		this.initiatorLoginname = initiatorLoginname;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "INITIATE_TIME", nullable = false)
	public Date getInitiateTime() {
		return this.initiateTime;
	}

	public void setInitiateTime(Date initiateTime) {
		this.initiateTime = initiateTime;
	}

	@Column(name = "HANDLER", nullable = false, length = 20)
	public String getHandler() {
		return this.handler;
	}

	public void setHandler(String handler) {
		this.handler = handler;
	}

	@Column(name = "HANDLER_LOGINNAME", nullable = false, length = 20)
	public String getHandlerLoginname() {
		return this.handlerLoginname;
	}

	public void setHandlerLoginname(String handlerLoginname) {
		this.handlerLoginname = handlerLoginname;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "HANDLE_TIME")
	public Date getHandleTime() {
		return this.handleTime;
	}

	public void setHandleTime(Date handleTime) {
		this.handleTime = handleTime;
	}

	@Column(name = "STATUS", nullable = false, length = 50)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
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

}