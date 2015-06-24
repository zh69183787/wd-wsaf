package com.wonders.frame.icp.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.icp.dao.QteUserMainDao;
import com.wonders.frame.icp.model.bo.QteUserMain;
import com.wonders.frame.icp.service.QteUserMainService;

@Service("qteUserMainService")
@Transactional
public class QteUserMainServiceImpl implements QteUserMainService{

	@Resource
	private QteUserMainDao qteUserMainDao;
	
	@Transactional(readOnly=true)
	public QteUserMain findByMainIdAndLoginName(Integer mainId, String loginName) {
		return qteUserMainDao.findByMainIdAndLoginName(mainId, loginName);
	}

}
