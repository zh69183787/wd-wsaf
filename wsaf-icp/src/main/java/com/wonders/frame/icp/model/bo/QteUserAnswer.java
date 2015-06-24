package com.wonders.frame.icp.model.bo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.wonders.frame.core.tags.ShowInView;

/**
 * QteUserAnswer entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "QTE_USER_ANSWER")
@ShowInView(name="用户答案")
public class QteUserAnswer implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 1L;
	@ShowInView(name="ID")
	private Integer id;
	@ShowInView(name="所属问题id")
	private Integer questId;
	@ShowInView(name="单选或多选题选项id")
	private Integer optionId;
	@ShowInView(name="填空或问答题答案")
	private String answerTxt;
	@ShowInView(name="答题用户工号")
	private String loginName;
	@ShowInView(name="答题用户所属部门id")
	private String deptId;
	@ShowInView(name="逻辑删除标志位")
	private Integer removed;

	// Constructors

	/** default constructor */
	public QteUserAnswer() {
		this.removed=0;
	}

	/** minimal constructor */
	public QteUserAnswer(Integer questId, String loginName, String deptId,
			Integer removed) {
		this.questId = questId;
		this.loginName = loginName;
		this.deptId = deptId;
		this.removed = removed;
	}

	/** full constructor */
	public QteUserAnswer(Integer questId, Integer optionId,
			String answerTxt, String loginName, String deptId,
			Integer removed) {
		this.questId = questId;
		this.optionId = optionId;
		this.answerTxt = answerTxt;
		this.loginName = loginName;
		this.deptId = deptId;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="Generator")
	@SequenceGenerator(name="Generator",sequenceName="seq_qte_user_answer",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "QUEST_ID", nullable = false, precision = 22, scale = 0)
	public Integer getQuestId() {
		return this.questId;
	}

	public void setQuestId(Integer questId) {
		this.questId = questId;
	}

	@Column(name = "OPTION_ID", precision = 22, scale = 0)
	public Integer getOptionId() {
		return this.optionId;
	}

	public void setOptionId(Integer optionId) {
		this.optionId = optionId;
	}

	@Column(name = "ANSWER_TXT", length = 1000)
	public String getAnswerTxt() {
		return this.answerTxt;
	}

	public void setAnswerTxt(String answerTxt) {
		this.answerTxt = answerTxt;
	}

	@Column(name = "LOGIN_NAME", nullable = false, length = 50)
	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@Column(name = "DEPT_ID", nullable = false, length = 50)
	public String getDeptId() {
		return this.deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}