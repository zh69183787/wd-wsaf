package com.wonders.frame.icp.model.vo;

import java.io.Serializable;

/**
 * 
 * @author Administrator
 * 问卷统计信息：问卷中每道题被选中次数
 */
public class QteStatistics implements Serializable{

	private static final long serialVersionUID = 1L;
	private Integer mainId;//问卷id
	private Integer quesId;//问题id
	private String quesType;//问题类型：单选，多选
	private Integer opId;//选项id
	private String code;//选项
	private String value;//选项值
	private Integer num;//该选项被选中次数
	
	public QteStatistics() {}

	public QteStatistics(Integer mainId, Integer quesId, String quesType,
			Integer opId, String code,String value, Integer num) {
		this.mainId = mainId;
		this.quesId = quesId;
		this.quesType = quesType;
		this.opId = opId;
		this.code = code;
		this.value=value;
		this.num = num;
	}

	public Integer getMainId() {
		return mainId;
	}

	public void setMainId(Integer mainId) {
		this.mainId = mainId;
	}

	public Integer getQuesId() {
		return quesId;
	}

	public void setQuesId(Integer quesId) {
		this.quesId = quesId;
	}

	public String getQuesType() {
		return quesType;
	}

	public void setQuesType(String quesType) {
		this.quesType = quesType;
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

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}
}
