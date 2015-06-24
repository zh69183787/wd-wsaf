package com.wonders.frame.icp.service;

import com.wonders.frame.icp.model.bo.ActSuggestion;



public interface ActSuggestionService {
	public ActSuggestion findByCtIdAndLoginName(Integer ctId,String loginName);
}
