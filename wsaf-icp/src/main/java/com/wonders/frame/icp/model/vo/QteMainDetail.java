package com.wonders.frame.icp.model.vo;

import java.io.Serializable;
/**
 * 
 * @author Administrator
 * 封装问卷详细信息：问卷、分组,问题、选项等
 */
public class QteMainDetail implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer mId;//问卷id
	private String mTilte;//问卷标题
	private Integer gId;//分组id
	private String gName;//分组名称
	private Integer gOrders;//分组次序号
	private Integer quId;  //问题id
	private String quContent;//题干内容
	private String quesType;//问题类型
	private Integer quesOrders;//题号
	private String isDisplay;//是否显示题号,yes:显示，no:不显示
	private Integer opId;//选项id
	private String code;//选项
	private String value;//选项值
	
	public QteMainDetail() {}

	public QteMainDetail(Integer mId, String mTilte, Integer gId, String gName,
			Integer gOrders, Integer quId, String quContent, String quesType,
			Integer quesOrders, String isDisplay, Integer opId, String code,
			String value) {
		this.mId = mId;
		this.mTilte = mTilte;
		this.gId = gId;
		this.gName = gName;
		this.gOrders = gOrders;
		this.quId = quId;
		this.quContent = quContent;
		this.quesType = quesType;
		this.quesOrders = quesOrders;
		this.isDisplay = isDisplay;
		this.opId = opId;
		this.code = code;
		this.value = value;
	}

	public Integer getmId() {
		return mId;
	}

	public void setmId(Integer mId) {
		this.mId = mId;
	}

	public String getmTilte() {
		return mTilte;
	}

	public void setmTilte(String mTilte) {
		this.mTilte = mTilte;
	}

	public Integer getgId() {
		return gId;
	}

	public void setgId(Integer gId) {
		this.gId = gId;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public Integer getgOrders() {
		return gOrders;
	}

	public void setgOrders(Integer gOrders) {
		this.gOrders = gOrders;
	}

	public Integer getQuId() {
		return quId;
	}

	public void setQuId(Integer quId) {
		this.quId = quId;
	}

	public String getQuContent() {
		return quContent;
	}

	public void setQuContent(String quContent) {
		this.quContent = quContent;
	}

	public String getQuesType() {
		return quesType;
	}

	public void setQuesType(String quesType) {
		this.quesType = quesType;
	}

	public Integer getQuesOrders() {
		return quesOrders;
	}

	public void setQuesOrders(Integer quesOrders) {
		this.quesOrders = quesOrders;
	}

	public String getIsDisplay() {
		return isDisplay;
	}

	public void setIsDisplay(String isDisplay) {
		this.isDisplay = isDisplay;
	}

	public Integer getOpId() {
		return opId;
	}

	public void setOpId(Integer opId) {
		this.opId = opId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
