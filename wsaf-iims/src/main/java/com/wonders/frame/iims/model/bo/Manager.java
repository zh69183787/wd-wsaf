package com.wonders.frame.iims.model.bo;

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
 * IimsManager entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_MANAGER")
@ShowInView(name="管理人员")
public class Manager implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 4745066718071639424L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="单位ID")
	private String companyId;		
	@ShowInView(name="业务模块")
	private String businessType;
	@ShowInView(name="组织/单位")
	private String company;
	@ShowInView(name="信息安全角色",operateType=OperateType.SELECT,ccateType="managerRole")
	private String role;
	@ShowInView(name="姓名")
	private String userName;
	@ShowInView(name="工号")
	private String loginName;
	@ShowInView(name="部门")
	private String dept;
	@ShowInView(name="职务")
	private String post;
	@ShowInView(name="办公电话")
	private String office;
	@ShowInView(name="移动电话")
	private String mobile;
	@ShowInView(name="传真")
	private String fix;
	@ShowInView(name="电子邮件")
	private String email;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public Manager() {
		this.removed=0;
	}

	/** minimal constructor */
	public Manager(Integer id, String companyId,String company, Integer removed) {
		this.id = id;
		this.companyId = companyId;			
		this.company = company;
		this.removed = removed;
	}

	/** full constructor */
	public Manager(Integer id, String businessType,String company,String companyId, String role,
			String userName, String loginName, String dept, String post, String office,
			String mobile, String fix, String email, Integer removed) {
		this.id = id;
		this.businessType = businessType;
		this.companyId = companyId;	
		this.company = company;
		this.role = role;
		this.userName = userName;
		this.loginName = loginName;
		this.dept = dept;
		this.post = post;
		this.office = office;
		this.mobile = mobile;
		this.fix = fix;
		this.email = email;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_manager",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "BUSINESS_TYPE", length = 50)
	public String getBusinessType() {
		return this.businessType;
	}

	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	
	@Column(name = "COMPANY_ID", nullable = false, length = 10)
	public String getCompanyId() {
		return this.companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	@Column(name = "COMPANY", nullable = false, length = 50)
	public String getCompany() {
		return this.company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	@Column(name = "ROLE", length = 100)
	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Column(name = "USER_NAME", length = 200)
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "LOGIN_NAME", length = 200)
	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	
	@Column(name = "DEPT", length = 100)
	public String getDept() {
		return this.dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	@Column(name = "POST", length = 100)
	public String getPost() {
		return this.post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	@Column(name = "OFFICE", length = 20)
	public String getOffice() {
		return this.office;
	}

	public void setOffice(String office) {
		this.office = office;
	}

	@Column(name = "MOBILE", length = 20)
	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Column(name = "FIX", length = 20)
	public String getFix() {
		return this.fix;
	}

	public void setFix(String fix) {
		this.fix = fix;
	}

	@Column(name = "EMAIL", length = 50)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}