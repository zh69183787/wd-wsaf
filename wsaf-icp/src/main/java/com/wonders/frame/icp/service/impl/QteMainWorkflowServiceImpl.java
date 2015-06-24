package com.wonders.frame.icp.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.icp.dao.QteMainWorkflowDao;
import com.wonders.frame.icp.model.bo.QteMainWorkflow;
import com.wonders.frame.icp.service.QteMainWorkflowService;

@Service("qteMainWorkflowService")
@Transactional
public class QteMainWorkflowServiceImpl implements QteMainWorkflowService{

	@Resource
	private QteMainWorkflowDao qteMainWorkflowDao;
	
	@Transactional(readOnly=true)
	public QteMainWorkflow findByQteId(Integer qteId) {
		return qteMainWorkflowDao.findByQteId(qteId);
	}

}
