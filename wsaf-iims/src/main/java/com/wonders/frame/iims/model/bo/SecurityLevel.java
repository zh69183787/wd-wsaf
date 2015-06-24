package com.wonders.frame.iims.model.bo;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import com.wonders.frame.core.model.vo.GenericEnum;
import com.wonders.frame.core.tags.ShowInView;
import com.wonders.frame.core.tags.ShowInView.OperateType;

/**
 * IimsSecurityLevel entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_SECURITY_LEVEL")
@ShowInView(name="安全定级")
public class SecurityLevel implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = -2418744259328853612L;
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
	
	@ShowInView(name="责任部门")
	private String dutyDept;
	@ShowInView(name="责任部门联系人姓名")
	private String dutyDeptLinkmanName;
	@ShowInView(name="责任部门联系人职务")
	private String dutyDeptLinkmanPost;
	@ShowInView(name="责任部门联系人办公电话")
	private String dutyDeptLinkmanPhone;
	@ShowInView(name="责任部门联系人电子邮件")
	private String dutyDeptLinkmanEmail;
	@ShowInView(name="系统类型",operateType=OperateType.SELECT,ccateType="systemType")
	private String systemType;
	@ShowInView(name="系统类型:其他")
	private String systemTypeOther;
	@ShowInView(name="所在网络区域",operateType=OperateType.SELECT,ccateType="sysNetArea")
	private String sysNetArea;
	@ShowInView(name="所在网络区域:其他")	
	private String sysNetAreaOther;
	
	@ShowInView(name="系统名称")
	private String systemName;
	@ShowInView(name="系统编号")
	private String systemNum;
	@ShowInView(name="系统承载业务类型",operateType=OperateType.SELECT,ccateType="sysBusinessType")
	private String sysBusinessType;
	@ShowInView(name="系统承载业务类型：其他")
	private String sysBusinessTypeOther;
	@ShowInView(name="系统承载业务描述")
	private String sysBusinessDescription;	
	@ShowInView(name="系统服务范围",operateType=OperateType.SELECT,ccateType="sysServeScope")
	private String sysServeScope;
	@ShowInView(name="系统服务范围:其他")
	private String sysServeScopeOther;
	@ShowInView(name="系统服务范围:跨省数量")
	private Integer sysServeScopeCrossP;
	@ShowInView(name="系统服务范围:跨地数量")
	private Integer sysServeScopeCrossC;
	@ShowInView(name="系统服务对象",operateType=OperateType.SELECT,ccateType="sysServeObj")
	private String sysServeObj;
	@ShowInView(name="系统服务对象:其他")
	private String sysServeObjOther;
	@ShowInView(name="系统网络覆盖范围",operateType=OperateType.SELECT,ccateType="sysNetCover")
	private String sysNetCover;
	@ShowInView(name="系统网络覆盖范围:其他")
	private String sysNetCoverOther;
	@ShowInView(name="系统网络性质",operateType=OperateType.SELECT,ccateType="sysNetProperty")
	private String sysNetProperty;
	@ShowInView(name="系统网络性质:其他")
	private String sysNetPropertyOther;
	@ShowInView(name="系统互联情况",operateType=OperateType.SELECT,ccateType="sysConnect")
	private String sysConnect;
	@ShowInView(name="系统互联情况:其他")
	private String sysConnectOther;
	@ShowInView(name="关键产品使用情况")
	private String keyProducts;
	@ShowInView(name="系统采用服务情况")
	private String sysServices;
	@ShowInView(name="等级测评单位名称")
	private String reviewCompany;
	@ShowInView(name="何时投入运行使用")
	private Date startUserDate;
	@ShowInView(name="系统运维是否委外",operateType=OperateType.SELECT,ccateType="yesOrNo")
	private String isOperationOutsource;
	@ShowInView(name="委外单位名称")
	private String outsourceCompany;
	@ShowInView(name="系统是否分系统",operateType=OperateType.SELECT,ccateType="yesOrNo")
	private String isSubsystem;
	@ShowInView(name="上级系统名称")
	private String mainSystem;
	@ShowInView(name="上级系统所属单位名称")
	private String mainSystemCompany;
	@ShowInView(name="业务信息安全保护等级",operateType=OperateType.SELECT,ccateType="sysSecurityLevel")
	private String businessSecurityLevel;
	@ShowInView(name="业务信息安全保护等级-损害程度",operateType=OperateType.SELECT,ccateType="sysDamage")
	private String businessSecurityDamage;
	@ShowInView(name="系统服务安全保护等级",operateType=OperateType.SELECT,ccateType="sysSecurityLevel")
	private String serviceSecurityLevel;
	@ShowInView(name="系统服务安全保护等级-损害程度",operateType=OperateType.SELECT,ccateType="sysDamage")
	private String sysSecurityDamage;
	@ShowInView(name="信息系统安全保护等级",operateType=OperateType.SELECT,ccateType="sysSecurityLevel")
	private String sysSecurityLevel;
	@ShowInView(name="定级时间")
	private Date levelConfirmDate;
	@ShowInView(name="专家评审情况",operateType=OperateType.SELECT,ccateType="reviewOrNot")
	private String expertReview;
	@ShowInView(name="是否有主管部门",operateType=OperateType.SELECT,ccateType="hasOrNot")
	private String hasDeptIncharge;
	@ShowInView(name="主管部门名称")
	private String deptIncharge;
	@ShowInView(name="主管部门审批定级情况",operateType=OperateType.SELECT,ccateType="approveOrNot")
	private String deptInchargeReview;
	@ShowInView(name="系统定级报告",operateType=OperateType.SELECT,ccateType="hasOrNot")
	private String hasSysLevelFile;
	
	@ShowInView(name="系统拓扑结构及说明",operateType=OperateType.SELECT,ccateType="hasOrNot")
	private String hasSysTipologyFile;
	@ShowInView(name="系统安全组织结构及管理机制",operateType=OperateType.SELECT,ccateType="hasOrNot")
	private String hasSysSecurityOrganFile;
	@ShowInView(name="系统安全保护设施设计实施方案或改建实施方案",operateType=OperateType.SELECT,ccateType="hasOrNot")
	private String hasSysProtectFile;
	@ShowInView(name="系统使用的安全产品清单及认证、销售许可证明",operateType=OperateType.SELECT,ccateType="hasOrNot")
	private String hasSysProductsFile;
	@ShowInView(name="系统等级测评报告",operateType=OperateType.SELECT,ccateType="hasOrNot")
	private String hasSysLevelReviewFile;
	@ShowInView(name="系统等级测评时间")
	private Date sysLevelReviewDate;
	@ShowInView(name="专家评审情况",operateType=OperateType.SELECT,ccateType="hasOrNot")
	private String hasExpertReviewFile;
	@ShowInView(name="上级主管部门审批意见",operateType=OperateType.SELECT,ccateType="hasOrNot")
	private String hasDeptInchargeReviewFile;		
	@ShowInView(name="通知部门领导",operateType=OperateType.SELECT,ccateType="yesOrNo")
	private String notifyDeptLeader;		
	@ShowInView(name="业务状态",operateType=OperateType.SELECT,ccateType="businessStatus")
	private String businessStatus;
	@ShowInView(name="申请人")
	private String applyer;
	@ShowInView(name="申请人工号")
	private String applyerLoginname;
	@ShowInView(name="申请时间")	
	private Date applyTime;
	@ShowInView(name="提交人")
	private String initiator;
	@ShowInView(name="提交人工号")
	private String initiatorLoginname;
	@NotNull(message="时间不可为空")
	@ShowInView(name="提交时间")
	private Date initiateTime;
	@ShowInView(name="待处理人")
	private String handler;
	@ShowInView(name="待处理人工号")
	private String handlerLoginname;
	@ShowInView(name="建议&意见")
	private String suggestion;
	@ShowInView(name="项目状态",operateType=OperateType.SELECT,ccateType="securityLevelStatus")
	private String status;
	@ShowInView(name="备注")
	private String remarks;
	@ShowInView(name="是否历史记录")
	private Integer ishistory;	
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public SecurityLevel() {
		this.ishistory=0;
		this.removed=0;
	}

	/** minimal constructor */
	public SecurityLevel(Integer id, String companyId,String company,
			String applyer, String applyerLoginname, Date applyTime,
			String initiator, String initiatorLoginname, Date initiateTime,
			Integer ishistory,Integer removed) {
		this.id = id;
		this.companyId = companyId;
		this.company = company;
		this.applyer = applyer;
		this.applyerLoginname = applyerLoginname;
		this.applyTime = applyTime;
		this.initiator = initiator;
		this.initiatorLoginname = initiatorLoginname;
		this.initiateTime = initiateTime;
		this.ishistory=ishistory;
		this.removed = removed;
	}

	/** full constructor */
	public SecurityLevel(Integer id, String companyId,String company,
			String companyProvince, String companyCity, String companyCounty,
			String zipCode, String addressCode, String leaderName,
			String leaderPost, String leaderPhone, String leaderEmail,
			String leaderMobile, String subordinateRelation,
			String subordinateRelationOther, String companyType,
			String companyTypeOther, String businessCategory,
			String businessCategoryOther, Integer totalSysNum,
			Integer level1SysNum, Integer level2SysNum, Integer level3SysNum,
			Integer level4SysNum, Integer level5SysNum, String dutyDept,
			String dutyDeptLinkmanName, String dutyDeptLinkmanPost,
			String dutyDeptLinkmanPhone, String dutyDeptLinkmanEmail,
			String systemType, String systemTypeOther, String sysNetArea,
			String sysNetAreaOther, String systemName, String systemNum,
			String sysBusinessType, String sysBusinessTypeOther, String sysBusinessDescription,
			String sysServeScope, String sysServeScopeOther,
			Integer sysServeScopeCrossP, Integer sysServeScopeCrossC,
			String sysServeObj, String sysServeObjOther, String sysNetCover,
			String sysNetCoverOther, String sysNetProperty,
			String sysNetPropertyOther, String sysConnect,
			String sysConnectOther, String keyProducts, String sysServices,
			String reviewCompany, Date startUserDate,
			String isOperationOutsource, String outsourceCompany,
			String isSubsystem, String mainSystem, String mainSystemCompany,
			String businessSecurityLevel, String businessSecurityDamage,
			String serviceSecurityLevel, String sysSecurityDamage,
			String sysSecurityLevel, Date levelConfirmDate,
			String expertReview, String hasDeptIncharge, String deptIncharge,
			String deptInchargeReview, String hasSysLevelFile,
			String hasSysTipologyFile, String hasSysSecurityOrganFile,
			String hasSysProtectFile, String hasSysProductsFile,
			String hasSysLevelReviewFile, Date sysLevelReviewDate,
			String hasExpertReviewFile, String hasDeptInchargeReviewFile,
			String businessStatus, String applyer, String applyerLoginname,
			Date applyTime, String initiator, String initiatorLoginname,
			Date initiateTime, String suggestion, String handler,
			String handlerLoginname, String status, String remarks,
			Integer ishistory,Integer removed) {
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
		this.dutyDept = dutyDept;
		this.dutyDeptLinkmanName = dutyDeptLinkmanName;
		this.dutyDeptLinkmanPost = dutyDeptLinkmanPost;
		this.dutyDeptLinkmanPhone = dutyDeptLinkmanPhone;
		this.dutyDeptLinkmanEmail = dutyDeptLinkmanEmail;
		this.systemType = systemType;
		this.systemTypeOther = systemTypeOther;
		this.sysNetArea = sysNetArea;
		this.sysNetAreaOther = sysNetAreaOther;
		this.systemName = systemName;
		this.systemNum = systemNum;
		this.sysBusinessType = sysBusinessType;
		this.sysBusinessTypeOther = sysBusinessTypeOther;
		this.sysBusinessDescription = sysBusinessDescription;
		this.sysServeScope = sysServeScope;
		this.sysServeScopeOther = sysServeScopeOther;
		this.sysServeScopeCrossP = sysServeScopeCrossP;
		this.sysServeScopeCrossC = sysServeScopeCrossC;
		this.sysServeObj = sysServeObj;
		this.sysServeObjOther = sysServeObjOther;
		this.sysNetCover = sysNetCover;
		this.sysNetCoverOther = sysNetCoverOther;
		this.sysNetProperty = sysNetProperty;
		this.sysNetPropertyOther = sysNetPropertyOther;
		this.sysConnect = sysConnect;
		this.sysConnectOther = sysConnectOther;
		this.keyProducts = keyProducts;
		this.sysServices = sysServices;
		this.reviewCompany = reviewCompany;
		this.startUserDate = startUserDate;
		this.isOperationOutsource = isOperationOutsource;
		this.outsourceCompany = outsourceCompany;
		this.isSubsystem = isSubsystem;
		this.mainSystem = mainSystem;
		this.mainSystemCompany = mainSystemCompany;
		this.businessSecurityLevel = businessSecurityLevel;
		this.businessSecurityDamage = businessSecurityDamage;
		this.serviceSecurityLevel = serviceSecurityLevel;
		this.sysSecurityDamage = sysSecurityDamage;
		this.sysSecurityLevel = sysSecurityLevel;
		this.levelConfirmDate = levelConfirmDate;
		this.expertReview = expertReview;
		this.hasDeptIncharge = hasDeptIncharge;
		this.deptIncharge = deptIncharge;
		this.deptInchargeReview = deptInchargeReview;
		this.hasSysLevelFile = hasSysLevelFile;
		this.hasSysTipologyFile = hasSysTipologyFile;
		this.hasSysSecurityOrganFile = hasSysSecurityOrganFile;
		this.hasSysProtectFile = hasSysProtectFile;
		this.hasSysProductsFile = hasSysProductsFile;
		this.hasSysLevelReviewFile = hasSysLevelReviewFile;
		this.sysLevelReviewDate = sysLevelReviewDate;
		this.hasExpertReviewFile = hasExpertReviewFile;
		this.hasDeptInchargeReviewFile = hasDeptInchargeReviewFile;
		this.businessStatus = businessStatus;
		this.applyer = applyer;
		this.applyerLoginname = applyerLoginname;
		this.applyTime = applyTime;
		this.initiator = initiator;
		this.initiatorLoginname = initiatorLoginname;
		this.initiateTime = initiateTime;
		this.suggestion = suggestion;
		this.handler = handler;
		this.handlerLoginname = handlerLoginname;
		this.status = status;
		this.remarks = remarks;
		this.ishistory = ishistory;		
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_security_level",allocationSize=1)
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

	@Column(name = "DUTY_DEPT", length = 200)
	public String getDutyDept() {
		return this.dutyDept;
	}

	public void setDutyDept(String dutyDept) {
		this.dutyDept = dutyDept;
	}

	@Column(name = "DUTY_DEPT_LINKMAN_NAME", length = 50)
	public String getDutyDeptLinkmanName() {
		return this.dutyDeptLinkmanName;
	}

	public void setDutyDeptLinkmanName(String dutyDeptLinkmanName) {
		this.dutyDeptLinkmanName = dutyDeptLinkmanName;
	}

	@Column(name = "DUTY_DEPT_LINKMAN_POST", length = 50)
	public String getDutyDeptLinkmanPost() {
		return this.dutyDeptLinkmanPost;
	}

	public void setDutyDeptLinkmanPost(String dutyDeptLinkmanPost) {
		this.dutyDeptLinkmanPost = dutyDeptLinkmanPost;
	}

	@Column(name = "DUTY_DEPT_LINKMAN_PHONE", length = 50)
	public String getDutyDeptLinkmanPhone() {
		return this.dutyDeptLinkmanPhone;
	}

	public void setDutyDeptLinkmanPhone(String dutyDeptLinkmanPhone) {
		this.dutyDeptLinkmanPhone = dutyDeptLinkmanPhone;
	}

	@Column(name = "DUTY_DEPT_LINKMAN_EMAIL", length = 50)
	public String getDutyDeptLinkmanEmail() {
		return this.dutyDeptLinkmanEmail;
	}

	public void setDutyDeptLinkmanEmail(String dutyDeptLinkmanEmail) {
		this.dutyDeptLinkmanEmail = dutyDeptLinkmanEmail;
	}

	@Column(name = "SYSTEM_TYPE", length = 50)
	public String getSystemType() {
		return this.systemType;
	}

	public void setSystemType(String systemType) {
		this.systemType = systemType;
	}

	@Column(name = "SYSTEM_TYPE_OTHER", length = 100)
	public String getSystemTypeOther() {
		return this.systemTypeOther;
	}

	public void setSystemTypeOther(String systemTypeOther) {
		this.systemTypeOther = systemTypeOther;
	}

	@Column(name = "SYS_NET_AREA", length = 50)
	public String getSysNetArea() {
		return this.sysNetArea;
	}

	public void setSysNetArea(String sysNetArea) {
		this.sysNetArea = sysNetArea;
	}

	@Column(name = "SYS_NET_AREA_OTHER", length = 100)
	public String getSysNetAreaOther() {
		return this.sysNetAreaOther;
	}

	public void setSysNetAreaOther(String sysNetAreaOther) {
		this.sysNetAreaOther = sysNetAreaOther;
	}

	@Column(name = "SYSTEM_NAME", length = 200)
	public String getSystemName() {
		return this.systemName;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}

	@Column(name = "SYSTEM_NUM", length = 50)
	public String getSystemNum() {
		return this.systemNum;
	}

	public void setSystemNum(String systemNum) {
		this.systemNum = systemNum;
	}

	@Column(name = "SYS_BUSINESS_TYPE", length = 50)
	public String getSysBusinessType() {
		return this.sysBusinessType;
	}

	public void setSysBusinessType(String sysBusinessType) {
		this.sysBusinessType = sysBusinessType;
	}

	@Column(name = "SYS_BUSINESS_TYPE_OTHER", length = 100)
	public String getSysBusinessTypeOther() {
		return this.sysBusinessTypeOther;
	}

	public void setSysBusinessTypeOther(String sysBusinessTypeOther) {
		this.sysBusinessTypeOther = sysBusinessTypeOther;
	}
	
	@Column(name = "SYS_BUSINESS_DESCRIPTION", length = 1000)
	public String getSysBusinessDescription() {
		return this.sysBusinessDescription;
	}

	public void setSysBusinessDescription(String sysBusinessDescription) {
		this.sysBusinessDescription = sysBusinessDescription;
	}
	
	@Column(name = "SYS_SERVE_SCOPE", length = 50)
	public String getSysServeScope() {
		return this.sysServeScope;
	}

	public void setSysServeScope(String sysServeScope) {
		this.sysServeScope = sysServeScope;
	}

	@Column(name = "SYS_SERVE_SCOPE_OTHER", length = 100)
	public String getSysServeScopeOther() {
		return this.sysServeScopeOther;
	}

	public void setSysServeScopeOther(String sysServeScopeOther) {
		this.sysServeScopeOther = sysServeScopeOther;
	}

	@Column(name = "SYS_SERVE_SCOPE_CROSS_P", precision = 22, scale = 0)
	public Integer getSysServeScopeCrossP() {
		return this.sysServeScopeCrossP;
	}

	public void setSysServeScopeCrossP(Integer sysServeScopeCrossP) {
		this.sysServeScopeCrossP = sysServeScopeCrossP;
	}

	@Column(name = "SYS_SERVE_SCOPE_CROSS_C", precision = 22, scale = 0)
	public Integer getSysServeScopeCrossC() {
		return this.sysServeScopeCrossC;
	}

	public void setSysServeScopeCrossC(Integer sysServeScopeCrossC) {
		this.sysServeScopeCrossC = sysServeScopeCrossC;
	}

	@Column(name = "SYS_SERVE_OBJ", length = 50)
	public String getSysServeObj() {
		return this.sysServeObj;
	}

	public void setSysServeObj(String sysServeObj) {
		this.sysServeObj = sysServeObj;
	}

	@Column(name = "SYS_SERVE_OBJ_OTHER", length = 100)
	public String getSysServeObjOther() {
		return this.sysServeObjOther;
	}

	public void setSysServeObjOther(String sysServeObjOther) {
		this.sysServeObjOther = sysServeObjOther;
	}

	@Column(name = "SYS_NET_COVER", length = 50)
	public String getSysNetCover() {
		return this.sysNetCover;
	}

	public void setSysNetCover(String sysNetCover) {
		this.sysNetCover = sysNetCover;
	}

	@Column(name = "SYS_NET_COVER_OTHER", length = 100)
	public String getSysNetCoverOther() {
		return this.sysNetCoverOther;
	}

	public void setSysNetCoverOther(String sysNetCoverOther) {
		this.sysNetCoverOther = sysNetCoverOther;
	}

	@Column(name = "SYS_NET_PROPERTY", length = 50)
	public String getSysNetProperty() {
		return this.sysNetProperty;
	}

	public void setSysNetProperty(String sysNetProperty) {
		this.sysNetProperty = sysNetProperty;
	}

	@Column(name = "SYS_NET_PROPERTY_OTHER", length = 100)
	public String getSysNetPropertyOther() {
		return this.sysNetPropertyOther;
	}

	public void setSysNetPropertyOther(String sysNetPropertyOther) {
		this.sysNetPropertyOther = sysNetPropertyOther;
	}

	@Column(name = "SYS_CONNECT", length = 50)
	public String getSysConnect() {
		return this.sysConnect;
	}

	public void setSysConnect(String sysConnect) {
		this.sysConnect = sysConnect;
	}

	@Column(name = "SYS_CONNECT_OTHER", length = 100)
	public String getSysConnectOther() {
		return this.sysConnectOther;
	}

	public void setSysConnectOther(String sysConnectOther) {
		this.sysConnectOther = sysConnectOther;
	}

	@Column(name = "KEY_PRODUCTS", length = 1000)
	public String getKeyProducts() {
		return this.keyProducts;
	}

	public void setKeyProducts(String keyProducts) {
		this.keyProducts = keyProducts;
	}

	@Column(name = "SYS_SERVICES", length = 1000)
	public String getSysServices() {
		return this.sysServices;
	}

	public void setSysServices(String sysServices) {
		this.sysServices = sysServices;
	}

	@Column(name = "REVIEW_COMPANY", length = 200)
	public String getReviewCompany() {
		return this.reviewCompany;
	}

	public void setReviewCompany(String reviewCompany) {
		this.reviewCompany = reviewCompany;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "START_USER_DATE", length = 7)
	public Date getStartUserDate() {
		return this.startUserDate;
	}

	public void setStartUserDate(Date startUserDate) {
		this.startUserDate = startUserDate;
	}

	@Column(name = "IS_OPERATION_OUTSOURCE", length = 50)
//	@Enumerated(EnumType.STRING)
	public String getIsOperationOutsource() {
		return this.isOperationOutsource;
	}

	public void setIsOperationOutsource(String isOperationOutsource) {
		this.isOperationOutsource = isOperationOutsource;
	}

	@Column(name = "OUTSOURCE_COMPANY", length = 200)
	public String getOutsourceCompany() {
		return this.outsourceCompany;
	}

	public void setOutsourceCompany(String outsourceCompany) {
		this.outsourceCompany = outsourceCompany;
	}

	@Column(name = "IS_SUBSYSTEM", length = 50)
//	@Enumerated(EnumType.STRING)
	public String getIsSubsystem() {
		return this.isSubsystem;
	}

	public void setIsSubsystem(String isSubsystem) {
		this.isSubsystem = isSubsystem;
	}

	@Column(name = "MAIN_SYSTEM", length = 200)
	public String getMainSystem() {
		return this.mainSystem;
	}

	public void setMainSystem(String mainSystem) {
		this.mainSystem = mainSystem;
	}

	@Column(name = "MAIN_SYSTEM_COMPANY", length = 200)
	public String getMainSystemCompany() {
		return this.mainSystemCompany;
	}

	public void setMainSystemCompany(String mainSystemCompany) {
		this.mainSystemCompany = mainSystemCompany;
	}

	@Column(name = "BUSINESS_SECURITY_LEVEL", length = 50)
	public String getBusinessSecurityLevel() {
		return this.businessSecurityLevel;
	}

	public void setBusinessSecurityLevel(String businessSecurityLevel) {
		this.businessSecurityLevel = businessSecurityLevel;
	}

	@Column(name = "BUSINESS_SECURITY_DAMAGE", length = 100)
	public String getBusinessSecurityDamage() {
		return this.businessSecurityDamage;
	}

	public void setBusinessSecurityDamage(String businessSecurityDamage) {
		this.businessSecurityDamage = businessSecurityDamage;
	}

	@Column(name = "SERVICE_SECURITY_LEVEL", length = 50)
	public String getServiceSecurityLevel() {
		return this.serviceSecurityLevel;
	}

	public void setServiceSecurityLevel(String serviceSecurityLevel) {
		this.serviceSecurityLevel = serviceSecurityLevel;
	}

	@Column(name = "SYS_SECURITY_DAMAGE", length = 100)
	public String getSysSecurityDamage() {
		return this.sysSecurityDamage;
	}

	public void setSysSecurityDamage(String sysSecurityDamage) {
		this.sysSecurityDamage = sysSecurityDamage;
	}

	@Column(name = "SYS_SECURITY_LEVEL", length = 50)
	public String getSysSecurityLevel() {
		return this.sysSecurityLevel;
	}

	public void setSysSecurityLevel(String sysSecurityLevel) {
		this.sysSecurityLevel = sysSecurityLevel;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "LEVEL_CONFIRM_DATE", length = 7)
	public Date getLevelConfirmDate() {
		return this.levelConfirmDate;
	}

	public void setLevelConfirmDate(Date levelConfirmDate) {
		this.levelConfirmDate = levelConfirmDate;
	}

	@Column(name = "EXPERT_REVIEW", length = 50)
//	@Enumerated(EnumType.STRING)
	public String getExpertReview() {
		return this.expertReview;
	}

	public void setExpertReview(String expertReview) {
		this.expertReview = expertReview;
	}

	@Column(name = "HAS_DEPT_INCHARGE", length = 50)
//	@Enumerated(EnumType.STRING)	
	public String getHasDeptIncharge() {
		return this.hasDeptIncharge;
	}

	public void setHasDeptIncharge(String hasDeptIncharge) {
		this.hasDeptIncharge = hasDeptIncharge;
	}

	@Column(name = "DEPT_INCHARGE", length = 200)
	public String getDeptIncharge() {
		return this.deptIncharge;
	}

	public void setDeptIncharge(String deptIncharge) {
		this.deptIncharge = deptIncharge;
	}

	@Column(name = "DEPT_INCHARGE_REVIEW", length = 50)
//	@Enumerated(EnumType.STRING)	
	public String getDeptInchargeReview() {
		return this.deptInchargeReview;
	}

	public void setDeptInchargeReview(String deptInchargeReview) {
		this.deptInchargeReview = deptInchargeReview;
	}

	@Column(name = "HAS_SYS_LEVEL_FILE", length = 50)
//	@Enumerated(EnumType.STRING)	
	public String getHasSysLevelFile() {
		return this.hasSysLevelFile;
	}

	public void setHasSysLevelFile(String hasSysLevelFile) {
		this.hasSysLevelFile = hasSysLevelFile;
	}

	@Column(name = "HAS_SYS_TIPOLOGY_FILE", length = 50)
//	@Enumerated(EnumType.STRING)	
	public String getHasSysTipologyFile() {
		return this.hasSysTipologyFile;
	}

	public void setHasSysTipologyFile(String hasSysTipologyFile) {
		this.hasSysTipologyFile = hasSysTipologyFile;
	}

	@Column(name = "HAS_SYS_SECURITY_ORGAN_FILE", length = 50)
//	@Enumerated(EnumType.STRING)	
	public String getHasSysSecurityOrganFile() {
		return this.hasSysSecurityOrganFile;
	}

	public void setHasSysSecurityOrganFile(String hasSysSecurityOrganFile) {
		this.hasSysSecurityOrganFile = hasSysSecurityOrganFile;
	}

	@Column(name = "HAS_SYS_PROTECT_FILE", length = 50)
//	@Enumerated(EnumType.STRING)	
	public String getHasSysProtectFile() {
		return this.hasSysProtectFile;
	}

	public void setHasSysProtectFile(String hasSysProtectFile) {
		this.hasSysProtectFile = hasSysProtectFile;
	}

	@Column(name = "HAS_SYS_PRODUCTS_FILE", length = 50)
//	@Enumerated(EnumType.STRING)
	public String getHasSysProductsFile() {
		return this.hasSysProductsFile;
	}

	public void setHasSysProductsFile(String hasSysProductsFile) {
		this.hasSysProductsFile = hasSysProductsFile;
	}

	@Column(name = "HAS_SYS_LEVEL_REVIEW_FILE", length = 50)
//	@Enumerated(EnumType.STRING)
	public String getHasSysLevelReviewFile() {
		return this.hasSysLevelReviewFile;
	}

	public void setHasSysLevelReviewFile(String hasSysLevelReviewFile) {
		this.hasSysLevelReviewFile = hasSysLevelReviewFile;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "SYS_LEVEL_REVIEW_DATE", length = 7)
	public Date getSysLevelReviewDate() {
		return this.sysLevelReviewDate;
	}

	public void setSysLevelReviewDate(Date sysLevelReviewDate) {
		this.sysLevelReviewDate = sysLevelReviewDate;
	}

	@Column(name = "HAS_EXPERT_REVIEW_FILE", length = 50)
//	@Enumerated(EnumType.STRING)
	public String getHasExpertReviewFile() {
		return this.hasExpertReviewFile;
	}

	public void setHasExpertReviewFile(String hasExpertReviewFile) {
		this.hasExpertReviewFile = hasExpertReviewFile;
	}

	@Column(name = "HAS_DEPT_INCHARGE_REVIEW_FILE", length = 50)
//	@Enumerated(EnumType.STRING)
	public String getHasDeptInchargeReviewFile() {
		return this.hasDeptInchargeReviewFile;
	}

	public void setHasDeptInchargeReviewFile(String hasDeptInchargeReviewFile) {
		this.hasDeptInchargeReviewFile = hasDeptInchargeReviewFile;
	}

	@Column(name = "BUSINESS_STATUS", length = 50)
	public String getBusinessStatus() {
		return this.businessStatus;
	}

	public void setBusinessStatus(String businessStatus) {
		this.businessStatus = businessStatus;
	}

	@Column(name = "APPLYER", nullable = false, length = 200)
	public String getApplyer() {
		return this.applyer;
	}

	public void setApplyer(String applyer) {
		this.applyer = applyer;
	}

	@Column(name = "APPLYER_LOGINNAME", nullable = false, length = 200)
	public String getApplyerLoginname() {
		return this.applyerLoginname;
	}

	public void setApplyerLoginname(String applyerLoginname) {
		this.applyerLoginname = applyerLoginname;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "APPLY_TIME", nullable = false, length = 7)
	public Date getApplyTime() {
		return this.applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
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
	@Column(name = "INITIATE_TIME", nullable = false, length = 7)
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

	@Column(name = "STATUS", length = 50)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "REMARKS", length = 1500)
	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}
	
	@Column(name = "ISHISTORY", nullable = false, precision = 22, scale = 0)
	public Integer getIshistory() {
		return this.ishistory;
	}

	public void setIshistory(Integer ishistory) {
		this.ishistory = ishistory;
	}	

