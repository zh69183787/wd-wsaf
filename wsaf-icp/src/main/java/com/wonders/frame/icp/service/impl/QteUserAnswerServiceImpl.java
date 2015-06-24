package com.wonders.frame.icp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.icp.dao.QteUserAnswerDao;
import com.wonders.frame.icp.model.bo.QteUserAnswer;
import com.wonders.frame.icp.service.QteUserAnswerService;

@Service("qteUserAnswerService")
@Transactional
public class QteUserAnswerServiceImpl implements QteUserAnswerService {
	
	@Resource
	private QteUserAnswerDao qteUserAnswerDao;

	@Transactional(readOnly=true)
	public QteUserAnswer findByQuestIdAndLoginName(Integer questId,String loginName) {
		
		return qteUserAnswerDao.findByQuestIdAndLoginName(questId, loginName);
	}

	@Transactional(readOnly=true)
	public QteUserAnswer findByQuestIdAndOptionIdAndLoginName(Integer questId,Integer optionId, String loginName) {
		return qteUserAnswerDao.findByQuestIdAndOptionIdAndLoginName(questId, optionId, loginName);
	}

	@Transactional(readOnly=true)
	public List<QteUserAnswer> findByQuestIdAndOptionIdAndDeptId(Integer questId,
			Integer optionId, String deptId) {
		return qteUserAnswerDao.findByQuestIdAndOptionIdAndDeptId(questId, optionId, deptId);
	}

}
