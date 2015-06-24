package com.wonders.frame.icp.model.bo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.wonders.frame.core.tags.ShowInView;
import com.wonders.frame.core.tags.ShowInView.OperateType;

/**
 * QteQuestion entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "QTE_QUESTION")
@ShowInView(name="问题")
public class QteQuestion implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 1L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="所属问卷id",operateType=OperateType.HIDDEN)
	private Integer mainId;
	@ShowInView(name="所属分组id",operateType=OperateType.HIDDEN)
	private Integer groupId;
	@ShowInView(name="问题类型",operateType=OperateType.SELECT,ccateType="questionType")
	private String quesType;
	@ShowInView(name="题号")
	private Integer quesOrders;
	@ShowInView(name="是否显示题号",operateType=OperateType.SELECT,ccateType="isDisplay")
	private String isDisplay;
	@ShowInView(name="题干内容")    
	private String quesContent;
	@ShowInView(name="备注")
	private String remark;
	@ShowInView(name="标注答案")
	private String rightAnswer;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public QteQuestion() {
		this.removed=0;
	}

	/** minimal constructor */
	public QteQuestion(Integer mainId, Integer groupId, String quesType,
			Integer quesOrders, String isDisplay, String quesContent,
			Integer removed) {
		this.mainId = mainId;
		this.groupId = groupId;
		this.quesType = quesType;
		this.quesOrders = quesOrders;
		this.isDisplay = isDisplay;
		this.quesContent = quesContent;
		this.removed = removed;
	}

	/** full constructor */
	public QteQuestion(Integer mainId, Integer groupId, String quesType,
			Integer quesOrders, String isDisplay, String quesContent,
			String remark, String rightAnswer, Integer removed) {
		this.mainId = mainId;
		this.groupId = groupId;
		this.quesType = quesType;
		this.quesOrders = quesOrders;
		this.isDisplay = isDisplay;
		this.quesContent = quesContent;
		this.remark = remark;
		this.rightAnswer = rightAnswer;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="Generator")
	@SequenceGenerator(name="Generator",sequenceName="seq_qte_question",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "MAIN_ID", nullable = false, precision = 22, scale = 0)
	public Integer getMainId() {
		return this.mainId;
	}

	public void setMainId(Integer mainId) {
		this.mainId = mainId;
	}

	@Column(name = "GROUP_ID", nullable = false, precision = 22, scale = 0)
	public Integer getGroupId() {
		return this.groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	@Column(name = "QUES_TYPE", nullable = false, length = 20)
	public String getQuesType() {
		return this.quesType;
	}

	public void setQuesType(String quesType) {
		this.quesType = quesType;
	}

	@Column(name = "QUES_ORDERS", nullable = false, precision = 22, scale = 0)
	public Integer getQuesOrders() {
		return this.quesOrders;
	}

	public void setQuesOrders(Integer quesOrders) {
		this.quesOrders = quesOrders;
	}

	@Column(name = "IS_DISPLAY", nullable = false, length = 10)
	public String getIsDisplay() {
		return this.isDisplay;
	}

	public void setIsDisplay(String isDisplay) {
		this.isDisplay = isDisplay;
	}

	@Column(name = "QUES_CONTENT", nullable = false, length = 4000)
	public String getQuesContent() {
		return this.quesContent;
	}

	public void setQuesContent(String quesContent) {
		this.quesContent = quesContent;
	}

	@Column(name = "REMARK", length = 4000)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name = "RIGHT_ANSWER", length = 500)
	public String getRightAnswer() {
		return this.rightAnswer;
	}

	public void setRightAnswer(String rightAnswer) {
		this.rightAnswer = rightAnswer;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}