package com.wonders.frame.iims.model.bo;

import java.math.BigDecimal;
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
 * IimsSecurityLevelCompany entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_SECURITY_LEVEL_COMPANY")
public class SecurityLevelCompany implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 5445601696401912369L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="单位ID")
	private String companyId;	
	@ShowInView(name="单位名称")
	private String company;
	@ShowInView(name="单位所在省(自治区、直辖市)")
	private String companyProvince;
	@ShowInView(name="单位所在地(区、市、州、盟)")
	private String companyCity;
	@ShowInView(name="单位所在县(区、市、旗)")
	private String companyCounty;
	@ShowInView(name="邮政编码")
	private String zipCode;
	@ShowInView(name="行政区划代码")
	private String addressCode;
	@ShowInView(name="单位负责人姓名")
	private String leaderName;
	@ShowInView(name="单位负责人职务")
	private String leaderPost;
	@ShowInView(name="单位负责人办公电话")
	private String leaderPhone;
	@ShowInView(name="单位负责人电子邮件")
	private String leaderEmail;
	@ShowInView(name="单位负责人移动电话")
	private String leaderMobile;
	@ShowInView(name="隶属关系",operateType=OperateType.SELECT,ccateType="subordinateRelation")
	private String subordinateRelation;
	@ShowInView(name="隶属关系:其他")
	private String subordinateRelationOther;
	@ShowInView(name="单位类型",operateType=OperateType.SELECT,ccateType="companyType")
	private String companyType;
	@ShowInView(name="单位类型:其他")
	private String companyTypeOther;
	@ShowInView(name="行业类别",operateType=OperateType.SELECT,ccateType="businessCategory")
	private String businessCategory;
	@ShowInView(name="行业类别:其他")
	private String businessCategoryOther;
	@ShowInView(name="信息系统总数")
	private Integer totalSysNum;
	@ShowInView(name="第一级信息系统数")
	private Integer level1SysNum;	
	@ShowInView(name="第二级信息系统数")
	private Integer level2SysNum;
	@ShowInView(name="第三级信息系统个数")
	private Integer level3SysNum;
	@ShowInView(name="第四级信息系统个数")
	private Integer level4SysNum;
	@ShowInView(name="第五级信息系统个数")
	private Integer level5SysNum;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public SecurityLevelCompany() {
		this.removed=0;
	}

	/** minimal constructor */
	public SecurityLevelCompany(Integer id, String companyId,String company,
			Integer removed) {
		this.id = id;
		this.companyId = companyId;		
		this.company = company;
		this.removed = removed;
	}

	/** full constructor */
	public SecurityLevelCompany(Integer id, String companyId,String company,
			String companyProvince, String companyCity,
			String companyCounty, String zipCode, String addressCode,
			String leaderName, String leaderPost, String leaderPhone,
			String leaderEmail, String leaderMobile,
			String subordinateRelation, String subordinateRelationOther,
			String companyType, String companyTypeOther,
			String businessCategory, String businessCategoryOther,
			Integer totalSysNum, Integer level1SysNum,Integer level2SysNum,
			Integer level3SysNum, Integer level4SysNum,
			Integer level5SysNum, Integer removed) {
		this.id = id;
		this.companyId = companyId;		
		this.company = company;
		this.companyProvince = companyProvince;
		this.companyCity = companyCity;
		this.companyCounty = companyCounty;
		this.zipCode = zipCode;
		this.addressCode = addressCode;
		this.leaderName = leaderName;
		this.leaderPost = leaderPost;
		this.leaderPhone = leaderPhone;
		this.leaderEmail = leaderEmail;
		this.leaderMobile = leaderMobile;
		this.subordinateRelation = subordinateRelation;
		this.subordinateRelationOther = subordinateRelationOther;
		this.companyType = companyType;
		this.companyTypeOther = companyTypeOther;
		this.businessCategory = businessCategory;
		this.businessCategoryOther = businessCategoryOther;
		this.totalSysNum = totalSysNum;
		this.level1SysNum = level1SysNum;
		this.level2SysNum = level2SysNum;
		this.level3SysNum = level3SysNum;
		this.level4SysNum = level4SysNum;
		this.level5SysNum = level5SysNum;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_security_level_c",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
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


	@Column(name = "COMPANY_PROVINCE", length = 50)
	public String getCompanyProvince() {
		return this.companyProvince;
	}

	public void setCompanyProvince(String companyProvince) {
		this.companyProvince = companyProvince;
	}

	@Column(name = "COMPANY_CITY", length = 50)
	public String getCompanyCity() {
		return this.companyCity;
	}

	public void setCompanyCity(String companyCity) {
		this.companyCity = companyCity;
	}

	@Column(name = "COMPANY_COUNTY", length = 50)
	public String getCompanyCounty() {
		return this.companyCounty;
	}

	public void setCompanyCounty(String companyCounty) {
		this.companyCounty = companyCounty;
	}

	@Column(name = "ZIP_CODE", length = 50)
	public String getZipCode() {
		return this.zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	@Column(name = "ADDRESS_CODE", length = 50)
	public String getAddressCode() {
		return this.addressCode;
	}

	public void setAddressCode(String addressCode) {
		this.addressCode = addressCode;
	}

	@Column(name = "LEADER_NAME", length = 50)
	public String getLeaderName() {
		return this.leaderName;
	}

	public void setLeaderName(String leaderName) {
		this.leaderName = leaderName;
	}

	@Column(name = "LEADER_POST", length = 50)
	public String getLeaderPost() {
		return this.leaderPost;
	}

	public void setLeaderPost(String leaderPost) {
		this.leaderPost = leaderPost;
	}

	@Column(name = "LEADER_PHONE", length = 50)
	public String getLeaderPhone() {
		return this.leaderPhone;
	}

	public void setLeaderPhone(String leaderPhone) {
		this.leaderPhone = leaderPhone;
	}

	@Column(name = "LEADER_EMAIL", length = 50)
	public String getLeaderEmail() {
		return this.leaderEmail;
	}

	public void setLeaderEmail(String leaderEmail) {
		this.leaderEmail = leaderEmail;
	}

	@Column(name = "LEADER_MOBILE", length = 50)
	public String getLeaderMobile() {
		return this.leaderMobile;
	}

	public void setLeaderMobile(String leaderMobile) {
		this.leaderMobile = leaderMobile;
	}

	@Column(name = "SUBORDINATE_RELATION", length = 50)
	public String getSubordinateRelation() {
		return this.subordinateRelation;
	}

	public void setSubordinateRelation(String subordinateRelation) {
		this.subordinateRelation = subordinateRelation;
	}

	@Column(name = "SUBORDINATE_RELATION_OTHER", length = 100)
	public String getSubordinateRelationOther() {
		return this.subordinateRelationOther;
	}

	public void setSubordinateRelationOther(String subordinateRelationOther) {
		this.subordinateRelationOther = subordinateRelationOther;
	}

	@Column(name = "COMPANY_TYPE", length = 50)
	public String getCompanyType() {
		return this.companyType;
	}

	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}

	@Column(name = "COMPANY_TYPE_OTHER", length = 50)
	public String getCompanyTypeOther() {
		return this.companyTypeOther;
	}

	public void setCompanyTypeOther(String companyTypeOther) {
		this.companyTypeOther = companyTypeOther;
	}

	@Column(name = "BUSINESS_CATEGORY", length = 50)
	public String getBusinessCategory() {
		return this.businessCategory;
	}

	public void setBusinessCategory(String businessCategory) {
		this.businessCategory = businessCategory;
	}

	@Column(name = "BUSINESS_CATEGORY_OTHER", length = 100)
	public String getBusinessCategoryOther() {
		return this.businessCategoryOther;
	}

	public void setBusinessCategoryOther(String businessCategoryOther) {
		this.businessCategoryOther = businessCategoryOther;
	}

	@Column(name = "TOTAL_SYS_NUM", precision = 22, scale = 0)
	public Integer getTotalSysNum() {
		return this.totalSysNum;
	}

	public void setTotalSysNum(Integer totalSysNum) {
		this.totalSysNum = totalSysNum;
	}
	
	@Column(name = "LEVEL1_SYS_NUM", precision = 22, scale = 0)
	public Integer getLevel1SysNum() {
		return this.level1SysNum;
	}

	public void setLevel1SysNum(Integer level1SysNum) {
		this.level1SysNum = level1SysNum;
	}

	@Column(name = "LEVEL2_SYS_NUM", precision = 22, scale = 0)
	public Integer getLevel2SysNum() {
		return this.level2SysNum;
	}

	public void setLevel2SysNum(Integer level2SysNum) {
		this.level2SysNum = level2SysNum;
	}

	@Column(name = "LEVEL3_SYS_NUM", precision = 22, scale = 0)
	public Integer getLevel3SysNum() {
		return this.level3SysNum;
	}

	public void setLevel3SysNum(Integer level3SysNum) {
		this.level3SysNum = level3SysNum;
	}

	@Column(name = "LEVEL4_SYS_NUM", precision = 22, scale = 0)
	public Integer getLevel4SysNum() {
		return this.level4SysNum;
	}

	public void setLevel4SysNum(Integer level4SysNum) {
		this.level4SysNum = level4SysNum;
	}

	@Column(name = "LEVEL5_SYS_NUM", precision = 22, scale = 0)
	public Integer getLevel5SysNum() {
		return this.level5SysNum;
	}

	public void setLevel5SysNum(Integer level5SysNum) {
		this.level5SysNum = level5SysNum;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}