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

/**
 * QteUserMain entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "QTE_USER_MAIN")
@ShowInView(name="用户填写问卷关系")
public class QteUserMain implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 1L;
	@ShowInView(name="ID")
	private Integer id;
	@ShowInView(name="问卷名称")
	private String mainTitle;
	@ShowInView(name="问卷id")
	private Integer mainId;
	@ShowInView(name="填写问卷用户工号")
	private String loginName;
	@ShowInView(name="填写时间")
	private Date fillTime;
	@ShowInView(name="逻辑删除标志位")
	private Integer removed;

	// Constructors

	/** default constructor */
	public QteUserMain() {
		this.removed=0;
	}

	/** full constructor */
	public QteUserMain(String mainTitle, Integer mainId, String loginName,
			Date fillTime, Integer removed) {
		this.mainTitle = mainTitle;
		this.mainId = mainId;
		this.loginName = loginName;
		this.fillTime = fillTime;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="Generator")
    @SequenceGenerator(name="Generator",sequenceName="seq_qte_user_main",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "MAIN_TITLE", nullable = false, length = 500)
	public String getMainTitle() {
		return this.mainTitle;
	}

	public void setMainTitle(String mainTitle) {
		this.mainTitle = mainTitle;
	}

	@Column(name = "MAIN_ID", nullable = false, precision = 22, scale = 0)
	public Integer getMainId() {
		return this.mainId;
	}

	public void setMainId(Integer mainId) {
		this.mainId = mainId;
	}

	@Column(name = "LOGIN_NAME", nullable = false, length = 50)
	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "FILL_TIME", nullable = false)
	public Date getFillTime() {
		return this.fillTime;
	}

	public void setFillTime(Date fillTime) {
		this.fillTime = fillTime;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}