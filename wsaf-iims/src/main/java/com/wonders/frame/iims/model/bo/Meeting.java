package com.wonders.frame.iims.model.bo;

import java.math.BigDecimal;
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
 * IimsMeeting entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_MEETING")
@ShowInView(name="会议管理")
public class Meeting implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = 659101510430829912L;
	
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="会议编号",noUse=true)
	private String meetingNum;
	@ShowInView(name="会议类型",operateType=OperateType.SELECT,ccateType="meetingType")
	private String meetingType;	
	@ShowInView(name="会议标题")
	private String title;
	@ShowInView(name="开始日期")
	private Date startDate;
	@ShowInView(name="开始时间",operateType=OperateType.SELECT,ccateType="meetingTime")
	private String startTime;
	@ShowInView(name="结束时间",operateType=OperateType.SELECT,ccateType="meetingTime")
	private String endTime;	
	@ShowInView(name="会议室",operateType=OperateType.SELECT,ccateType="meetingRoom")
	private String meetingRoom;
	@ShowInView(name="议题")
	private String topic;
	@ShowInView(name="主持人")
	private String master;
	@ShowInView(name="出席人员")
	private String presentMembers;
	@ShowInView(name="申请人")
	private String applyer;
	@ShowInView(name="备注")
	private String remarks;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public Meeting() {
		this.removed=0;
	}

	/** minimal constructor */
	public Meeting(Integer id, String title, Date startDate,
			Integer removed) {
		this.id = id;
		this.title = title;
		this.startDate = startDate;
		this.removed = removed;
	}

	/** full constructor */
	public Meeting(Integer id, String meetingNum,String meetingType, String title,
			Date startDate,String startTime,String endTime, String meetingRoom, String topic, String master,
			String presentMembers, String applyer, String remarks, Integer removed) {
		this.id = id;
		this.meetingNum = meetingNum;
		this.meetingType = meetingType;
		this.title = title;
		this.startDate = startDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.meetingRoom = meetingRoom;
		this.topic = topic;
		this.master = master;
		this.presentMembers = presentMembers;
		this.applyer = applyer;
		this.remarks = remarks;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_meeting",allocationSize=1)
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "MEETING_NUM", length = 50)
	public String getMeetingNum() {
		return this.meetingNum;
	}

	public void setMeetingNum(String meetingNum) {
		this.meetingNum = meetingNum;
	}
	@Column(name = "MEETING_TYPE", length = 50)
	public String getMeetingType() {
		return this.meetingType;
	}

	public void setMeetingType(String meetingType) {
		this.meetingType = meetingType;
	}
	@Column(name = "TITLE", nullable = false, length = 500)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	@Temporal(TemporalType.DATE)
	@Column(name = "START_DATE", nullable = false)
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	@Column(name = "START_TIME", length = 5)
	public String getStartTime() {
		return this.startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	@Column(name = "END_TIME", length = 5)
	public String getEndTime() {
		return this.endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	
	@Column(name = "MEETING_ROOM", length = 50)
	public String getMeetingRoom() {
		return this.meetingRoom;
	}

	public void setMeetingRoom(String meetingRoom) {
		this.meetingRoom = meetingRoom;
	}

	@Column(name = "TOPIC", length = 1000)
	public String getTopic() {
		return this.topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	@Column(name = "MASTER", length = 50)
	public String getMaster() {
		return this.master;
	}

	public void setMaster(String master) {
		this.master = master;
	}

	@Column(name = "PRESENT_MEMBERS", length = 500)
	public String getPresentMembers() {
		return this.presentMembers;
	}

	public void setPresentMembers(String presentMembers) {
		this.presentMembers = presentMembers;
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
	@Column(name = "APPLYER", length = 50)
	public String getApplyer() {
		return applyer;
	}

	public void setApplyer(String applyer) {
		this.applyer = applyer;
	}



}