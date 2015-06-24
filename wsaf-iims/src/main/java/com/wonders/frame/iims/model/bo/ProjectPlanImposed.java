package com.wonders.frame.iims.model.bo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.wonders.frame.core.tags.ShowInView;
import com.wonders.frame.core.tags.ShowInView.OperateType;

/*
 * 实施计划
 */
@Entity
@Table(name = "IIMS_PROJECT_PLAN_IMPOSED")
@ShowInView(name="项目实施计划")
public class ProjectPlanImposed  implements java.io.Serializable{

	/**
	 * 
	 */
	@ShowInView(noUse=true)
	private static final long serialVersionUID = -8210338985635888596L;

	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	
	@ShowInView(name="项目目标ID")
	private Integer projectTargetId;
	
	@ShowInView(name="项目状态")
	private String projectState;
	
	@ShowInView(name="目标及效果开始时间")
	private String targetAndEffectStart;
	
	@ShowInView(name="目标及效果结束时间")
	private String targetAndEffectEnd;
	
	@ShowInView(name="需求及功能开始时间")
	private String demandAndFunctionStart;
	
	@ShowInView(name="需求及功能结束时间")
	private String demandAndFunctionEnd;
	
	@ShowInView(name="技术方案开始时间")
	private String schemeProposalStart; 
	
	@ShowInView(name="技术方案结束时间")
	private String schemeProposalEnd; 
	
	@ShowInView(name="立项审价开始时间")
	private String designatedShenjiaStart;
	
	@ShowInView(name="立项审价结束时间")
	private String designatedShenjiaEnd;
	
	@ShowInView(name="采购技术文件开始时间")
	private String purchaseTechnologyFileStart;
	
	@ShowInView(name="采购技术文件结束时间")
	private String purchaseTechnologyFileEnd;
	
	@ShowInView(name="采购开始时间")
	private String purchaseStart;
	
	@ShowInView(name="采购结束时间")
	private String purchaseEnd;
	
	@ShowInView(name="项目开工时间")
	private String projectStart;
	
	
	@ShowInView(name="实施方案开始时间")
	private String implementationPlanStart;
	 
	@ShowInView(name="项目初验时间")
	private String projectFirstCheck;
	
	 
	@ShowInView(name="项目终验时间")
	private String projectFinalCheck;
	
	@ShowInView(name="年度目标")
	private String yearTarget;
	
	@ShowInView(name="项目目标")
	private String projectTarget;
	
