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

import com.wonders.frame.core.model.vo.GenericEnum;
import com.wonders.frame.core.tags.ShowInView;
import com.wonders.frame.core.tags.ShowInView.OperateType;

/**
 * IimsSecurityCheck entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_SECURITY_CHECK")
@ShowInView(name="安全自查")
public class SecurityCheck implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 6390904985360169855L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="单位ID")
	private String companyId;		
	@ShowInView(name="单位名称")
	private String company;
	@ShowInView(name="分管安全工作领导姓名")
	private String leaderName;
	@ShowInView(name="分管安全工作领导职务")
	private String leaderPost;
	@ShowInView(name="网络安全管理机构名称")
	private String officeName;
	@ShowInView(name="网络安全管理机构负责人")
	private String officeLeader;
	@ShowInView(name="网络安全管理机构负责人职务")
	private String officeLeaderPost;
	@ShowInView(name="网络安全管理机构联系人")
	private String officeLinkman;
	@ShowInView(name="网络安全管理机构办公电话")
	private String officePhone;
	@ShowInView(name="网络安全管理机构移动电话")
	private String officeMobile;
	@ShowInView(name="网络安全专职工作机构名称")
	private String jobOfficeName;
	@ShowInView(name="网络安全专职工作机构负责人")
	private String jobOfficeLeader;
	@ShowInView(name="网络安全专职工作机构办公电话")
	private String jobOfficePhone;
	@ShowInView(name="网络安全专职工作机构移动电话")
	private String jobOfficeMobile;
	
	@ShowInView(name="信息系统情况")
	private String infoSysSummary;
	@ShowInView(name="互联网接入情况")
	private String internetAccess;
	@ShowInView(name="系统定级情况")
	private String sysLevel;
	
	@ShowInView(name="岗位网络安全责任制度",operateType=OperateType.SELECT,ccateType="buildOrNot")
	private String staffResponsibilitySys;
	@ShowInView(name="重点岗位人员安全保密协议",operateType=OperateType.SELECT,ccateType="staffSecrecyAgree")
	private String staffSecrecyAgreement;
	@ShowInView(name="人员离岗离职安全管理规定",operateType=OperateType.SELECT,ccateType="draftOrNot")
	private String staffLeaveRule;
	@ShowInView(name="外部人员访问机房等重要区域审批制度",operateType=OperateType.SELECT,ccateType="buildOrNot")
	private String staffVisitAudit;
	@ShowInView(name="资产管理制度",operateType=OperateType.SELECT,ccateType="buildOrNot")
	private String assetManageSystem;
	@ShowInView(name="资产设备维护报废管理",operateType=OperateType.SELECT,ccateType="assetDeviceMaintain")
	private String assetDeviceMaintain;
	@ShowInView(name="网络安全防护设备部署",operateType=OperateType.SELECT,ccateType="netProtectDevice")
	private String netProtectDevice;
	@ShowInView(name="网络安全防护设备部署：其他")
	private String netProtectDeviceOther;
	@ShowInView(name="设备安全策略配置",operateType=OperateType.SELECT,ccateType="safeConfig")
	private String netSafestrategyConfig;
	@ShowInView(name="网络访问日志",operateType=OperateType.SELECT,ccateType="visitLog")
	private String netVisitLog;
	@ShowInView(name="云计算服务设施位置",operateType=OperateType.SELECT,ccateType="cloudDevice")
	private String netCloudDevice;
	@ShowInView(name="外包服务过程中数据提交",operateType=OperateType.SELECT,ccateType="epibolyDataCommit")
	private String netEpibolyDataCommit;
	@ShowInView(name="系统远程控制/维护",operateType=OperateType.SELECT,ccateType="remoteControl")
	private String netRemoteControl;
	@ShowInView(name="远程控制/维护系统")
	private String netRemoteControlSys;
	@ShowInView(name="无线路由器数量")
	private Integer routerCount;
	@ShowInView(name="无线路由器用途",operateType=OperateType.SELECT,ccateType="routerUse")
	private String routerUse;
	@ShowInView(name="安全防护策略",operateType=OperateType.SELECT,ccateType="securityDefense")
	private String securityDefense;
	@ShowInView(name="无线路由器使用默认管理地址情况",operateType=OperateType.SELECT,ccateType="existOrNot")
	private String routerDfaultAddress;
	@ShowInView(name="无线路由器使用默认管理口令情况",operateType=OperateType.SELECT,ccateType="existOrNot")
	private String routerDfaultPwd;
	@ShowInView(name="网站域名")
	private String siteDomain;
	@ShowInView(name="网站IP地址")
	private String siteIp;
	@ShowInView(name="网页防篡改",operateType=OperateType.SELECT,ccateType="useOrNot")
	private String sitePageAntitamper;
	@ShowInView(name="漏洞扫描",operateType=OperateType.SELECT,ccateType="leakScan")
	private String siteLeakScan;
	@ShowInView(name="漏洞扫描周期")
	private String siteLeakScanPeriod;
	@ShowInView(name="信息发布管理",operateType=OperateType.SELECT,ccateType="sitePublish")
	private String sitePublish;
	@ShowInView(name="运维方式",operateType=OperateType.SELECT,ccateType="siteMaintain")
	private String siteMaintain;
	@ShowInView(name="电子邮件建设方式",operateType=OperateType.SELECT,ccateType="emailBuild")
	private String emailBuild;
	@ShowInView(name="电子邮件服务提供商")
	private String emailSupplier;
	@ShowInView(name="电子邮件帐户数量")
	private Integer emailAccount;
	@ShowInView(name="电子邮件注册管理",operateType=OperateType.SELECT,ccateType="emailRegister")
	private String emailRegister;
	@ShowInView(name="电子邮件口令管理",operateType=OperateType.SELECT,ccateType="eamilPwd")
	private String emailPwd;
	@ShowInView(name="电子邮件安全防护",operateType=OperateType.SELECT,ccateType="emailProtect")
	private String emailProtect;
	@ShowInView(name="电子邮件安全防护：其他")
	private String emailProtectOther;
	@ShowInView(name="终端计算机安全管理",operateType=OperateType.SELECT,ccateType="terminalManage")
	private String terminalManage;
	@ShowInView(name="终端计算机集中统一管理",operateType=OperateType.SELECT,ccateType="unifiedManage")
	private String terminalUnifiedManage;
	@ShowInView(name="终端计算机接入互联网安全控制措施",operateType=OperateType.SELECT,ccateType="terminalLink")
	private String terminalLinkInternet;
	@ShowInView(name="终端计算机接入办公系统安全控制措施",operateType=OperateType.SELECT,ccateType="terminalLink")
	private String terminalLinkOa;
	@ShowInView(name="移动存储介质管理方式",operateType=OperateType.SELECT,ccateType="storageManage")
	private String storageManage;
	@ShowInView(name="移动存储介质信息销毁",operateType=OperateType.SELECT,ccateType="storageDestory")
	private String storageDestory;
	@ShowInView(name="应急预案",operateType=OperateType.SELECT,ccateType="draftOrNot")
	private String emergencyPlanJob;
	@ShowInView(name="应急预案本年度修订情况",operateType=OperateType.SELECT,ccateType="editOrNot")
	private String emergencyPlanEdit;	
	@ShowInView(name="应急演练",operateType=OperateType.SELECT,ccateType="emergencyTrain")
	private String emergencyTrainJob;
	@ShowInView(name="应急演练时间")
	private String emergencyTrainTime;	
	@ShowInView(name="灾难数据备份",operateType=OperateType.SELECT,ccateType="emergencyDataback")
	private String emergencyDataback;
	@ShowInView(name="灾难数据备份周期",operateType=OperateType.SELECT,ccateType="databackPeriod")
	private String emergencyDatabackPeriod;
	@ShowInView(name="采取实时备份措施的系统数量")
	private Integer emergencySysback;
	@ShowInView(name="未采取实时备份措施的系统数量")
	private Integer emergencyNoSysback;
	@ShowInView(name="应急技术队伍",operateType=OperateType.SELECT,ccateType="emergencyTeam")
	private String emergencyTechnicalTeam;
	@ShowInView(name="本年度开展网络安全教育培训的次数")
	private Integer educationTrainNum;
	@ShowInView(name="本年度参加网络安全教育培训的人数")
	private Integer educationTrainStaff;
	@ShowInView(name="本年度参加网络安全教育培训的人数所占百分比")
	private String educationTrainPercent;
	
	@ShowInView(name="服务器情况")
	private String productServer;
	@ShowInView(name="终端计算机情况",operateType=OperateType.SELECT,ccateType="afterWinXpStop")
	private String productTerminal;
	@ShowInView(name="路由器情况")
	private String productRouter;
	@ShowInView(name="交换机情况")
	private String productSwitch;
	@ShowInView(name="存储设备情况")
	private String productStorage;
	@ShowInView(name="数据库管理系统情况")
	private String productDb;
	@ShowInView(name="邮件系统情况")
	private String productEmail;
	@ShowInView(name="负载均衡设备情况")
	private String productLb;
	@ShowInView(name="防火墙设备情况")
	private String productFirewall;
	@ShowInView(name="入侵检测情况")
	private String productInvadeCheck;
	@ShowInView(name="安全审计情况")
	private String productSecurityAudit;
	@ShowInView(name="经费预算额")
	private String fundsBudget;
	@ShowInView(name="经费投入额")
	private String fundsUsed;
	@ShowInView(name="渗透测试情况")
	private String checkSeepTest;
	@ShowInView(name="恶意代码检测情况")
	private String checkBadcodeTest;
	@ShowInView(name="安全漏洞检测情况")
	private String checkLeakTest;
	@ShowInView(name="网站受攻击次数")
	private Integer eventAttackNum;
	@ShowInView(name="网站被篡改次数")
	private Integer eventTamperNum;
	@ShowInView(name="外包服务机构",operateType=OperateType.SELECT,ccateType="epibolyOrgan")
	private String epibolyOrgan;
	
	@ShowInView(name="网络安全组织管理-主管领导")
	private String organLeader;
	@ShowInView(name="网络安全组织管理-管理机构")
	private String organManage;
	@ShowInView(name="网络安全组织管理-安全员")
	private String organGuard;
	@ShowInView(name="网络安全日常管理-制度完整性")
	private String dailyRuleIntegrity;
	@ShowInView(name="网络安全日常管理-制度发布")
	private String dailyRulePublish;
	@ShowInView(name="网络安全日常管理-重点岗位人员")
	private String dailyStaffKey;
	@ShowInView(name="网络安全日常管理-人员离岗离职")
	private String dailyStaffLeave;
	@ShowInView(name="网络安全日常管理-外部人员访问")
	private String dailyStaffVisit;
	@ShowInView(name="网络安全日常管理-资产责任落实")
	private String dailyAssetDuty;
	@ShowInView(name="网络安全日常管理-资产台帐建立")
	private String dailyAssetBook;
	@ShowInView(name="网络安全日常管理-帐物符合度")
	private String dailyAssetConform;
	@ShowInView(name="网络安全日常管理-设备维护管理")
	private String dailyAssetMaintain;
	@ShowInView(name="网络安全日常管理-外包服务协议")
	private String dailyEpibolyAggrement;
	@ShowInView(name="网络安全日常管理-外包现场服务")
	private String dailyEpibolyService;
	@ShowInView(name="网络安全日常管理-外包开发管理")
	private String dailyEpibolyDevelop;
	@ShowInView(name="网络安全日常管理-外包运维服务")
	private String dailyEpibolyMaintain;
	@ShowInView(name="网络安全日常管理-经费保障预算")
	private String dailyFundsBudget;
	@ShowInView(name="网络安全日常管理-网站信息发布")
	private String dailySitePublish;
	@ShowInView(name="网络安全日常管理-电子信息销毁")
	private String dailyInfoDestory;
	@ShowInView(name="网络安全日常管理-物理机房安全")
	private String shieldPhysicalRoom;
	@ShowInView(name="网络安全日常管理-物理访问控制")
	private String shieldPhysicalVisit;
	@ShowInView(name="网络安全日常管理-网络访问控制")
	private String shieldNetVisit;
	@ShowInView(name="网络安全日常管理-网络入侵检测")
	private String shieldNetInvade;
	@ShowInView(name="网络安全日常管理-网络安全审计")
	private String shieldNetAudit;
	@ShowInView(name="网络安全日常管理-网络接入口数量")
	private String shieldNetPoint;
	@ShowInView(name="网络安全日常管理-设备恶意代码")
	private String shieldDeviceBadcode;
	@ShowInView(name="网络安全日常管理-设备漏洞扫描")
	private String shieldDeviceLeak;
	@ShowInView(name="网络安全日常管理-设备口令策略")
	private String shieldDevicePasswd;
	@ShowInView(name="网络安全日常管理-设备安全审计")
	private String shieldDeviceAudit;
	@ShowInView(name="网络安全日常管理-设备补丁更新")
	private String shieldDevicePatch;
	@ShowInView(name="网络安全日常管理-网络安全设备口令策略")
	private String shieldDeviceNetPwd;
	@ShowInView(name="网络安全日常管理-设备统一防护")
	private String shieldDeviceProtect;
	@ShowInView(name="网络安全日常管理-设备接入控制")
	private String shieldDeviceControl;
	@ShowInView(name="网络安全日常管理-应用漏洞扫描")
	private String shieldAppLeak;
	@ShowInView(name="网络安全日常管理-应用防篡改")
	private String shieldAppAntitamper;
	@ShowInView(name="网络安全日常管理-应用抗拒绝服务攻击")
	private String shieldAppAntiattack;
	@ShowInView(name="网络安全日常管理-应用电子邮件注册")
	private String shieldAppEmailRegister;
	@ShowInView(name="网络安全日常管理-应用电子邮件口令")
	private String shieldAppEmailPasswd;
	@ShowInView(name="网络安全日常管理-应用电子邮件清理")
	private String shieldAppEmailClear;
	@ShowInView(name="网络安全日常管理-数据存储保护")
	private String shieldDataStore;
	@ShowInView(name="网络安全日常管理-数据传输保护")
	private String shieldDataTransfer;
	@ShowInView(name="网络安全日常管理-数据备份保护")
	private String shieldDataBackup;
	@ShowInView(name="网络安全日常管理-数据灾备中心")
	private String shieldDataCenter;
	@ShowInView(name="网络安全应急管理-应急预案")
	private String emergencyPlan;
	@ShowInView(name="网络安全应急管理-应急演练")
	private String emergencyTrain;
	@ShowInView(name="网络安全应急管理-应急资源")
	private String emergencyResource;
	@ShowInView(name="网络安全应急管理-事件处理")
	private String emergencyEventHandle;
	@ShowInView(name="网络安全教育培训-意识教育")
	private String educationMentality;
	@ShowInView(name="网络安全教育培训-专业培训")
	private String educationTrain;
	@ShowInView(name="网络安全检查-工作部署")
	private String checkWorkDeploy;
	@ShowInView(name="网络安全检查-工作机制")
	private String checkWorkRule;
	@ShowInView(name="网络安全检查-技术检测")
	private String checkTechnicalDetecton;
	@ShowInView(name="网络安全检查-检查经费")
	private String checkFunds;
	
	@ShowInView(name="年度")
	private String year;
	@ShowInView(name="报告组成")
	private String compose;
	@ShowInView(name="组织开展情况")
	private String lunchSituation;
	@ShowInView(name="主要工作情况")
	private String workSituation;
	@ShowInView(name="主要问题和薄弱环节")
	private String problem;
	@ShowInView(name="安全威胁与风险")
	private String risk;
	@ShowInView(name="基本判断")
	private String judge;
	@ShowInView(name="改进措施")
	private String improveMeasure;
	@ShowInView(name="整体效果")
	private String overallEffect;
	@ShowInView(name="总结意见&建议")
	private String summarySuggestion;
	
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
	@ShowInView(name="项目状态",operateType=OperateType.SELECT,ccateType="securityCheckStatus")
	private String status;
	@ShowInView(name="备注")
	private String remarks;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public SecurityCheck() {
		this.removed=0;
	}

	/** minimal constructor */
	public SecurityCheck(Integer id, String companyId,String company,
			String applyer, String applyerLoginname, Date applyTime,
			String initiator, String initiatorLoginname, Date initiateTime,
			Integer removed) {
		this.id = id;
		this.companyId = companyId;
		this.company = company;
		this.applyer = applyer;
		this.applyerLoginname = applyerLoginname;
		this.applyTime = applyTime;
		this.initiator = initiator;
		this.initiatorLoginname = initiatorLoginname;
		this.initiateTime = initiateTime;
		this.removed = removed;
	}

	/** full constructor */
	public SecurityCheck(Integer id, String companyId,String company,
			String leaderName, String leaderPost, String officeName,
			String officeLeader, String officeLeaderPost, String officeLinkman,
			String officePhone, String officeMobile, String jobOfficeName,
			String jobOfficeLeader, String jobOfficePhone,
			String jobOfficeMobile, String infoSysSummary,
			String internetAccess, String sysLevel,
			String staffResponsibilitySys, String staffSecrecyAgreement,
			String staffLeaveRule, String staffVisitAudit,
			String assetManageSystem, String assetDeviceMaintain,
			String netProtectDevice, String netProtectDeviceOther,
			String netSafestrategyConfig, String netVisitLog,
			String netCloudDevice, String netEpibolyDataCommit,
			String netRemoteControl, String netRemoteControlSys,
			Integer routerCount, String routerUse, String securityDefense,
			String routerDfaultAddress, String routerDfaultPwd,
			String siteDomain, String siteIp, String sitePageAntitamper,
			String siteLeakScan,String siteLeakScanPeriod, String sitePublish, String siteMaintain,
			String emailBuild, String emailSupplier, Integer emailAccount,
			String emailRegister, String emailPwd, String emailProtect,
			String emailProtectOther, String terminalManage,String terminalUnifiedManage,
			String terminalLinkInternet, String terminalLinkOa,
			String storageManage, String storageDestory,
			String emergencyPlanJob, String emergencyPlanEdit,
			String emergencyTrainJob, String emergencyTrainTime,
			String emergencyDataback,String emergencyDatabackPeriod, Integer emergencySysback,
			Integer emergencyNoSysback, String emergencyTechnicalTeam,
			Integer educationTrainNum, Integer educationTrainStaff,
			String educationTrainPercent, String productServer,
			String productTerminal, String productRouter, String productSwitch,
			String productStorage, String productDb, String productEmail,
			String productLb, String productFirewall,
			String productInvadeCheck, String productSecurityAudit,
			String fundsBudget, String fundsUsed, String checkSeepTest,
			String checkBadcodeTest, String checkLeakTest,
			Integer eventAttackNum, Integer eventTamperNum, String epibolyOrgan, 
			String organLeader, String organManage,
			String organGuard, String dailyRuleIntegrity,
			String dailyRulePublish, String dailyStaffKey,
			String dailyStaffLeave, String dailyStaffVisit,
			String dailyAssetDuty, String dailyAssetBook,
			String dailyAssetConform, String dailyAssetMaintain,
			String dailyEpibolyAggrement, String dailyEpibolyService,
			String dailyEpibolyDevelop, String dailyEpibolyMaintain,
			String dailyFundsBudget, String dailySitePublish,
			String dailyInfoDestory, String shieldPhysicalRoom,
			String shieldPhysicalVisit, String shieldNetVisit,
			String shieldNetInvade, String shieldNetAudit,
			String shieldNetPoint, String shieldDeviceBadcode,
			String shieldDeviceLeak, String shieldDevicePasswd,
			String shieldDeviceAudit, String shieldDevicePatch,
			String shieldDeviceNetPwd, String shieldDeviceProtect,
			String shieldDeviceControl, String shieldAppLeak,
			String shieldAppAntitamper, String shieldAppAntiattack,
			String shieldAppEmailRegister, String shieldAppEmailPasswd,
			String shieldAppEmailClear, String shieldDataStore,
			String shieldDataTransfer, String shieldDataBackup,
			String shieldDataCenter, String emergencyPlan,
			String emergencyTrain, String emergencyResource,
			String emergencyEventHandle, String educationMentality,
			String educationTrain, String checkWorkDeploy,
			String checkWorkRule, String checkTechnicalDetecton,
			String checkFunds, String year, String compose,
			String lunchSituation, String workSituation, String problem,
			String risk, String judge, String improveMeasure,
			String overallEffect, String summarySuggestion, String applyer,
			String applyerLoginname, Date applyTime, String initiator,
			String initiatorLoginname, Date initiateTime, String suggestion,
			String handler, String handlerLoginname, String status,
			String remarks, Integer removed) {
		this.id = id;
		this.companyId = companyId;	
		this.company = company;
		this.leaderName = leaderName;
		this.leaderPost = leaderPost;
		this.officeName = officeName;
		this.officeLeader = officeLeader;
		this.officeLeaderPost = officeLeaderPost;
		this.officeLinkman = officeLinkman;
		this.officePhone = officePhone;
		this.officeMobile = officeMobile;
		this.jobOfficeName = jobOfficeName;
		this.jobOfficeLeader = jobOfficeLeader;
		this.jobOfficePhone = jobOfficePhone;
		this.jobOfficeMobile = jobOfficeMobile;
		this.infoSysSummary = infoSysSummary;
		this.internetAccess = internetAccess;
		this.sysLevel = sysLevel;
		this.staffResponsibilitySys = staffResponsibilitySys;
		this.staffSecrecyAgreement = staffSecrecyAgreement;
		this.staffLeaveRule = staffLeaveRule;
		this.staffVisitAudit = staffVisitAudit;
		this.assetManageSystem = assetManageSystem;
		this.assetDeviceMaintain = assetDeviceMaintain;
		this.netProtectDevice = netProtectDevice;
		this.netProtectDeviceOther = netProtectDeviceOther;
		this.netSafestrategyConfig = netSafestrategyConfig;
		this.netVisitLog = netVisitLog;
		this.netCloudDevice = netCloudDevice;
		this.netEpibolyDataCommit = netEpibolyDataCommit;
		this.netRemoteControl = netRemoteControl;
		this.netRemoteControlSys = netRemoteControlSys;
		this.routerCount = routerCount;
		this.routerUse = routerUse;
		this.securityDefense = securityDefense;
		this.routerDfaultAddress = routerDfaultAddress;
		this.routerDfaultPwd = routerDfaultPwd;
		this.siteDomain = siteDomain;
		this.siteIp = siteIp;
		this.sitePageAntitamper = sitePageAntitamper;
		this.siteLeakScan = siteLeakScan;
		this.siteLeakScanPeriod = siteLeakScanPeriod;
		this.sitePublish = sitePublish;
		this.siteMaintain = siteMaintain;
		this.emailBuild = emailBuild;
		this.emailSupplier = emailSupplier;
		this.emailAccount = emailAccount;
		this.emailRegister = emailRegister;
		this.emailPwd = emailPwd;
		this.emailProtect = emailProtect;
		this.emailProtectOther = emailProtectOther;
		this.terminalManage = terminalManage;
		this.terminalUnifiedManage = terminalUnifiedManage;
		this.terminalLinkInternet = terminalLinkInternet;
		this.terminalLinkOa = terminalLinkOa;
		this.storageManage = storageManage;
		this.storageDestory = storageDestory;
		this.emergencyPlanJob = emergencyPlanJob;
		this.emergencyPlanEdit = emergencyPlanEdit;
		this.emergencyTrainJob = emergencyTrainJob;
		this.emergencyTrainTime = emergencyTrainTime;
		this.emergencyDataback = emergencyDataback;
		this.emergencyDatabackPeriod = emergencyDatabackPeriod;
		this.emergencySysback = emergencySysback;
		this.emergencyNoSysback = emergencyNoSysback;
		this.emergencyTechnicalTeam = emergencyTechnicalTeam;
		this.educationTrainNum = educationTrainNum;
		this.educationTrainStaff = educationTrainStaff;
		this.educationTrainPercent = educationTrainPercent;
		this.productServer = productServer;
		this.productTerminal = productTerminal;
		this.productRouter = productRouter;
		this.productSwitch = productSwitch;
		this.productStorage = productStorage;
		this.productDb = productDb;
		this.productEmail = productEmail;
		this.productLb = productLb;
		this.productFirewall = productFirewall;
		this.productInvadeCheck = productInvadeCheck;
		this.productSecurityAudit = productSecurityAudit;
		this.fundsBudget = fundsBudget;
		this.fundsUsed = fundsUsed;
		this.checkSeepTest = checkSeepTest;
		this.checkBadcodeTest = checkBadcodeTest;
		this.checkLeakTest = checkLeakTest;
		this.eventAttackNum = eventAttackNum;
		this.eventTamperNum = eventTamperNum;
		this.epibolyOrgan = epibolyOrgan;
		this.organLeader = organLeader;
		this.organManage = organManage;
		this.organGuard = organGuard;
		this.dailyRuleIntegrity = dailyRuleIntegrity;
		this.dailyRulePublish = dailyRulePublish;
		this.dailyStaffKey = dailyStaffKey;
		this.dailyStaffLeave = dailyStaffLeave;
		this.dailyStaffVisit = dailyStaffVisit;
		this.dailyAssetDuty = dailyAssetDuty;
		this.dailyAssetBook = dailyAssetBook;
		this.dailyAssetConform = dailyAssetConform;
		this.dailyAssetMaintain = dailyAssetMaintain;
		this.dailyEpibolyAggrement = dailyEpibolyAggrement;
		this.dailyEpibolyService = dailyEpibolyService;
		this.dailyEpibolyDevelop = dailyEpibolyDevelop;
		this.dailyEpibolyMaintain = dailyEpibolyMaintain;
		this.dailyFundsBudget = dailyFundsBudget;
		this.dailySitePublish = dailySitePublish;
		this.dailyInfoDestory = dailyInfoDestory;
		this.shieldPhysicalRoom = shieldPhysicalRoom;
		this.shieldPhysicalVisit = shieldPhysicalVisit;
		this.shieldNetVisit = shieldNetVisit;
		this.shieldNetInvade = shieldNetInvade;
		this.shieldNetAudit = shieldNetAudit;
		this.shieldNetPoint = shieldNetPoint;
		this.shieldDeviceBadcode = shieldDeviceBadcode;
		this.shieldDeviceLeak = shieldDeviceLeak;
		this.shieldDevicePasswd = shieldDevicePasswd;
		this.shieldDeviceAudit = shieldDeviceAudit;
		this.shieldDevicePatch = shieldDevicePatch;
		this.shieldDeviceNetPwd = shieldDeviceNetPwd;
		this.shieldDeviceProtect = shieldDeviceProtect;
		this.shieldDeviceControl = shieldDeviceControl;
		this.shieldAppLeak = shieldAppLeak;
		this.shieldAppAntitamper = shieldAppAntitamper;
		this.shieldAppAntiattack = shieldAppAntiattack;
		this.shieldAppEmailRegister = shieldAppEmailRegister;
		this.shieldAppEmailPasswd = shieldAppEmailPasswd;
		this.shieldAppEmailClear = shieldAppEmailClear;
		this.shieldDataStore = shieldDataStore;
		this.shieldDataTransfer = shieldDataTransfer;
		this.shieldDataBackup = shieldDataBackup;
		this.shieldDataCenter = shieldDataCenter;
		this.emergencyPlan = emergencyPlan;
		this.emergencyTrain = emergencyTrain;
		this.emergencyResource = emergencyResource;
		this.emergencyEventHandle = emergencyEventHandle;
		this.educationMentality = educationMentality;
		this.educationTrain = educationTrain;
		this.checkWorkDeploy = checkWorkDeploy;
		this.checkWorkRule = checkWorkRule;
		this.checkTechnicalDetecton = checkTechnicalDetecton;
		this.checkFunds = checkFunds;
		this.year = year;
		this.compose = compose;
		this.lunchSituation = lunchSituation;
		this.workSituation = workSituation;
		this.problem = problem;
		this.risk = risk;
		this.judge = judge;
		this.improveMeasure = improveMeasure;
		this.overallEffect = overallEffect;
		this.summarySuggestion = summarySuggestion;
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
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_security_check",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "COMPANY", nullable = false, length = 50)
	public String getCompany() {
		return this.company;
	}

	public void setCompany(String company) {
		this.company = company;
	}
	
	@Column(name = "COMPANY_ID", nullable = false, length = 10)
	public String getCompanyId() {
		return this.companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
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

	@Column(name = "OFFICE_NAME", length = 100)
	public String getOfficeName() {
		return this.officeName;
	}

	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}

	@Column(name = "OFFICE_LEADER", length = 50)
	public String getOfficeLeader() {
		return this.officeLeader;
	}

	public void setOfficeLeader(String officeLeader) {
		this.officeLeader = officeLeader;
	}

	@Column(name = "OFFICE_LEADER_POST", length = 50)
	public String getOfficeLeaderPost() {
		return this.officeLeaderPost;
	}

	public void setOfficeLeaderPost(String officeLeaderPost) {
		this.officeLeaderPost = officeLeaderPost;
	}

	@Column(name = "OFFICE_LINKMAN", length = 50)
	public String getOfficeLinkman() {
		return this.officeLinkman;
	}

	public void setOfficeLinkman(String officeLinkman) {
		this.officeLinkman = officeLinkman;
	}

	@Column(name = "OFFICE_PHONE", length = 50)
	public String getOfficePhone() {
		return this.officePhone;
	}

	public void setOfficePhone(String officePhone) {
		this.officePhone = officePhone;
	}

	@Column(name = "OFFICE_MOBILE", length = 50)
	public String getOfficeMobile() {
		return this.officeMobile;
	}

	public void setOfficeMobile(String officeMobile) {
		this.officeMobile = officeMobile;
	}

	@Column(name = "JOB_OFFICE_NAME", length = 100)
	public String getJobOfficeName() {
		return this.jobOfficeName;
	}

	public void setJobOfficeName(String jobOfficeName) {
		this.jobOfficeName = jobOfficeName;
	}

	@Column(name = "JOB_OFFICE_LEADER", length = 50)
	public String getJobOfficeLeader() {
		return this.jobOfficeLeader;
	}

	public void setJobOfficeLeader(String jobOfficeLeader) {
		this.jobOfficeLeader = jobOfficeLeader;
	}

	@Column(name = "JOB_OFFICE_PHONE", length = 50)
	public String getJobOfficePhone() {
		return this.jobOfficePhone;
	}

	public void setJobOfficePhone(String jobOfficePhone) {
		this.jobOfficePhone = jobOfficePhone;
	}

	@Column(name = "JOB_OFFICE_MOBILE", length = 50)
	public String getJobOfficeMobile() {
		return this.jobOfficeMobile;
	}

	public void setJobOfficeMobile(String jobOfficeMobile) {
		this.jobOfficeMobile = jobOfficeMobile;
	}

	@Column(name = "INFO_SYS_SUMMARY", length = 200)
	public String getInfoSysSummary() {
		return this.infoSysSummary;
	}

	public void setInfoSysSummary(String infoSysSummary) {
		this.infoSysSummary = infoSysSummary;
	}

	@Column(name = "INTERNET_ACCESS", length = 200)
	public String getInternetAccess() {
		return this.internetAccess;
	}

	public void setInternetAccess(String internetAccess) {
		this.internetAccess = internetAccess;
	}

	@Column(name = "SYS_LEVEL", length = 200)
	public String getSysLevel() {
		return this.sysLevel;
	}

	public void setSysLevel(String sysLevel) {
		this.sysLevel = sysLevel;
	}

	@Column(name = "STAFF_RESPONSIBILITY_SYS", length = 50)
//	@Enumerated(EnumType.STRING)	
	public String getStaffResponsibilitySys() {
		return this.staffResponsibilitySys;
	}

	public void setStaffResponsibilitySys(String staffResponsibilitySys) {
		this.staffResponsibilitySys = staffResponsibilitySys;
	}

	@Column(name = "STAFF_SECRECY_AGREEMENT", length = 50)
	public String getStaffSecrecyAgreement() {
		return this.staffSecrecyAgreement;
	}

	public void setStaffSecrecyAgreement(String staffSecrecyAgreement) {
		this.staffSecrecyAgreement = staffSecrecyAgreement;
	}

	@Column(name = "STAFF_LEAVE_RULE", length = 50)
//	@Enumerated(EnumType.STRING)	
	public String getStaffLeaveRule() {
		return this.staffLeaveRule;
	}

	public void setStaffLeaveRule(String staffLeaveRule) {
		this.staffLeaveRule = staffLeaveRule;
	}

	@Column(name = "STAFF_VISIT_AUDIT", length = 50)
//	@Enumerated(EnumType.STRING)	
	public String getStaffVisitAudit() {
		return this.staffVisitAudit;
	}

	public void setStaffVisitAudit(String staffVisitAudit) {
		this.staffVisitAudit = staffVisitAudit;
	}

	@Column(name = "ASSET_MANAGE_SYSTEM", length = 50)
//	@Enumerated(EnumType.STRING)	
	public String getAssetManageSystem() {
		return this.assetManageSystem;
	}

	public void setAssetManageSystem(String assetManageSystem) {
		this.assetManageSystem = assetManageSystem;
	}

	@Column(name = "ASSET_DEVICE_MAINTAIN", length = 50)
	public String getAssetDeviceMaintain() {
		return this.assetDeviceMaintain;
	}

	public void setAssetDeviceMaintain(String assetDeviceMaintain) {
		this.assetDeviceMaintain = assetDeviceMaintain;
	}

	@Column(name = "NET_PROTECT_DEVICE", length = 200)
	public String getNetProtectDevice() {
		return this.netProtectDevice;
	}

	public void setNetProtectDevice(String netProtectDevice) {
		this.netProtectDevice = netProtectDevice;
	}

	@Column(name = "NET_PROTECT_DEVICE_OTHER", length = 200)
	public String getNetProtectDeviceOther() {
		return this.netProtectDeviceOther;
	}

	public void setNetProtectDeviceOther(String netProtectDeviceOther) {
		this.netProtectDeviceOther = netProtectDeviceOther;
	}

	@Column(name = "NET_SAFESTRATEGY_CONFIG", length = 50)
	public String getNetSafestrategyConfig() {
		return this.netSafestrategyConfig;
	}

	public void setNetSafestrategyConfig(String netSafestrategyConfig) {
		this.netSafestrategyConfig = netSafestrategyConfig;
	}

	@Column(name = "NET_VISIT_LOG", length = 50)
	public String getNetVisitLog() {
		return this.netVisitLog;
	}

	public void setNetVisitLog(String netVisitLog) {
		this.netVisitLog = netVisitLog;
	}

	@Column(name = "NET_CLOUD_DEVICE", length = 50)
	public String getNetCloudDevice() {
		return this.netCloudDevice;
	}

	public void setNetCloudDevice(String netCloudDevice) {
		this.netCloudDevice = netCloudDevice;
	}

	@Column(name = "NET_EPIBOLY_DATA_COMMIT", length = 50)
	public String getNetEpibolyDataCommit() {
		return this.netEpibolyDataCommit;
	}

	public void setNetEpibolyDataCommit(String netEpibolyDataCommit) {
		this.netEpibolyDataCommit = netEpibolyDataCommit;
	}

	@Column(name = "NET_REMOTE_CONTROL", length = 50)
	public String getNetRemoteControl() {
		return this.netRemoteControl;
	}

	public void setNetRemoteControl(String netRemoteControl) {
		this.netRemoteControl = netRemoteControl;
	}

	@Column(name = "NET_REMOTE_CONTROL_SYS", length = 200)
	public String getNetRemoteControlSys() {
		return this.netRemoteControlSys;
	}

	public void setNetRemoteControlSys(String netRemoteControlSys) {
		this.netRemoteControlSys = netRemoteControlSys;
	}

	@Column(name = "ROUTER_COUNT", precision = 22, scale = 0)
	public Integer getRouterCount() {
		return this.routerCount;
	}

	public void setRouterCount(Integer routerCount) {
		this.routerCount = routerCount;
	}

	@Column(name = "ROUTER_USE", length = 200)
	public String getRouterUse() {
		return this.routerUse;
	}

	public void setRouterUse(String routerUse) {
		this.routerUse = routerUse;
	}

	@Column(name = "SECURITY_DEFENSE", length = 50)
	public String getSecurityDefense() {
		return this.securityDefense;
	}

	public void setSecurityDefense(String securityDefense) {
		this.securityDefense = securityDefense;
	}

	@Column(name = "ROUTER_DFAULT_ADDRESS", length = 50)
//	@Enumerated(EnumType.STRING)
	public String getRouterDfaultAddress() {
		return this.routerDfaultAddress;
	}

	public void setRouterDfaultAddress(String routerDfaultAddress) {
		this.routerDfaultAddress = routerDfaultAddress;
	}

	@Column(name = "ROUTER_DFAULT_PWD", length = 50)
//	@Enumerated(EnumType.STRING)
	public String getRouterDfaultPwd() {
		return this.routerDfaultPwd;
	}

	public void setRouterDfaultPwd(String routerDfaultPwd) {
		this.routerDfaultPwd = routerDfaultPwd;
	}

	@Column(name = "SITE_DOMAIN", length = 100)
	public String getSiteDomain() {
		return this.siteDomain;
	}

	public void setSiteDomain(String siteDomain) {
		this.siteDomain = siteDomain;
	}

	@Column(name = "SITE_IP", length = 50)
	public String getSiteIp() {
		return this.siteIp;
	}

	public void setSiteIp(String siteIp) {
		this.siteIp = siteIp;
	}

	@Column(name = "SITE_PAGE_ANTITAMPER", length = 50)
//	@Enumerated(EnumType.STRING)
	public String getSitePageAntitamper() {
		return this.sitePageAntitamper;
	}

	public void setSitePageAntitamper(String sitePageAntitamper) {
		this.sitePageAntitamper = sitePageAntitamper;
	}
	
	@Column(name = "SITE_LEAK_SCAN_PERIOD", length = 50)
	public String getSiteLeakScanPeriod() {
		return this.siteLeakScanPeriod;
	}

	public void setSiteLeakScanPeriod(String siteLeakScanPeriod) {
		this.siteLeakScanPeriod = siteLeakScanPeriod;
	}

	@Column(name = "SITE_LEAK_SCAN", length = 50)
	public String getSiteLeakScan() {
		return this.siteLeakScan;
	}

	public void setSiteLeakScan(String siteLeakScan) {
		this.siteLeakScan = siteLeakScan;
	}

	@Column(name = "SITE_PUBLISH", length = 50)
	public String getSitePublish() {
		return this.sitePublish;
	}

	public void setSitePublish(String sitePublish) {
		this.sitePublish = sitePublish;
	}

	@Column(name = "SITE_MAINTAIN", length = 50)
	public String getSiteMaintain() {
		return this.siteMaintain;
	}

	public void setSiteMaintain(String siteMaintain) {
		this.siteMaintain = siteMaintain;
	}

	@Column(name = "EMAIL_BUILD", length = 50)
	public String getEmailBuild() {
		return this.emailBuild;
	}

	public void setEmailBuild(String emailBuild) {
		this.emailBuild = emailBuild;
	}

	@Column(name = "EMAIL_SUPPLIER", length = 200)
	public String getEmailSupplier() {
		return this.emailSupplier;
	}

	public void setEmailSupplier(String emailSupplier) {
		this.emailSupplier = emailSupplier;
	}

	@Column(name = "EMAIL_ACCOUNT", precision = 22, scale = 0)
	public Integer getEmailAccount() {
		return this.emailAccount;
	}

	public void setEmailAccount(Integer emailAccount) {
		this.emailAccount = emailAccount;
	}

	@Column(name = "EMAIL_REGISTER", length = 50)
	public String getEmailRegister() {
		return this.emailRegister;
	}

	public void setEmailRegister(String emailRegister) {
		this.emailRegister = emailRegister;
	}

	@Column(name = "EMAIL_PWD", length = 50)
	public String getEmailPwd() {
		return this.emailPwd;
	}

	public void setEmailPwd(String emailPwd) {
		this.emailPwd = emailPwd;
	}

	@Column(name = "EMAIL_PROTECT", length = 50)
	public String getEmailProtect() {
		return this.emailProtect;
	}

	public void setEmailProtect(String emailProtect) {
		this.emailProtect = emailProtect;
	}

	@Column(name = "EMAIL_PROTECT_OTHER", length = 100)
	public String getEmailProtectOther() {
		return this.emailProtectOther;
	}

	public void setEmailProtectOther(String emailProtectOther) {
		this.emailProtectOther = emailProtectOther;
	}

	@Column(name = "TERMINAL_MANAGE", length = 100)
	public String getTerminalManage() {
		return this.terminalManage;
	}

	public void setTerminalManage(String terminalManage) {
		this.terminalManage = terminalManage;
	}

	@Column(name = "TERMINAL_UNIFIED_MANAGE", length = 100)
	public String getTerminalUnifiedManage() {
		return this.terminalUnifiedManage;
	}

	public void setTerminalUnifiedManage(String terminalUnifiedManage) {
		this.terminalUnifiedManage = terminalUnifiedManage;
	}
	
	@Column(name = "TERMINAL_LINK_INTERNET", length = 50)
	public String getTerminalLinkInternet() {
		return this.terminalLinkInternet;
	}

	public void setTerminalLinkInternet(String terminalLinkInternet) {
		this.terminalLinkInternet = terminalLinkInternet;
	}

	@Column(name = "TERMINAL_LINK_OA", length = 50)
	public String getTerminalLinkOa() {
		return this.terminalLinkOa;
	}

	public void setTerminalLinkOa(String terminalLinkOa) {
		this.terminalLinkOa = terminalLinkOa;
	}

	@Column(name = "STORAGE_MANAGE", length = 50)
	public String getStorageManage() {
		return this.storageManage;
	}

	public void setStorageManage(String storageManage) {
		this.storageManage = storageManage;
	}

	@Column(name = "STORAGE_DESTORY", length = 50)
	public String getStorageDestory() {
		return this.storageDestory;
	}

	public void setStorageDestory(String storageDestory) {
		this.storageDestory = storageDestory;
	}

	@Column(name = "EMERGENCY_PLAN_JOB", length = 50)
//	@Enumerated(EnumType.STRING)
	public String getEmergencyPlanJob() {
		return this.emergencyPlanJob;
	}

	public void setEmergencyPlanJob(String emergencyPlanJob) {
		this.emergencyPlanJob = emergencyPlanJob;
	}
	
	@Column(name = "EMERGENCY_PLAN_EDIT", length = 50)
//	@Enumerated(EnumType.STRING)	
	public String getEmergencyPlanEdit() {
		return emergencyPlanEdit;
	}
	
	public void setEmergencyPlanEdit(String emergencyPlanEdit) {
		this.emergencyPlanEdit = emergencyPlanEdit;
	}
	@Column(name = "EMERGENCY_TRAIN_JOB", length = 50)
	public String getEmergencyTrainJob() {
		return this.emergencyTrainJob;
	}

	public void setEmergencyTrainJob(String emergencyTrainJob) {
		this.emergencyTrainJob = emergencyTrainJob;
	}
		
	@Column(name = "EMERGENCY_TRAIN_TIME", length = 50)
	public String getEmergencyTrainTime() {
		return emergencyTrainTime;
	}

	public void setEmergencyTrainTime(String emergencyTrainTime) {
		this.emergencyTrainTime = emergencyTrainTime;
	}

	@Column(name = "EMERGENCY_DATABACK", length = 50)
	public String getEmergencyDataback() {
		return this.emergencyDataback;
	}

	public void setEmergencyDataback(String emergencyDataback) {
		this.emergencyDataback = emergencyDataback;
	}
	
	@Column(name = "EMERGENCY_DATABACK_PERIOD", length = 50)
	public String getEmergencyDatabackPeriod() {
		return emergencyDatabackPeriod;
	}

	public void setEmergencyDatabackPeriod(String emergencyDatabackPeriod) {
		this.emergencyDatabackPeriod = emergencyDatabackPeriod;
	}
	
	
	@Column(name = "EMERGENCY_SYSBACK", precision = 22, scale = 0)
	public Integer getEmergencySysback() {
		return this.emergencySysback;
	}

	public void setEmergencySysback(Integer emergencySysback) {
		this.emergencySysback = emergencySysback;
	}

	@Column(name = "EMERGENCY_NO_SYSBACK", precision = 22, scale = 0)
	public Integer getEmergencyNoSysback() {
		return this.emergencyNoSysback;
	}

	public void setEmergencyNoSysback(Integer emergencyNoSysback) {
		this.emergencyNoSysback = emergencyNoSysback;
	}

	@Column(name = "EMERGENCY_TECHNICAL_TEAM", length = 50)
	public String getEmergencyTechnicalTeam() {
		return this.emergencyTechnicalTeam;
	}

	public void setEmergencyTechnicalTeam(String emergencyTechnicalTeam) {
		this.emergencyTechnicalTeam = emergencyTechnicalTeam;
	}

	@Column(name = "EDUCATION_TRAIN_NUM", precision = 22, scale = 0)
	public Integer getEducationTrainNum() {
		return this.educationTrainNum;
	}

	public void setEducationTrainNum(Integer educationTrainNum) {
		this.educationTrainNum = educationTrainNum;
	}

	@Column(name = "EDUCATION_TRAIN_STAFF", precision = 22, scale = 0)
	public Integer getEducationTrainStaff() {
		return this.educationTrainStaff;
	}

	public void setEducationTrainStaff(Integer educationTrainStaff) {
		this.educationTrainStaff = educationTrainStaff;
	}

	@Column(name = "EDUCATION_TRAIN_PERCENT", length = 10)
	public String getEducationTrainPercent() {
		return this.educationTrainPercent;
	}

	public void setEducationTrainPercent(String educationTrainPercent) {
		this.educationTrainPercent = educationTrainPercent;
	}

	@Column(name = "PRODUCT_SERVER", length = 200)
	public String getProductServer() {
		return this.productServer;
	}

	public void setProductServer(String productServer) {
		this.productServer = productServer;
	}

	@Column(name = "PRODUCT_TERMINAL", length = 2000)
	public String getProductTerminal() {
		return this.productTerminal;
	}

	public void setProductTerminal(String productTerminal) {
		this.productTerminal = productTerminal;
	}

	@Column(name = "PRODUCT_ROUTER", length = 200)
	public String getProductRouter() {
		return this.productRouter;
	}

	public void setProductRouter(String productRouter) {
		this.productRouter = productRouter;
	}

	@Column(name = "PRODUCT_SWITCH", length = 200)
	public String getProductSwitch() {
		return this.productSwitch;
	}

	public void setProductSwitch(String productSwitch) {
		this.productSwitch = productSwitch;
	}

	@Column(name = "PRODUCT_STORAGE", length = 200)
	public String getProductStorage() {
		return this.productStorage;
	}

	public void setProductStorage(String productStorage) {
		this.productStorage = productStorage;
	}

	@Column(name = "PRODUCT_DB", length = 200)
	public String getProductDb() {
		return this.productDb;
	}

	public void setProductDb(String productDb) {
		this.productDb = productDb;
	}

	@Column(name = "PRODUCT_EMAIL", length = 2000)
	public String getProductEmail() {
		return this.productEmail;
	}

	public void setProductEmail(String productEmail) {
		this.productEmail = productEmail;
	}

	@Column(name = "PRODUCT_LB", length = 2000)
	public String getProductLb() {
		return this.productLb;
	}

	public void setProductLb(String productLb) {
		this.productLb = productLb;
	}

	@Column(name = "PRODUCT_FIREWALL", length = 2000)
	public String getProductFirewall() {
		return this.productFirewall;
	}

	public void setProductFirewall(String productFirewall) {
		this.productFirewall = productFirewall;
	}

	@Column(name = "PRODUCT_INVADE_CHECK", length = 2000)
	public String getProductInvadeCheck() {
		return this.productInvadeCheck;
	}

	public void setProductInvadeCheck(String productInvadeCheck) {
		this.productInvadeCheck = productInvadeCheck;
	}

	@Column(name = "PRODUCT_SECURITY_AUDIT", length = 2000)
	public String getProductSecurityAudit() {
		return this.productSecurityAudit;
	}

	public void setProductSecurityAudit(String productSecurityAudit) {
		this.productSecurityAudit = productSecurityAudit;
	}

	@Column(name = "FUNDS_BUDGET", length = 20)
	public String getFundsBudget() {
		return this.fundsBudget;
	}

	public void setFundsBudget(String fundsBudget) {
		this.fundsBudget = fundsBudget;
	}

	@Column(name = "FUNDS_USED", length = 20)
	public String getFundsUsed() {
		return this.fundsUsed;
	}

	public void setFundsUsed(String fundsUsed) {
		this.fundsUsed = fundsUsed;
	}

	@Column(name = "CHECK_SEEP_TEST", length = 100)
	public String getCheckSeepTest() {
		return this.checkSeepTest;
	}

	public void setCheckSeepTest(String checkSeepTest) {
		this.checkSeepTest = checkSeepTest;
	}

	@Column(name = "CHECK_BADCODE_TEST", length = 200)
	public String getCheckBadcodeTest() {
		return this.checkBadcodeTest;
	}

	public void setCheckBadcodeTest(String checkBadcodeTest) {
		this.checkBadcodeTest = checkBadcodeTest;
	}

	@Column(name = "CHECK_LEAK_TEST", length = 200)
	public String getCheckLeakTest() {
		return this.checkLeakTest;
	}

	public void setCheckLeakTest(String checkLeakTest) {
		this.checkLeakTest = checkLeakTest;
	}

	@Column(name = "EVENT_ATTACK_NUM", precision = 22, scale = 0)
	public Integer getEventAttackNum() {
		return this.eventAttackNum;
	}

	public void setEventAttackNum(Integer eventAttackNum) {
		this.eventAttackNum = eventAttackNum;
	}

	@Column(name = "EVENT_TAMPER_NUM", precision = 22, scale = 0)
	public Integer getEventTamperNum() {
		return this.eventTamperNum;
	}

	public void setEventTamperNum(Integer eventTamperNum) {
		this.eventTamperNum = eventTamperNum;
	}
	
	@Column(name = "EPIBOLY_ORGAN", length=3000)
	public String getEpibolyOrgan() {
		return this.epibolyOrgan;
	}

	public void setEpibolyOrgan(String epibolyOrgan) {
		this.epibolyOrgan = epibolyOrgan;
	}
	
	@Column(name = "ORGAN_LEADER", length = 50)
	public String getOrganLeader() {
		return this.organLeader;
	}

	public void setOrganLeader(String organLeader) {
		this.organLeader = organLeader;
	}

	@Column(name = "ORGAN_MANAGE", length = 50)
	public String getOrganManage() {
		return this.organManage;
	}

	public void setOrganManage(String organManage) {
		this.organManage = organManage;
	}

	@Column(name = "ORGAN_GUARD", length = 50)
	public String getOrganGuard() {
		return this.organGuard;
	}

	public void setOrganGuard(String organGuard) {
		this.organGuard = organGuard;
	}

	@Column(name = "DAILY_RULE_INTEGRITY", length = 50)
	public String getDailyRuleIntegrity() {
		return this.dailyRuleIntegrity;
	}

	public void setDailyRuleIntegrity(String dailyRuleIntegrity) {
		this.dailyRuleIntegrity = dailyRuleIntegrity;
	}

	@Column(name = "DAILY_RULE_PUBLISH", length = 50)
	public String getDailyRulePublish() {
		return this.dailyRulePublish;
	}

	public void setDailyRulePublish(String dailyRulePublish) {
		this.dailyRulePublish = dailyRulePublish;
	}

	@Column(name = "DAILY_STAFF_KEY", length = 50)
	public String getDailyStaffKey() {
		return this.dailyStaffKey;
	}

	public void setDailyStaffKey(String dailyStaffKey) {
		this.dailyStaffKey = dailyStaffKey;
	}

	@Column(name = "DAILY_STAFF_LEAVE", length = 50)
	public String getDailyStaffLeave() {
		return this.dailyStaffLeave;
	}

	public void setDailyStaffLeave(String dailyStaffLeave) {
		this.dailyStaffLeave = dailyStaffLeave;
	}

	@Column(name = "DAILY_STAFF_VISIT", length = 50)
	public String getDailyStaffVisit() {
		return this.dailyStaffVisit;
	}

	public void setDailyStaffVisit(String dailyStaffVisit) {
		this.dailyStaffVisit = dailyStaffVisit;
	}

	@Column(name = "DAILY_ASSET_DUTY", length = 50)
	public String getDailyAssetDuty() {
		return this.dailyAssetDuty;
	}

	public void setDailyAssetDuty(String dailyAssetDuty) {
		this.dailyAssetDuty = dailyAssetDuty;
	}

	@Column(name = "DAILY_ASSET_BOOK", length = 50)
	public String getDailyAssetBook() {
		return this.dailyAssetBook;
	}

	public void setDailyAssetBook(String dailyAssetBook) {
		this.dailyAssetBook = dailyAssetBook;
	}

	@Column(name = "DAILY_ASSET_CONFORM", length = 50)
	public String getDailyAssetConform() {
		return this.dailyAssetConform;
	}

	public void setDailyAssetConform(String dailyAssetConform) {
		this.dailyAssetConform = dailyAssetConform;
	}

	@Column(name = "DAILY_ASSET_MAINTAIN", length = 50)
	public String getDailyAssetMaintain() {
		return this.dailyAssetMaintain;
	}

	public void setDailyAssetMaintain(String dailyAssetMaintain) {
		this.dailyAssetMaintain = dailyAssetMaintain;
	}

	@Column(name = "DAILY_EPIBOLY_AGGREMENT", length = 50)
	public String getDailyEpibolyAggrement() {
		return this.dailyEpibolyAggrement;
	}

	public void setDailyEpibolyAggrement(String dailyEpibolyAggrement) {
		this.dailyEpibolyAggrement = dailyEpibolyAggrement;
	}

	@Column(name = "DAILY_EPIBOLY_SERVICE", length = 50)
	public String getDailyEpibolyService() {
		return this.dailyEpibolyService;
	}

	public void setDailyEpibolyService(String dailyEpibolyService) {
		this.dailyEpibolyService = dailyEpibolyService;
	}

	@Column(name = "DAILY_EPIBOLY_DEVELOP", length = 50)
	public String getDailyEpibolyDevelop() {
		return this.dailyEpibolyDevelop;
	}

	public void setDailyEpibolyDevelop(String dailyEpibolyDevelop) {
		this.dailyEpibolyDevelop = dailyEpibolyDevelop;
	}

	@Column(name = "DAILY_EPIBOLY_MAINTAIN", length = 50)
	public String getDailyEpibolyMaintain() {
		return this.dailyEpibolyMaintain;
	}

	public void setDailyEpibolyMaintain(String dailyEpibolyMaintain) {
		this.dailyEpibolyMaintain = dailyEpibolyMaintain;
	}

	@Column(name = "DAILY_FUNDS_BUDGET", length = 50)
	public String getDailyFundsBudget() {
		return this.dailyFundsBudget;
	}

	public void setDailyFundsBudget(String dailyFundsBudget) {
		this.dailyFundsBudget = dailyFundsBudget;
	}

	@Column(name = "DAILY_SITE_PUBLISH", length = 50)
	public String getDailySitePublish() {
		return this.dailySitePublish;
	}

	public void setDailySitePublish(String dailySitePublish) {
		this.dailySitePublish = dailySitePublish;
	}

	@Column(name = "DAILY_INFO_DESTORY", length = 50)
	public String getDailyInfoDestory() {
		return this.dailyInfoDestory;
	}

	public void setDailyInfoDestory(String dailyInfoDestory) {
		this.dailyInfoDestory = dailyInfoDestory;
	}

	@Column(name = "SHIELD_PHYSICAL_ROOM", length = 50)
	public String getShieldPhysicalRoom() {
		return this.shieldPhysicalRoom;
	}

	public void setShieldPhysicalRoom(String shieldPhysicalRoom) {
		this.shieldPhysicalRoom = shieldPhysicalRoom;
	}

	@Column(name = "SHIELD_PHYSICAL_VISIT", length = 50)
	public String getShieldPhysicalVisit() {
		return this.shieldPhysicalVisit;
	}

	public void setShieldPhysicalVisit(String shieldPhysicalVisit) {
		this.shieldPhysicalVisit = shieldPhysicalVisit;
	}

	@Column(name = "SHIELD_NET_VISIT", length = 50)
	public String getShieldNetVisit() {
		return this.shieldNetVisit;
	}

	public void setShieldNetVisit(String shieldNetVisit) {
		this.shieldNetVisit = shieldNetVisit;
	}

	@Column(name = "SHIELD_NET_INVADE", length = 50)
	public String getShieldNetInvade() {
		return this.shieldNetInvade;
	}

	public void setShieldNetInvade(String shieldNetInvade) {
		this.shieldNetInvade = shieldNetInvade;
	}

	@Column(name = "SHIELD_NET_AUDIT", length = 50)
	public String getShieldNetAudit() {
		return this.shieldNetAudit;
	}

	public void setShieldNetAudit(String shieldNetAudit) {
		this.shieldNetAudit = shieldNetAudit;
	}

	@Column(name = "SHIELD_NET_POINT", length = 50)
	public String getShieldNetPoint() {
		return this.shieldNetPoint;
	}

	public void setShieldNetPoint(String shieldNetPoint) {
		this.shieldNetPoint = shieldNetPoint;
	}

	@Column(name = "SHIELD_DEVICE_BADCODE", length = 50)
	public String getShieldDeviceBadcode() {
		return this.shieldDeviceBadcode;
	}

	public void setShieldDeviceBadcode(String shieldDeviceBadcode) {
		this.shieldDeviceBadcode = shieldDeviceBadcode;
	}

	@Column(name = "SHIELD_DEVICE_LEAK", length = 50)
	public String getShieldDeviceLeak() {
		return this.shieldDeviceLeak;
	}

	public void setShieldDeviceLeak(String shieldDeviceLeak) {
		this.shieldDeviceLeak = shieldDeviceLeak;
	}

	@Column(name = "SHIELD_DEVICE_PASSWD", length = 50)
	public String getShieldDevicePasswd() {
		return this.shieldDevicePasswd;
	}

	public void setShieldDevicePasswd(String shieldDevicePasswd) {
		this.shieldDevicePasswd = shieldDevicePasswd;
	}

	@Column(name = "SHIELD_DEVICE_AUDIT", length = 50)
	public String getShieldDeviceAudit() {
		return this.shieldDeviceAudit;
	}

	public void setShieldDeviceAudit(String shieldDeviceAudit) {
		this.shieldDeviceAudit = shieldDeviceAudit;
	}

	@Column(name = "SHIELD_DEVICE_PATCH", length = 50)
	public String getShieldDevicePatch() {
		return this.shieldDevicePatch;
	}

	public void setShieldDevicePatch(String shieldDevicePatch) {
		this.shieldDevicePatch = shieldDevicePatch;
	}

	@Column(name = "SHIELD_DEVICE_NET_PWD", length = 50)
	public String getShieldDeviceNetPwd() {
		return this.shieldDeviceNetPwd;
	}

	public void setShieldDeviceNetPwd(String shieldDeviceNetPwd) {
		this.shieldDeviceNetPwd = shieldDeviceNetPwd;
	}

	@Column(name = "SHIELD_DEVICE_PROTECT", length = 50)
	public String getShieldDeviceProtect() {
		return this.shieldDeviceProtect;
	}

	public void setShieldDeviceProtect(String shieldDeviceProtect) {
		this.shieldDeviceProtect = shieldDeviceProtect;
	}

	@Column(name = "SHIELD_DEVICE_CONTROL", length = 50)
	public String getShieldDeviceControl() {
		return this.shieldDeviceControl;
	}

	public void setShieldDeviceControl(String shieldDeviceControl) {
		this.shieldDeviceControl = shieldDeviceControl;
	}

	@Column(name = "SHIELD_APP_LEAK", length = 50)
	public String getShieldAppLeak() {
		return this.shieldAppLeak;
	}

	public void setShieldAppLeak(String shieldAppLeak) {
		this.shieldAppLeak = shieldAppLeak;
	}

	@Column(name = "SHIELD_APP_ANTITAMPER", length = 50)
	public String getShieldAppAntitamper() {
		return this.shieldAppAntitamper;
	}

	public void setShieldAppAntitamper(String shieldAppAntitamper) {
		this.shieldAppAntitamper = shieldAppAntitamper;
	}

	@Column(name = "SHIELD_APP_ANTIATTACK", length = 50)
	public String getShieldAppAntiattack() {
		return this.shieldAppAntiattack;
	}

	public void setShieldAppAntiattack(String shieldAppAntiattack) {
		this.shieldAppAntiattack = shieldAppAntiattack;
	}

	@Column(name = "SHIELD_APP_EMAIL_REGISTER", length = 50)
	public String getShieldAppEmailRegister() {
		return this.shieldAppEmailRegister;
	}

	public void setShieldAppEmailRegister(String shieldAppEmailRegister) {
		this.shieldAppEmailRegister = shieldAppEmailRegister;
	}

	@Column(name = "SHIELD_APP_EMAIL_PASSWD", length = 50)
	public String getShieldAppEmailPasswd() {
		return this.shieldAppEmailPasswd;
	}

	public void setShieldAppEmailPasswd(String shieldAppEmailPasswd) {
		this.shieldAppEmailPasswd = shieldAppEmailPasswd;
	}

	@Column(name = "SHIELD_APP_EMAIL_CLEAR", length = 50)
	public String getShieldAppEmailClear() {
		return this.shieldAppEmailClear;
	}

	public void setShieldAppEmailClear(String shieldAppEmailClear) {
		this.shieldAppEmailClear = shieldAppEmailClear;
	}

	@Column(name = "SHIELD_DATA_STORE", length = 50)
	public String getShieldDataStore() {
		return this.shieldDataStore;
	}

	public void setShieldDataStore(String shieldDataStore) {
		this.shieldDataStore = shieldDataStore;
	}

	@Column(name = "SHIELD_DATA_TRANSFER", length = 50)
	public String getShieldDataTransfer() {
		return this.shieldDataTransfer;
	}

	public void setShieldDataTransfer(String shieldDataTransfer) {
		this.shieldDataTransfer = shieldDataTransfer;
	}

	@Column(name = "SHIELD_DATA_BACKUP", length = 50)
	public String getShieldDataBackup() {
		return this.shieldDataBackup;
	}

	public void setShieldDataBackup(String shieldDataBackup) {
		this.shieldDataBackup = shieldDataBackup;
	}

	@Column(name = "SHIELD_DATA_CENTER", length = 50)
	public String getShieldDataCenter() {
		return this.shieldDataCenter;
	}

	public void setShieldDataCenter(String shieldDataCenter) {
		this.shieldDataCenter = shieldDataCenter;
	}

	@Column(name = "EMERGENCY_PLAN", length = 50)
	public String getEmergencyPlan() {
		return this.emergencyPlan;
	}

	public void setEmergencyPlan(String emergencyPlan) {
		this.emergencyPlan = emergencyPlan;
	}

	@Column(name = "EMERGENCY_TRAIN", length = 50)
	public String getEmergencyTrain() {
		return this.emergencyTrain;
	}

	public void setEmergencyTrain(String emergencyTrain) {
		this.emergencyTrain = emergencyTrain;
	}

	@Column(name = "EMERGENCY_RESOURCE", length = 50)
	public String getEmergencyResource() {
		return this.emergencyResource;
	}

	public void setEmergencyResource(String emergencyResource) {
		this.emergencyResource = emergencyResource;
	}

	@Column(name = "EMERGENCY_EVENT_HANDLE", length = 50)
	public String getEmergencyEventHandle() {
		return this.emergencyEventHandle;
	}

	public void setEmergencyEventHandle(String emergencyEventHandle) {
		this.emergencyEventHandle = emergencyEventHandle;
	}

	@Column(name = "EDUCATION_MENTALITY", length = 50)
	public String getEducationMentality() {
		return this.educationMentality;
	}

	public void setEducationMentality(String educationMentality) {
		this.educationMentality = educationMentality;
	}

	@Column(name = "EDUCATION_TRAIN", length = 50)
	public String getEducationTrain() {
		return this.educationTrain;
	}

	public void setEducationTrain(String educationTrain) {
		this.educationTrain = educationTrain;
	}

	@Column(name = "CHECK_WORK_DEPLOY", length = 50)
	public String getCheckWorkDeploy() {
		return this.checkWorkDeploy;
	}

	public void setCheckWorkDeploy(String checkWorkDeploy) {
		this.checkWorkDeploy = checkWorkDeploy;
	}

	@Column(name = "CHECK_WORK_RULE", length = 50)
	public String getCheckWorkRule() {
		return this.checkWorkRule;
	}

	public void setCheckWorkRule(String checkWorkRule) {
		this.checkWorkRule = checkWorkRule;
	}

	@Column(name = "CHECK_TECHNICAL_DETECTON", length = 50)
	public String getCheckTechnicalDetecton() {
		return this.checkTechnicalDetecton;
	}

	public void setCheckTechnicalDetecton(String checkTechnicalDetecton) {
		this.checkTechnicalDetecton = checkTechnicalDetecton;
	}

	@Column(name = "CHECK_FUNDS", length = 50)
	public String getCheckFunds() {
		return this.checkFunds;
	}

	public void setCheckFunds(String checkFunds) {
		this.checkFunds = checkFunds;
	}

	@Column(name = "YEAR", length = 4)
	public String getYear() {
		return this.year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	@Column(name = "COMPOSE", length = 1500)
	public String getCompose() {
		return this.compose;
	}

	public void setCompose(String compose) {
		this.compose = compose;
	}

	@Column(name = "LUNCH_SITUATION", length = 1500)
	public String getLunchSituation() {
		return this.lunchSituation;
	}

	public void setLunchSituation(String lunchSituation) {
		this.lunchSituation = lunchSituation;
	}

	@Column(name = "WORK_SITUATION", length = 1500)
	public String getWorkSituation() {
		return this.workSituation;
	}

	public void setWorkSituation(String workSituation) {
		this.workSituation = workSituation;
	}

	@Column(name = "PROBLEM", length = 3000)
	public String getProblem() {
		return this.problem;
	}

	public void setProblem(String problem) {
		this.problem = problem;
	}

	@Column(name = "RISK", length = 3000)
	public String getRisk() {
		return this.risk;
	}

	public void setRisk(String risk) {
		this.risk = risk;
	}

	@Column(name = "JUDGE", length = 3000)
	public String getJudge() {
		return this.judge;
	}

	public void setJudge(String judge) {
		this.judge = judge;
	}

	@Column(name = "IMPROVE_MEASURE", length = 1500)
	public String getImproveMeasure() {
		return this.improveMeasure;
	}

	public void setImproveMeasure(String improveMeasure) {
		this.improveMeasure = improveMeasure;
	}

	@Column(name = "OVERALL_EFFECT", length = 1500)
	public String getOverallEffect() {
		return this.overallEffect;
	}

	public void setOverallEffect(String overallEffect) {
		this.overallEffect = overallEffect;
	}

	@Column(name = "SUMMARY_SUGGESTION", length = 1500)
	public String getSummarySuggestion() {
		return this.summarySuggestion;
	}

	public void setSummarySuggestion(String summarySuggestion) {
		this.summarySuggestion = summarySuggestion;
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

	@Temporal(TemporalType.DATE)
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

	@Temporal(TemporalType.DATE)
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
	
//	public static enum UseOrNot implements GenericEnum{
//		YES(1,"已采用"), NO(2,"未采用");
//
//		private int code;
//		private String description;
//		
//		private UseOrNot(int code,String description){
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
//	public static enum ExistOrNot implements GenericEnum{
//		YES(1,"已存在"), NO(2,"未存在");
//
//		private int code;
//		private String description;
//		
//		private ExistOrNot(int code,String description){
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
//	public static enum DraftOrNot implements GenericEnum{
//		YES(1,"已制定"), NO(2,"未制定");
//
//		private int code;
//		private String description;
//		
//		private DraftOrNot(int code,String description){
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
//	public static enum EditOrNot implements GenericEnum{
//		YES(1,"修订"), NO(2,"未修订");
//
//		private int code;
//		private String description;
//		
//		private EditOrNot(int code,String description){
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
//	public static enum BuildOrNot implements GenericEnum{
//		YES(1,"已建立"), NO(2,"未建立");
//
//		private int code;
//		private String description;
//		
//		private BuildOrNot(int code,String description){
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
	
}