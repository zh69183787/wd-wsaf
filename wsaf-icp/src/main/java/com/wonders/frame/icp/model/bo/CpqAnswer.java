package com.wonders.frame.icp.model.bo;

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
 * CpqAnswer entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "CPQ_ANSWER")
@ShowInView(name="测评结果")
public class CpqAnswer implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = -7546313505969784474L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="测评问卷ID")
	private Integer cpqId;
	@ShowInView(name="测评答案")
	private String answer;
	@ShowInView(name="答题人工号")
	private String userLoginname;
	@ShowInView(name="答题时间")
	private Date answerTime;
	@ShowInView(name="是否提交",operateType=OperateType.HIDDEN)
	private Integer submited;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public CpqAnswer() {
		this.removed=0;
	}

	/** full constructor */
	public CpqAnswer(Integer id, Integer cpqId, String answer,
			String userLoginname, Date answerTime, Integer submited,
			Integer removed) {
		this.id = id;
		this.cpqId = cpqId;
		this.answer = answer;
		this.userLoginname = userLoginname;
		this.answerTime = answerTime;
		this.submited = submited;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_cpq_answer",allocationSize=1)
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

	@Column(name = "ANSWER", nullable = false, length = 2000)
	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	@Column(name = "USER_LOGINNAME", nullable = false, length = 20)
	public String getUserLoginname() {
		return this.userLoginname;
	}

	public void setUserLoginname(String userLoginname) {
		this.userLoginname = userLoginname;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "ANSWER_TIME", nullable = false)
	public Date getAnswerTime() {
		return this.answerTime;
	}

	public void setAnswerTime(Date answerTime) {
		this.answerTime = answerTime;
	}

	@Column(name = "SUBMITED", nullable = false, precision = 22, scale = 0)
	public Integer getSubmited() {
		return this.submited;
	}

	public void setSubmited(Integer submited) {
		this.submited = submited;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}