	@ShowInView(name="项目目标对象")
	private ProjectPlanTarget projectPlanTarget;

	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;
	@Column(name = "REMOVED", nullable = false)
	public Integer getRemoved() {
		return removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_project_plan_imposed",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "PROJECT_TARGET_ID")
	public Integer getProjectTargetId() {
		return projectTargetId;
	}

	public void setProjectTargetId(Integer projectTargetId) {
		this.projectTargetId = projectTargetId;
	}

	@Column(name = "PROJECT_STATE",length = 50)
	public String getProjectState() {
		return projectState;
	}

	public void setProjectState(String projectState) {
		this.projectState = projectState;
	}
	//@-T-emporal(TemporalType.DATE)
	@Column(name = "TARGET_AND_EFFECT_START",length = 50)
	public String getTargetAndEffectStart() {
		return targetAndEffectStart;
	}

	public void setTargetAndEffectStart(String targetAndEffectStart) {
		this.targetAndEffectStart = targetAndEffectStart;
	}

	//@-T-emporal(TemporalType.DATE)
	@Column(name = "TARGET_AND_EFFECTEND",length=20)
	public String getTargetAndEffectEnd() {
		return targetAndEffectEnd;
	}

	public void setTargetAndEffectEnd(String targetAndEffectEnd) {
		this.targetAndEffectEnd = targetAndEffectEnd;
	}

	//@-T-emporal(TemporalType.DATE)
	@Column(name = "DEMAND_AND_FUNCTION_START",length=20)
	public String getDemandAndFunctionStart() {
		return demandAndFunctionStart;
	}

	public void setDemandAndFunctionStart(String demandAndFunctionStart) {
		this.demandAndFunctionStart = demandAndFunctionStart;
	}
	
	//@-T-emporal(TemporalType.DATE)
	@Column(name = "DEMAND_AND_FUNCTION_END",length=20)
	public String getDemandAndFunctionEnd() {
		return demandAndFunctionEnd;
	}

	public void setDemandAndFunctionEnd(String demandAndFunctionEnd) {
		this.demandAndFunctionEnd = demandAndFunctionEnd;
	}

	//@-T-emporal(TemporalType.DATE)
	@Column(name = "SCHEME_PROPOSAL_START",length=20)
	public String getSchemeProposalStart() {
		return schemeProposalStart;
	}

	public void setSchemeProposalStart(String schemeProposalStart) {
		this.schemeProposalStart = schemeProposalStart;
	}

	//@-T-emporal(TemporalType.DATE)
	@Column(name = "SCHEME_PROPOSAL_END",length=20)
	public String getSchemeProposalEnd() {
		return schemeProposalEnd;
	}

	public void setSchemeProposalEnd(String schemeProposalEnd) {
		this.schemeProposalEnd = schemeProposalEnd;
	}

	//@-T-emporal(TemporalType.DATE)
	@Column(name = "DESIGNATED_SHENJIA_START",length=20)
	public String getDesignatedShenjiaStart() {
		return designatedShenjiaStart;
	}

	public void setDesignatedShenjiaStart(String designatedShenjiaStart) {
		this.designatedShenjiaStart = designatedShenjiaStart;
	}

	//@-T-emporal(TemporalType.DATE)
	@Column(name = "DESIGNATED_SHENJIA_END",length=20)
	public String getDesignatedShenjiaEnd() {
		return designatedShenjiaEnd;
	}

	public void setDesignatedShenjiaEnd(String designatedShenjiaEnd) {
		this.designatedShenjiaEnd = designatedShenjiaEnd;
	}

	//@-T-emporal(TemporalType.DATE)
	@Column(name = "PURCHASE_TECHNOLOGYFILE_START",length=20)
	public String getPurchaseTechnologyFileStart() {
		return purchaseTechnologyFileStart;
	}

	public void setPurchaseTechnologyFileStart(String purchaseTechnologyFileStart) {
		this.purchaseTechnologyFileStart = purchaseTechnologyFileStart;
	}

	//@-T-emporal(TemporalType.DATE)
	@Column(name = "PURCHASE_TECHNOLOGYFILE_END",length=20)
	public String getPurchaseTechnologyFileEnd() {
		return purchaseTechnologyFileEnd;
	}

	public void setPurchaseTechnologyFileEnd(String purchaseTechnologyFileEnd) {
		this.purchaseTechnologyFileEnd = purchaseTechnologyFileEnd;
	}

	//@-T-emporal(TemporalType.DATE)
	@Column(name = "PURCHASE_START",length=20)
	public String getPurchaseStart() {
		return purchaseStart;
	}

	public void setPurchaseStart(String purchaseStart) {
		this.purchaseStart = purchaseStart;
	}

	//@-T-emporal(TemporalType.DATE)
	@Column(name = "PURCHASE_END",length=20)
	public String getPurchaseEnd() {
		return purchaseEnd;
	}

	public void setPurchaseEnd(String purchaseEnd) {
		this.purchaseEnd = purchaseEnd;
	}

	//@-T-emporal(TemporalType.DATE)
	@Column(name = "PROJECT_START",length=20)
	public String getProjectStart() {
		return projectStart;
	}

	public void setProjectStart(String projectStart) {
		this.projectStart = projectStart;
	}

	//@-T-emporal(TemporalType.DATE)
	@Column(name = "IMPLEMENTATION_PLAN_START",length=20)
	public String getImplementationPlanStart() {
		return implementationPlanStart;
	}

	public void setImplementationPlanStart(String implementationPlanStart) {
		this.implementationPlanStart = implementationPlanStart;
	}

	//@-T-emporal(TemporalType.DATE)
	@Column(name = "PROJECT_FIRST_CHECK",length=20)
	public String getProjectFirstCheck() {
		return projectFirstCheck;
	}

	public void setProjectFirstCheck(String projectFirstCheck) {
		this.projectFirstCheck = projectFirstCheck;
	}

	//@-T-emporal(TemporalType.DATE)
	@Column(name = "PROJECT_FINAL_CHECK",length=20)
	public String getProjectFinalCheck() {
		return projectFinalCheck;
	}

	public void setProjectFinalCheck(String projectFinalCheck) {
		this.projectFinalCheck = projectFinalCheck;
	}

	@Column(name = "YEAR_TARGET",length=20)
	public String getYearTarget() {
		return yearTarget;
	}

	public void setYearTarget(String yearTarget) {
		this.yearTarget = yearTarget;
	}

	@Column(name = "PROJECT_TARGET",length=20)
	public String getProjectTarget() {
		return projectTarget;
	}

	public void setProjectTarget(String projectTarget) {
		this.projectTarget = projectTarget;
	}

	@Override
	public String toString() {
		return "ProjectPlanImposed [id=" + id + ", projectTargetId="
				+ projectTargetId + ", projectState=" + projectState
				+ ", targetAndEffectStart=" + targetAndEffectStart
				+ ", targetAndEffectEnd=" + targetAndEffectEnd
				+ ", demandAndFunctionStart=" + demandAndFunctionStart
				+ ", demandAndFunctionEnd=" + demandAndFunctionEnd
				+ ", schemeProposalStart=" + schemeProposalStart
				+ ", schemeProposalEnd=" + schemeProposalEnd
				+ ", designatedShenjiaStart=" + designatedShenjiaStart
				+ ", designatedShenjiaEnd=" + designatedShenjiaEnd
				+ ", purchaseTechnologyFileStart="
				+ purchaseTechnologyFileStart + ", purchaseTechnologyFileEnd="
				+ purchaseTechnologyFileEnd + ", purchaseStart="
				+ purchaseStart + ", purchaseEnd=" + purchaseEnd
				+ ", projectStart=" + projectStart
				+ ", implementationPlanStart=" + implementationPlanStart
				+ ", projectFirstCheck=" + projectFirstCheck
				+ ", projectFinalCheck=" + projectFinalCheck + ", yearTarget="
				+ yearTarget + ", projectTarget=" + projectTarget
				+ ", removed=" + removed + "]";
	}

	@OneToOne
	@JoinColumn(name = "PROJECT_TARGET_ID",insertable=false, updatable=false) 
	public ProjectPlanTarget getProjectPlanTarget() {
		return projectPlanTarget;
	}

	public void setProjectPlanTarget(ProjectPlanTarget projectPlanTarget) {
		this.projectPlanTarget = projectPlanTarget;
	}
	
	
	
}
