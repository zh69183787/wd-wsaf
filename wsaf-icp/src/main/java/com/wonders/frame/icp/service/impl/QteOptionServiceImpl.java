package com.wonders.frame.icp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.icp.dao.QteOptionDao;
import com.wonders.frame.icp.model.bo.QteOption;
import com.wonders.frame.icp.service.QteOptionService;

@Service("qteOptionService")
@Transactional
public class QteOptionServiceImpl implements QteOptionService {
	
	@Resource
	private QteOptionDao qteOptionDao;

    @Transactional(readOnly=true)
	public List<QteOption> findByQuesId(Integer quesId) {
		return qteOptionDao.findByQuesId(quesId);
	}
}
