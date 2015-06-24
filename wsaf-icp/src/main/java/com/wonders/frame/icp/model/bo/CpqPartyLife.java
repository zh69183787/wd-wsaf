package com.wonders.frame.icp.model.bo;

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
 * CpqPartyLife entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "CPQ_PARTY_LIFE")
@ShowInView(name="党组织生活")
public class CpqPartyLife implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 6208961538673489461L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="部门ID")
	private String deptId;
	@ShowInView(name="部门名称")
	private String deptName;
	@ShowInView(name="填报人")
	private String creator;
	@ShowInView(name="填报人工号")
	private String creatorLoginname;
	@ShowInView(name="填报时间")
	private Date createTime;
	@ShowInView(name="年度")
	private String year;
	@ShowInView(name="一月次数")
	private Integer jan;
	@ShowInView(name="二月次数")
	private Integer feb;
	@ShowInView(name="三月次数")
	private Integer mar;
	@ShowInView(name="四月次数")
	private Integer apr;
	@ShowInView(name="五月次数")
	private Integer may;
	@ShowInView(name="六月次数")
	private Integer jun;
	@ShowInView(name="七月次数")
	private Integer jul;
	@ShowInView(name="八月次数")
	private Integer aug;
	@ShowInView(name="九月次数")
	private Integer sep;
	@ShowInView(name="十月次数")
	private Integer oct;
	@ShowInView(name="十一月次数")
	private Integer nov;
	@ShowInView(name="十二月次数")
	private Integer dece;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public CpqPartyLife() {
		this.removed=0;
	}

	/** minimal constructor */
	public CpqPartyLife(Integer id, String creator,String creatorLoginname, Date createTime,
			String year, Integer removed) {
		this.id = id;
		this.creator = creator;
		this.creatorLoginname = creatorLoginname;
		this.createTime = createTime;
		this.year = year;
		this.removed = removed;
	}

	/** full constructor */
	public CpqPartyLife(Integer id, String deptId, String deptName,
			String creator,String creatorLoginname, Date createTime, String year, Integer jan,
			Integer feb, Integer mar, Integer apr, Integer may,
			Integer jun, Integer jul, Integer aug, Integer sep,
			Integer oct, Integer nov, Integer dece, Integer removed) {
		this.id = id;
		this.deptId = deptId;
		this.deptName = deptName;
		this.creator = creator;
		this.creatorLoginname = creatorLoginname;		
		this.createTime = createTime;
		this.year = year;
		this.jan = jan;
		this.feb = feb;
		this.mar = mar;
		this.apr = apr;
		this.may = may;
		this.jun = jun;
		this.jul = jul;
		this.aug = aug;
		this.sep = sep;
		this.oct = oct;
		this.nov = nov;
		this.dece = dece;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_cpq_party_life",allocationSize=1)	
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "DEPT_ID", length = 10)
	public String getDeptId() {
		return this.deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	@Column(name = "DEPT_NAME", length = 50)
	public String getDeptName() {
		return this.deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	@Column(name = "CREATOR", nullable = false, length = 20)
	public String getCreator() {
		return this.creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	@Column(name = "CREATOR_LOGINNAME", nullable = false, length = 20)
	public String getCreatorLoginname() {
		return this.creatorLoginname;
	}

	public void setCreatorLoginname(String creatorLoginname) {
		this.creatorLoginname = creatorLoginname;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATE_TIME", nullable = false, length = 7)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "YEAR", nullable = false, length = 4)
	public String getYear() {
		return this.year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	@Column(name = "JAN", precision = 22, scale = 0)
	public Integer getJan() {
		return this.jan;
	}

	public void setJan(Integer jan) {
		this.jan = jan;
	}

	@Column(name = "FEB", precision = 22, scale = 0)
	public Integer getFeb() {
		return this.feb;
	}

	public void setFeb(Integer feb) {
		this.feb = feb;
	}

	@Column(name = "MAR", precision = 22, scale = 0)
	public Integer getMar() {
		return this.mar;
	}

	public void setMar(Integer mar) {
		this.mar = mar;
	}

	@Column(name = "APR", precision = 22, scale = 0)
	public Integer getApr() {
		return this.apr;
	}

	public void setApr(Integer apr) {
		this.apr = apr;
	}

	@Column(name = "MAY", precision = 22, scale = 0)
	public Integer getMay() {
		return this.may;
	}

	public void setMay(Integer may) {
		this.may = may;
	}

	@Column(name = "JUN", precision = 22, scale = 0)
	public Integer getJun() {
		return this.jun;
	}

	public void setJun(Integer jun) {
		this.jun = jun;
	}

	@Column(name = "JUL", precision = 22, scale = 0)
	public Integer getJul() {
		return this.jul;
	}

	public void setJul(Integer jul) {
		this.jul = jul;
	}

	@Column(name = "AUG", precision = 22, scale = 0)
	public Integer getAug() {
		return this.aug;
	}

	public void setAug(Integer aug) {
		this.aug = aug;
	}

	@Column(name = "SEP", precision = 22, scale = 0)
	public Integer getSep() {
		return this.sep;
	}

	public void setSep(Integer sep) {
		this.sep = sep;
	}

	@Column(name = "OCT", precision = 22, scale = 0)
	public Integer getOct() {
		return this.oct;
	}

	public void setOct(Integer oct) {
		this.oct = oct;
	}

	@Column(name = "NOV", precision = 22, scale = 0)
	public Integer getNov() {
		return this.nov;
	}

	public void setNov(Integer nov) {
		this.nov = nov;
	}

	@Column(name = "DECE", precision = 22, scale = 0)
	public Integer getDece() {
		return this.dece;
	}

	public void setDece(Integer dece) {
		this.dece = dece;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}