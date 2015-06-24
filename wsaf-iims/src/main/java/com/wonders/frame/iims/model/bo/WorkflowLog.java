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
@Table(name = "IIMS_WORKFLOW_LOG")
@ShowInView(name="流程流转日志")
public class WorkflowLog implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 1393773939223261815L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="业务对象")
	private String PType;
	@ShowInView(name="业务对象ID")
	private Integer PId;
	@ShowInView(name="提交人")
	private String initiator;
	@ShowInView(name="提交人工号")
	private String initiatorLoginname;
	@ShowInView(name="提交时间")
	private Date initiateTime;
	@ShowInView(name="建议&意见")
	private String suggestion;
	@ShowInView(name="处理人")
	private String handler;
	@ShowInView(name="处理人工号")
	private String handlerLoginname;
	@ShowInView(name="处理时间")
	private Date handleTime;
	@ShowInView(name="流转状态")
	private String status;
	@ShowInView(name="待办项ID")
	private String todoItemId;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public WorkflowLog() {
	}

	/** minimal constructor */
	public WorkflowLog(String PType, Integer PId,
			String initiator,String initiatorLoginname, Date initiateTime, String status,
			Integer removed) {
		this.PType = PType;
		this.PId = PId;
		this.initiator = initiator;
		this.initiatorLoginname = initiatorLoginname;
		this.initiateTime = initiateTime;
		this.status = status;
		this.removed = removed;
	}

	/** full constructor */
	public WorkflowLog(String PType, Integer PId,
			String initiator,String initiatorLoginname, Date initiateTime, String suggestion,
			String handler,String handlerLoginname, Date handleTime, String status, String todoItemId,
			Integer removed) {
		this.PType = PType;
		this.PId = PId;
		this.initiator = initiator;
		this.initiatorLoginname = initiatorLoginname;
		this.initiateTime = initiateTime;
		this.suggestion = suggestion;
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
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_workflow_log",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "P_TYPE", nullable = false, length = 50)
	public String getPType() {
		return this.PType;
	}

	public void setPType(String PType) {
		this.PType = PType;
	}

	@Column(name = "P_ID", nullable = false, precision = 22, scale = 0)
	public Integer getPId() {
		return this.PId;
	}

	public void setPId(Integer PId) {
		this.PId = PId;
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
	@Column(name = "INITIATE_TIME", nullable = false)
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