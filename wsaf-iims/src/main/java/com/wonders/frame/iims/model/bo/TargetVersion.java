package com.wonders.frame.iims.model.bo;

import java.util.Date;
import java.util.UUID;

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
 * @author Jone
 *
 */
/**
 * @author Jone
 *
 */
@Entity
@Table(name = "IIMS_TARGET_VERSION")
@ShowInView(name="项目目标计划")
public class TargetVersion implements java.io.Serializable{

	/**                                                                                                                                              好好 2222   qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
	 * 
	 */
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 6366147732091862020L;
	
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer Id;
	
	@ShowInView(name="年份")
	private String year;
	
	@ShowInView(name="计划名称")
	private String targetName;
	
	@ShowInView(name="计划状态",operateType=OperateType.SELECT,ccateType="targetState")
	private String targetState;
	
	@ShowInView(name="创建时间")
	private Date createTime;
	
	@ShowInView(name="版本组编码")
	private String groupCode ;
	
	@ShowInView(name="编制人")
	private String orgPeople;
	
	@ShowInView(name="编制单位")
	private String orgCompany;
	
	@ShowInView(name="计划版本号")
	private String versionId;

	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;
	
	@ShowInView(name="是否显示")
	private String showCode;
	
	@Column(name = "SHOW_CODE",length = 1)
	public String getShowCode() {
		return showCode;
	}

	public void setShowCode(String showCode) {
		this.showCode = showCode;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_target_version",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	@Column(name = "YEAR", nullable = false, length = 4)
	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	@Column(name = "TARGET_NAME",length=40)
	public String getTargetName() {
		return targetName;
	}

	public void setTargetName(String targetName) {
		this.targetName = targetName;
	}

	@Column(name = "TARGET_STATE",length=40)
	public String getTargetState() {
		return targetState;
	}

	public void setTargetState(String targetState) {
		this.targetState = targetState;
	}
	@Temporal(TemporalType.DATE)
	@Column(name = "TARGET_CREATE_TIME", nullable = false,length=20)
	public Date getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Column(name = "REMOVED", nullable = false)
	public Integer getRemoved() {
		return removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}



	public TargetVersion(Integer id, String year, String targetName,
			String targetState, Date createTime, Integer removed) {
		super();
		Id = id;
		this.year = year;
		this.targetName = targetName;
		this.targetState = targetState;
		this.createTime = createTime;
		this.removed = removed;
	}

	public TargetVersion() {
		super();
		this.removed=0;
	}

	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}
	@Column(name = "GROUP_CODE",length=40)
	public String getGroupCode() {
		return groupCode;
	}

	public void setVersionId(String versionId) {
		this.versionId = versionId;
	}
	@Column(name = "VERSION_ID",length=40)
	public String getVersionId() {
		return versionId;
	}

	public void setOrgPeople(String orgPeople) {
		this.orgPeople = orgPeople;
	}
	@Column(name = "ORG_PEOPLE",length=40)
	public String getOrgPeople() {
		return orgPeople;
	}

	public void setOrgCompany(String orgCompany) {
		this.orgCompany = orgCompany;
	}
	@Column(name = "ORG_COMPANY",length=40)
	public String getOrgCompany() {
		return orgCompany;
	}

	@Override
	public String toString() {
		
		return " "+Id+","+year+","+targetName+","+targetState+","+createTime+","+groupCode+","+orgPeople+"";
	}

	
	
}
