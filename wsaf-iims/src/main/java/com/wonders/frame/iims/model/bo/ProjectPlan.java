package com.wonders.frame.iims.model.bo;

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

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import com.wonders.frame.core.model.vo.GenericEnum;
import com.wonders.frame.core.model.vo.Dictionary.YesOrNo;
import com.wonders.frame.core.tags.ShowInView;
import com.wonders.frame.core.tags.ShowInView.OperateType;

/**
 * ProjectPlan entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_PROJECT_PLAN")
@ShowInView(name="项目计划")
public class ProjectPlan implements java.io.Serializable {
	
	@ShowInView(noUse=true)
	private static final long serialVersionUID = -1705674125247143920L;

	@ShowInView(name="项目系统编号",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="项目编号")
	private String projectNum;
	@ShowInView(name="申报单位")
	private String reportUnit;
	@ShowInView(name="申报单位ID",operateType=OperateType.HIDDEN)
	private String reportUnitId;	
	@ShowInView(name="年度",operateType=OperateType.SELECT,ccateType="year")
	private String year;
	@ShowInView(name="项目实施应用范围",noUse=true,operateType=OperateType.SELECT,ccateType="line")
	private String line;
	@ShowInView(name="项目名称")
	private String projectName;
	@ShowInView(name="项目概述")
	private String mainContent;
	@ShowInView(name="规划板块",noUse=true)
	private String planningPart;
	@ShowInView(name="年度推进目标",operateType=OperateType.SELECT,ccateType="yearTarget")
	private String yearTarget;
	@ShowInView(name="年度推进目标理由")
	private String yearTargetReason;	
	@ShowInView(name="总投资估算")
	private Double totalInvestEstimate;
	@ShowInView(name="分项估算",noUse=true)
	private String lineBudget;
	@ShowInView(name="项目类别",operateType=OperateType.SELECT,ccateType="projectType")
	private String projectType;
	@ShowInView(name="资产类别大类",noUse=true)
	private String assetCategory1;
	@ShowInView(name="资产类别中类",noUse=true)
	private String assetCategory2;
	@ShowInView(name="资产类别小类",noUse=true)
	private String assetCategory3;
	@ShowInView(name="实施方式/招标",noUse=true)
	private InviteBid inviteBid;
	@ShowInView(name="实时方式/设计",noUse=true)
	private YesOrNo design;
	@ShowInView(name="实施方式/监理",noUse=true)
	private YesOrNo supervision;
	@ShowInView(name="信息化资源需求",operateType=OperateType.SELECT,ccateType="resourceRequirement")
	private String resourceRequirement;	
	@ShowInView(name="信息安全等级保护级别",operateType=OperateType.SELECT,ccateType="securityLevel")
	private String securityLevel;
	@ShowInView(name="计划开工时间")
	private Date planStartDate;
	@ShowInView(name="计划完工时间")
	private Date planEndDate;
	@ShowInView(name="资金计划/一季")
	private Double fundPlan1;
	@ShowInView(name="资金计划/二季")
	private Double fundPlan2;
	@ShowInView(name="资金计划/三季")
	private Double fundPlan3;
	@ShowInView(name="资金计划/四季")
	private Double fundPlan4;
	@ShowInView(name="资金计划/小计",noUse=true)
	private Double fundPlanAll;
	@ShowInView(name="备注")
	private String remarks;
	@ShowInView(name="申请人")
	private String applyer;
	@ShowInView(name="申请人工号")
	private String applyerLoginname;
	@NotNull(message="时间不可为空")
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
	@ShowInView(name="项目状态",operateType=OperateType.SELECT,ccateType="projectStatus")
	private String projectStatus;	
	@ShowInView(name="审批状态",operateType=OperateType.SELECT,ccateType="auditStatus")
	private String status;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	@ShowInView(name="业务类别",operateType=OperateType.SELECT,ccateType="businessType")
	private String businessType;	
	@ShowInView(name="业务层级",operateType=OperateType.SELECT,ccateType="businessLevel")
	private String businessLevel;
	@ShowInView(name="实施内容")
	private String implementContent;
	@ShowInView(name="建议实施主体",operateType=OperateType.SELECT,ccateType="suggestImplementDept")
	private String suggestImplementDept;
	@ShowInView(name="建议费用类别",operateType=OperateType.SELECT,ccateType="suggestCostType")
	private String suggestCostType;	
	@ShowInView(name="建议费用性质",operateType=OperateType.SELECT,ccateType="suggestCostProperty")
	private String suggestCostProperty;
	@ShowInView(name="启动时间")	
	private Date startTime;
	@ShowInView(name="建设周期")
	private String buildcycle;
	
	// Constructors

	/** default constructor */
	public ProjectPlan() {
		this.removed=0;
	}

	/** minimal constructor */
	public ProjectPlan(Integer id, String year, String line,
			String projectName, String mainContent, Double totalInvestEstimate,
			String lineBudget, String resourceRequirement, Date planStartDate,
			Date planEndDate) {
		this.id = id;
		this.year = year;
		this.line = line;
		this.projectName = projectName;
		this.mainContent = mainContent;
		this.totalInvestEstimate = totalInvestEstimate;
		this.lineBudget = lineBudget;
		this.resourceRequirement = resourceRequirement;
		this.planStartDate = planStartDate;
		this.planEndDate = planEndDate;
	}

	/** full constructor */
	public ProjectPlan(Integer id, String projectNum, String reportUnit,
			String year, String line, String projectName, String mainContent,
			String planningPart, String yearTarget, String yearTargetReason,Double totalInvestEstimate,
			String lineBudget, String projectType, String assetCategory1,
			String assetCategory2, String assetCategory3, InviteBid inviteBid,
			YesOrNo design, YesOrNo supervision, String resourceRequirement,
			Date planStartDate, Date planEndDate, Double fundPlan1,
			Double fundPlan2, Double fundPlan3, Double fundPlan4,
			Double fundPlanAll, String remarks, String initiator,
			String initiatorLoginname, Date initiateTime, String handler,
			String handlerLoginname, String suggestion, Date auditTime,
			String status, Integer removed,String businessType,String businessLevel,
			String implementContent,String suggestImplementDept,String suggestCostType,String suggestCostProperty) {
		this.id = id;
		this.projectNum = projectNum;
		this.reportUnit = reportUnit;
		this.year = year;
		this.line = line;
		this.projectName = projectName;
		this.mainContent = mainContent;
		this.planningPart = planningPart;
		this.yearTarget = yearTarget;
		this.yearTargetReason = yearTargetReason;		
		this.totalInvestEstimate = totalInvestEstimate;
		this.lineBudget = lineBudget;
		this.projectType = projectType;
		this.assetCategory1 = assetCategory1;
		this.assetCategory2 = assetCategory2;
		this.assetCategory3 = assetCategory3;
		this.inviteBid = inviteBid;
		this.design = design;
		this.supervision = supervision;
		this.resourceRequirement = resourceRequirement;
		this.planStartDate = planStartDate;
		this.planEndDate = planEndDate;
		this.fundPlan1 = fundPlan1;
		this.fundPlan2 = fundPlan2;
		this.fundPlan3 = fundPlan3;
		this.fundPlan4 = fundPlan4;
		this.fundPlanAll = fundPlanAll;
		this.remarks = remarks;
		this.initiator = initiator;
		this.initiatorLoginname = initiatorLoginname;
		this.initiateTime = initiateTime;
		this.handler = handler;
		this.handlerLoginname = handlerLoginname;
		this.suggestion = suggestion;
		this.status = status;
		this.removed = removed;
		this.businessType = businessType;
		this.businessLevel = businessLevel;
		this.implementContent = implementContent;
		this.suggestImplementDept = suggestImplementDept;
		this.suggestCostType = suggestCostType;
		this.suggestCostProperty = suggestCostProperty;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_project_plan",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "PROJECT_NUM", length = 20)
	public String getProjectNum() {
		return this.projectNum;
	}

	public void setProjectNum(String projectNum) {
		this.projectNum = projectNum;
	}

	@Column(name = "REPORT_UNIT", length = 50)
	public String getReportUnit() {
		return this.reportUnit;
	}

	public void setReportUnit(String reportUnit) {
		this.reportUnit = reportUnit;
	}
	@Column(name = "REPORT_UNIT_ID", length = 10)
	public String getReportUnitId() {
		return reportUnitId;
	}

	public void setReportUnitId(String reportUnitId) {
		this.reportUnitId = reportUnitId;
	}
	
	@Column(name = "YEAR", nullable = false, length = 4)
	public String getYear() {
		return this.year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	@Column(name = "LINE", length = 50)
	public String getLine() {
		return this.line;
	}

	public void setLine(String line) {
		this.line = line;
	}

	@Column(name = "PROJECT_NAME", nullable = false, length = 100)
	public String getProjectName() {
		return this.projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	@Column(name = "MAIN_CONTENT", nullable = false, length = 1500)
	public String getMainContent() {
		return this.mainContent;
	}

	public void setMainContent(String mainContent) {
		this.mainContent = mainContent;
	}

	@Column(name = "PLANNING_PART", length = 50)
	public String getPlanningPart() {
		return this.planningPart;
	}

	public void setPlanningPart(String planningPart) {
		this.planningPart = planningPart;
	}

	@Column(name = "YEAR_TARGET", length = 50)
	public String getYearTarget() {
		return this.yearTarget;
	}

	public void setYearTarget(String yearTarget) {
		this.yearTarget = yearTarget;
	}

	@Column(name = "YEAR_TARGET_REASON", length = 500)
	public String getYearTargetReason() {
		return this.yearTargetReason;
	}

	public void setYearTargetReason(String yearTargetReason) {
		this.yearTargetReason = yearTargetReason;
	}
	
	@Column(name = "TOTAL_INVEST_ESTIMATE", nullable = false, precision = 8)
	public Double getTotalInvestEstimate() {
		return this.totalInvestEstimate;
	}

	public void setTotalInvestEstimate(Double totalInvestEstimate) {
		this.totalInvestEstimate = totalInvestEstimate;
	}

	@Column(name = "LINE_BUDGET", length = 200)
	public String getLineBudget() {
		return this.lineBudget;
	}

	public void setLineBudget(String lineBudget) {
		this.lineBudget = lineBudget;
	}

	@Column(name = "PROJECT_TYPE", length = 50)
	public String getProjectType() {
		return this.projectType;
	}

	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}

	@Column(name = "ASSET_CATEGORY1", length = 50)
	public String getAssetCategory1() {
		return this.assetCategory1;
	}

	public void setAssetCategory1(String assetCategory1) {
		this.assetCategory1 = assetCategory1;
	}

	@Column(name = "ASSET_CATEGORY2", length = 50)
	public String getAssetCategory2() {
		return this.assetCategory2;
	}

	public void setAssetCategory2(String assetCategory2) {
		this.assetCategory2 = assetCategory2;
	}

	@Column(name = "ASSET_CATEGORY3", length = 50)
	public String getAssetCategory3() {
		return this.assetCategory3;
	}

	public void setAssetCategory3(String assetCategory3) {
		this.assetCategory3 = assetCategory3;
	}

	@Column(name = "INVITE_BID", length = 50)
	@Enumerated(EnumType.STRING)
	public InviteBid getInviteBid() {
		return this.inviteBid;
	}

	public void setInviteBid(InviteBid inviteBid) {
		this.inviteBid = inviteBid;
	}

	@Column(name = "DESIGN", length = 50)
	@Enumerated(EnumType.STRING)
	public YesOrNo getDesign() {
		return this.design;
	}

	public void setDesign(YesOrNo design) {
		this.design = design;
	}

	@Column(name = "SUPERVISION", length = 50)
	@Enumerated(EnumType.STRING)
	public YesOrNo getSupervision() {
		return this.supervision;
	}

	public void setSupervision(YesOrNo supervision) {
		this.supervision = supervision;
	}

	@Column(name = "RESOURCE_REQUIREMENT", length = 1000)
	public String getResourceRequirement() {
		return this.resourceRequirement;
	}

	public void setResourceRequirement(String resourceRequirement) {
		this.resourceRequirement = resourceRequirement;
	}

	@Column(name = "SECURITY_LEVEL", nullable=false,length = 20)
	public String getSecurityLevel() {
		return securityLevel;
	}

	public void setSecurityLevel(String securityLevel) {
		this.securityLevel = securityLevel;
	}
	@Temporal(TemporalType.DATE)
	@Column(name = "PLAN_START_DATE", nullable = false,length=20)
	public Date getPlanStartDate() {
		return this.planStartDate;
	}

	public void setPlanStartDate(Date planStartDate) {
		this.planStartDate = planStartDate;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "PLAN_END_DATE", nullable = false,length=20)
	public Date getPlanEndDate() {
		return this.planEndDate;
	}

	public void setPlanEndDate(Date planEndDate) {
		this.planEndDate = planEndDate;
	}

	@Column(name = "FUND_PLAN1", precision = 8)
	public Double getFundPlan1() {
		return this.fundPlan1;
	}

	public void setFundPlan1(Double fundPlan1) {
		this.fundPlan1 = fundPlan1;
	}

	@Column(name = "FUND_PLAN2", precision = 8)
	public Double getFundPlan2() {
		return this.fundPlan2;
	}

	public void setFundPlan2(Double fundPlan2) {
		this.fundPlan2 = fundPlan2;
	}

	@Column(name = "FUND_PLAN3", precision = 8)
	public Double getFundPlan3() {
		return this.fundPlan3;
	}

	public void setFundPlan3(Double fundPlan3) {
		this.fundPlan3 = fundPlan3;
	}

	@Column(name = "FUND_PLAN4", precision = 8)
	public Double getFundPlan4() {
		return this.fundPlan4;
	}

	public void setFundPlan4(Double fundPlan4) {
		this.fundPlan4 = fundPlan4;
	}

	@Column(name = "FUND_PLAN_ALL", precision = 8)
	public Double getFundPlanAll() {
		return this.fundPlanAll;
	}

	public void setFundPlanAll(Double fundPlanAll) {
		this.fundPlanAll = fundPlanAll;
	}

	@Column(name = "REMARKS", length = 1500)
	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Column(name = "APPLYER",nullable = false, length = 200)
	public String getApplyer() {
		return applyer;
	}

	public void setApplyer(String applyer) {
		this.applyer = applyer;
	}
	@Column(name = "APPLYER_LOGINNAME",nullable = false, length = 200)
	public String getApplyerLoginname() {
		return applyerLoginname;
	}

	public void setApplyerLoginname(String applyerLoginname) {
		this.applyerLoginname = applyerLoginname;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "APPLY_TIME" ,nullable = false)
	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}
	
	@Column(name = "INITIATOR",nullable = false, length = 200)
	public String getInitiator() {
		return this.initiator;
	}

	public void setInitiator(String initiator) {
		this.initiator = initiator;
	}

	@Column(name = "INITIATOR_LOGINNAME",nullable = false, length = 200)
	public String getInitiatorLoginname() {
		return this.initiatorLoginname;
	}

	public void setInitiatorLoginname(String initiatorLoginname) {
		this.initiatorLoginname = initiatorLoginname;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "INITIATE_TIME" ,nullable = false)
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


	@Column(name = "PROJECT_STATUS", nullable = false, length = 20)
	public String getProjectStatus() {
		return projectStatus;
	}

	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}
	@Column(name = "STATUS", nullable = false, length = 20)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "REMOVED", nullable = false)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}
	
	public static enum InviteBid implements GenericEnum{
		YES(1,"招标"), NO(0,"非招标");

		private int code;
		private String description;
		
		private InviteBid(int code,String description){
			this.code=code;	
			this.description=description;	
		}
		public int code(){
			return code;
		}
		public String description(){
			return description;
		}
	}
	@Column(name = "BUSINESS_TYPE",length = 50)
	public String getBusinessType() {
		return businessType;
	}


	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	@Column(name = "BUSINESS_LEVEL",length = 50)
	public String getBusinessLevel() {
		return businessLevel;
	}

	public void setBusinessLevel(String businessLevel) {
		this.businessLevel = businessLevel;
	}
	@Column(name = "IMPLEMENT_CONTENT",length = 1500)
	public String getImplementContent() {
		return implementContent;
	}

	public void setImplementContent(String implementContent) {
		this.implementContent = implementContent;
	}
	@Column(name = "SUGGEST_IMPLEMENT_DEPT",length = 50)
	public String getSuggestImplementDept() {
		return suggestImplementDept;
	}

	public void setSuggestImplementDept(String suggestImplementDept) {
		this.suggestImplementDept = suggestImplementDept;
	}
	@Column(name = "SUGGEST_COST_TYPE",length = 50)
	public String getSuggestCostType() {
		return suggestCostType;
	}

	public void setSuggestCostType(String suggestCostType) {
		this.suggestCostType = suggestCostType;
	}
	@Column(name = "SUGGEST_COST_PROPERTY",length = 50)
	public String getSuggestCostProperty() {
		return suggestCostProperty;
	}

	public void setSuggestCostProperty(String suggestCostProperty) {
		this.suggestCostProperty = suggestCostProperty;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "START_TIME")
	public Date getStartTime() {
		return startTime;
	}

	public void setBuildcycle(String buildcycle) {
		this.buildcycle = buildcycle;
	}
	@Column(name = "BUILD_CYCLE",length = 50)
	public String getBuildcycle() {
		return buildcycle;
	}




}