//	public static enum HasOrNot implements GenericEnum{
//		YES(1,"有"), NO(2,"无");
//
//		private int code;
//		private String description;
//		
//		private HasOrNot(int code,String description){
//			this.code=code;	
//			this.description=description;	
//		}
//		public int code(){
//			return code;
//		}
//		public String description(){
//			return description;
//		}
//	}
//	public static enum YesOrNo implements GenericEnum{
//		YES(1,"是"), NO(2,"否");
//
//		private int code;
//		private String description;
//		
//		private YesOrNo(int code,String description){
//			this.code=code;	
//			this.description=description;	
//		}
//		public int code(){
//			return code;
//		}
//		public String description(){
//			return description;
//		}
//	}
//	
//	public static enum ReviewOrNot implements GenericEnum{
//		YES(1,"已评审"), NO(2,"未评审");
//
//		private int code;
//		private String description;
//		
//		private ReviewOrNot(int code,String description){
//			this.code=code;	
//			this.description=description;	
//		}
//		public int code(){
//			return code;
//		}
//		public String description(){
//			return description;
//		}
//	}
//	
//	public static enum ApproveOrNot implements GenericEnum{
//		YES(1,"已审批"), NO(2,"未审批"),;
//
//		private int code;
//		private String description;
//		
//		private ApproveOrNot(int code,String description){
//			this.code=code;	
//			this.description=description;	
//		}
//		public int code(){
//			return code;
//		}
//		public String description(){
//			return description;
//		}
//	}

	@Column(name = "NODIFY_DEPT_LEADER", length = 50)
//	@Enumerated(EnumType.STRING)	
	public String getNotifyDeptLeader() {
		return notifyDeptLeader;
	}

	public void setNotifyDeptLeader(String notifyDeptLeader) {
		this.notifyDeptLeader = notifyDeptLeader;
	}
}