package com.wonders.frame.icp.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.icp.dao.ActSuggestionDao;
import com.wonders.frame.icp.model.bo.ActSuggestion;
import com.wonders.frame.icp.service.ActSuggestionService;

@Service("actSuggestionService")
@Transactional
public class ActSuggestionServiceImpl implements ActSuggestionService {

	@Resource
	private ActSuggestionDao actSuggestionDao;
	
	@Transactional(readOnly=true)
	public ActSuggestion findByCtIdAndLoginName(Integer ctId, String loginName) {
		return actSuggestionDao.findByCtIdAndLoginName(ctId, loginName);
	}
}
