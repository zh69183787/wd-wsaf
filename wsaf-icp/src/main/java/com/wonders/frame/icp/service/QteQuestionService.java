package com.wonders.frame.icp.service;

import java.util.List;

import com.wonders.frame.icp.model.bo.QteQuestion;

public interface QteQuestionService {
	public List<QteQuestion> findByMainIdAndGroupId(Integer mainId,Integer groupId);
}
