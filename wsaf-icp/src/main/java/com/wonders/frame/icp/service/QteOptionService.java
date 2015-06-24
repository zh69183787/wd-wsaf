package com.wonders.frame.icp.service;

import java.util.List;

import com.wonders.frame.icp.model.bo.QteOption;

public interface QteOptionService {

	public List<QteOption> findByQuesId(Integer quesId);
}
