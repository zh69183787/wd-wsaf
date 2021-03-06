package com.wonders.frame.ias.model.bo;

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
 * IasWorkflow entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IAS_WORKFLOW")
@ShowInView(name="流转情况")
public class IasWorkflow implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = -5452240454509685747L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="考勤名称")
	private String iasName;
	@ShowInView(name="考勤部门")
	private String iasDept;
	@ShowInView(name="考勤月份")
	private String iasMonth;
	@ShowInView(name="提交人")
	private String initiator;
	@ShowInView(name="提交工号")
	private String initiatorLoginname;
	@ShowInView(name="提交时间")
	private Date initiateTime;
	@ShowInView(name="处理人")
	private String handler;
	@ShowInView(name="处理工号")
	private String handlerLoginname;
	@ShowInView(name="处理时间")
	private Date handleTime;
	@ShowInView(name="流转状态",operateType=OperateType.SELECT,ccateType="iasStatus")
	private String status;
	@ShowInView(name="待办项ID")
	private String todoItemId;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)		
	private Integer removed;

	// Constructors

	/** default constructor */
	public IasWorkflow() {
		this.removed=0;
	}

	/** minimal constructor */
	public IasWorkflow(Integer id, String iasName, String iasDept,
			String iasMonth, String initiator, String initiatorLoginname,
			Date initiateTime, String handler, String handlerLoginname,
			String status, Integer removed) {
		this.id = id;
		this.iasName = iasName;
		this.iasDept = iasDept;
		this.iasMonth = iasMonth;
		this.initiator = initiator;
		this.initiatorLoginname = initiatorLoginname;
		this.initiateTime = initiateTime;
		this.handler = handler;
		this.handlerLoginname = handlerLoginname;
		this.status = status;
		this.removed = removed;
	}

	/** full constructor */
	public IasWorkflow(Integer id, String iasName, String iasDept,
			String iasMonth, String initiator, String initiatorLoginname,
			Date initiateTime, String handler, String handlerLoginname,
			Date handleTime, String status, String todoItemId,
			Integer removed) {
		this.id = id;
		this.iasName = iasName;
		this.iasDept = iasDept;
		this.iasMonth = iasMonth;
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
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_ias_workflow",allocationSize=1)	
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "IAS_NAME", nullable = false, length = 100)
	public String getIasName() {
		return this.iasName;
	}

	public void setIasName(String iasName) {
		this.iasName = iasName;
	}

	@Column(name = "IAS_DEPT", nullable = false, length = 100)
	public String getIasDept() {
		return this.iasDept;
	}

	public void setIasDept(String iasDept) {
		this.iasDept = iasDept;
	}

	@Column(name = "IAS_MONTH", nullable = false, length = 7)
	public String getIasMonth() {
		return this.iasMonth;
	}

	public void setIasMonth(String iasMonth) {
		this.iasMonth = iasMonth;
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