package com.wonders.frame.icp.model.vo;

import java.io.Serializable;
/**
 * 
 * @author Administrator
 * 封装按单位和部门显示问卷调查的答案统计
 */
public class QteDeptStatistics implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer mainId;//问卷id
	private Integer quesId;//问题id
	private String quesContent;//题目
	private String quesType;//问题类型：单选，多选
	private Integer opId;//选项id
	private String code;//选项
	private String value;//选项值
	private String deptId;//部门id
	private Integer num;//该选项被选中次数
	
	public QteDeptStatistics() {}

	public QteDeptStatistics(Integer mainId, Integer quesId,
			String quesContent, String quesType, Integer opId, String code,
			String value, String deptId, Integer num) {
		this.mainId = mainId;
		this.quesId = quesId;
		this.quesContent = quesContent;
		this.quesType = quesType;
		this.opId = opId;
		this.code = code;
		this.value = value;
		this.deptId = deptId;
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

	public String getQuesContent() {
		return quesContent;
	}

	public void setQuesContent(String quesContent) {
		this.quesContent = quesContent;
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

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
