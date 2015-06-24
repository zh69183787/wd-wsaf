package com.wonders.frame.icp.service;

import java.util.List;

import com.wonders.frame.icp.model.bo.QteUserAnswer;

public interface QteUserAnswerService {
	public QteUserAnswer findByQuestIdAndLoginName(Integer questId,String loginName);
	
	public QteUserAnswer findByQuestIdAndOptionIdAndLoginName(Integer questId,Integer optionId,String loginName);
	
	public List<QteUserAnswer> findByQuestIdAndOptionIdAndDeptId(Integer questId,Integer optionId,String deptId);
}
