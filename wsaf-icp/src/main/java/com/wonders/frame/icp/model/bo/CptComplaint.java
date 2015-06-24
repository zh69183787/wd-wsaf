package com.wonders.frame.icp.model.bo;

import java.io.Serializable;
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

@Entity
@Table(name="CPT_COMPLAINT")
@ShowInView(name="监督投诉问题")
public class CptComplaint implements Serializable{
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 1L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="标题")
	private String cptTitle;
	@ShowInView(name="情况分类",operateType=OperateType.SELECT,ccateType="situationType")
	private String situation;
	@ShowInView(name="详细内容")
	private String content;
	@ShowInView(name="联系人")
	private String linkMan;
	@ShowInView(name="用户id",operateType=OperateType.HIDDEN)
	private String loginName;
	@ShowInView(name="所属部门")
	private String deptName;
	@ShowInView(name="所属部门id",operateType=OperateType.HIDDEN)
	private Integer deptId;
	@ShowInView(name="联系电话")
	private String telephone;
	@ShowInView(name="电子邮箱")
	private String email;
	@ShowInView(name="创建时间",operateType=OperateType.HIDDEN)
	private Date createTime;
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
	private Integer fbDeptId;
	@ShowInView(name="反馈时间")
	private Date fbCreateTime;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;
	
	
	// Constructors
	
	/** default constructor */
	public CptComplaint() {
		this.removed=0;
	}

   /**minimal constructor*/
	public CptComplaint(String cptTitle, String situation, String content,
			String linkMan, String loginName, String deptName, Integer deptId,
			String telephone, Date createTime) {
		super();
		this.cptTitle = cptTitle;
		this.situation = situation;
		this.content = content;
		this.linkMan = linkMan;
		this.loginName = loginName;
		this.deptName = deptName;
		this.deptId = deptId;
		this.telephone = telephone;
		this.createTime = createTime;
		this.removed = 0;
	}
	
	/**full constructor*/

	public CptComplaint(Integer id, String cptTitle, String situation,
		String content, String linkMan, String loginName, String deptName,
		Integer deptId, String telephone, String email, Date createTime,
		String fbTitle, String fbContent, String fbName, String fbLoginName,
		String fbDeptName, Integer fbDeptId, Date fbCreateTime,
		Integer removed) {
		this.id = id;
		this.cptTitle = cptTitle;
		this.situation = situation;
		this.content = content;
		this.linkMan = linkMan;
		this.loginName = loginName;
		this.deptName = deptName;
		this.deptId = deptId;
		this.telephone = telephone;
		this.email = email;
		this.createTime = createTime;
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
	@SequenceGenerator(name="Generator",sequenceName="seq_cpt_complaint",allocationSize=1)
	@Column(name="ID",unique=true,nullable=false,precision=22,scale=0)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name="CPT_TITLE",length=200,nullable=false)
	public String getCptTitle() {
		return cptTitle;
	}

	public void setCptTitle(String cptTitle) {
		this.cptTitle = cptTitle;
	}

	@Column(name="SITUATION",length=50,nullable=false)
	public String getSituation() {
		return situation;
	}

	public void setSituation(String situation) {
		this.situation = situation;
	}

	@Column(name="CONTENT",length=2000,nullable=false)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name="LINKMAN",length=50,nullable=false)
	public String getLinkMan() {
		return linkMan;
	}

	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
	}

	@Column(name="LOGIN_NAME",length=50,nullable=false)
	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@Column(name="DEPT_NAME",length=50,nullable=false)
	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	@Column(name="DEPT_ID",nullable=false)
	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	@Column(name="TELEPHONE",length=20,nullable=false)
	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	@Column(name="EMAIL",length=30)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name="CREATE_TIME",nullable=false)
	@Temporal(TemporalType.TIMESTAMP)
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
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
	public Integer getFbDeptId() {
		return fbDeptId;
	}


	public void setFbDeptId(Integer fbDeptId) {
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


	@Column(name="REMOVED",nullable=false)
	public Integer getRemoved() {
		return removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}
}
