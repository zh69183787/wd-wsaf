package com.wonders.frame.icp.service;

import com.wonders.frame.icp.model.bo.QteUserMain;

public interface QteUserMainService {
	public QteUserMain findByMainIdAndLoginName(Integer mainId,String loginName);

}
