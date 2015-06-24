package com.wonders.frame.cpq.model.bo;

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
 * ActSuggestions entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "ACT_SUGGESTION")
@ShowInView(name="征集意见")
public class ActSuggestion implements java.io.Serializable {

	// Fields
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 1L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="征集主题id",operateType=OperateType.HIDDEN)
	private Integer ctId;
	@ShowInView(name="建议人",operateType=OperateType.HIDDEN)
	private String suggester;
	@ShowInView(name="建议人id",operateType=OperateType.HIDDEN)
	private String loginName;
	@ShowInView(name="建议人所属部门",operateType=OperateType.HIDDEN)
	private String deptName;
	@ShowInView(name="建议人所属部门id",operateType=OperateType.HIDDEN)
	private Integer deptId;
	@ShowInView(name="提出时间",operateType=OperateType.HIDDEN)
	private Date createTime;
	@ShowInView(name="意见内容")
	private String content;
	@ShowInView(name="反馈标题")
	private String fbTitle;
	@ShowInView(name="反馈内容")
	private String fbContent;
	@ShowInView(name="反馈人")
	private String fbName;
	@ShowInView(name="反馈人工号")
	private String fbLoginName;
	@ShowInView(name="反馈人所属部门")
	private String fbDeptName;
	@ShowInView(name="反馈人所属部门id")
	private BigDecimal fbDeptId;
	@ShowInView(name="反馈时间")
	private Date fbCreateTime;
	
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public ActSuggestion() {
		this.removed=0;
	}


	/** full constructor */
	public ActSuggestion(Integer id, Integer ctId, String suggester,
			String loginName, String deptName, Integer deptId, Date createTime,
			String content, String fbTitle, String fbContent, String fbName,
			String fbLoginName, String fbDeptName, BigDecimal fbDeptId,
			Date fbCreateTime, Integer removed) {
		super();
		this.id = id;
		this.ctId = ctId;
		this.suggester = suggester;
		this.loginName = loginName;
		this.deptName = deptName;
		this.deptId = deptId;
		this.createTime = createTime;
		this.content = content;
		this.fbTitle = fbTitle;
		this.fbContent = fbContent;
		this.fbName = fbName;
		this.fbLoginName = fbLoginName;
		this.fbDeptName = fbDeptName;
		this.fbDeptId = fbDeptId;
		this.fbCreateTime = fbCreateTime;
		this.removed = removed;
	}
	
	

	// Property accessors
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="Generator")
	@SequenceGenerator(name="Generator",sequenceName="seq_act_theme",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "CT_ID", nullable = false, precision = 22, scale = 0)
	public Integer getCtId() {
		return this.ctId;
	}

	public void setCtId(Integer ctId) {
		this.ctId = ctId;
	}

	@Column(name = "SUGGESTER", nullable = false, length = 50)
	public String getSuggester() {
		return this.suggester;
	}

	public void setSuggester(String suggester) {
		this.suggester = suggester;
	}

	@Column(name = "LOGIN_NAME", nullable = false, length = 50)
	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@Column(name = "DEPT_NAME", nullable = false, length = 50)
	public String getDeptName() {
		return this.deptName;
	}
	
	@Column(name = "DEPT_ID", nullable = false, precision = 22, scale = 0)
	public Integer getDeptId() {
		return deptId;
	}
	
	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "CREATE_TIME", nullable = false, length = 7)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "CONTENT", nullable = false, length = 2000)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name="FB_TITLE",length=200)
	public String getFbTitle() {
		return fbTitle;
	}


	public void setFbTitle(String fbTitle) {
		this.fbTitle = fbTitle;
	}

	@Column(name="FB_CONTENT",length=4000)
	public String getFbContent() {
		return fbContent;
	}


	public void setFbContent(String fbContent) {
		this.fbContent = fbContent;
	}

    @Column(name="FB_NAME",length=50)
	public String getFbName() {
		return fbName;
	}


	public void setFbName(String fbName) {
		this.fbName = fbName;
	}

	@Column(name="FB_LOGIN_NAME",length=50)
	public String getFbLoginName() {
		return fbLoginName;
	}


	public void setFbLoginName(String fbLoginName) {
		this.fbLoginName = fbLoginName;
	}

	@Column(name="FB_DEPT_NAME",length=50)
	public String getFbDeptName() {
		return fbDeptName;
	}


	public void setFbDeptName(String fbDeptName) {
		this.fbDeptName = fbDeptName;
	}

	@Column(name="FB_DEPT_ID")
	public BigDecimal getFbDeptId() {
		return fbDeptId;
	}


	public void setFbDeptId(BigDecimal fbDeptId) {
		this.fbDeptId = fbDeptId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="FB_CREATE_TIME")
	public Date getFbCreateTime() {
		return fbCreateTime;
	}


	public void setFbCreateTime(Date fbCreateTime) {
		this.fbCreateTime = fbCreateTime;
	}


	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}