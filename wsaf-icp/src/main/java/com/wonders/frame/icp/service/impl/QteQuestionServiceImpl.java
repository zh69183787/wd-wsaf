package com.wonders.frame.icp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.icp.dao.QteQuestionDao;
import com.wonders.frame.icp.model.bo.QteQuestion;
import com.wonders.frame.icp.service.QteQuestionService;

@Service("qteQuestionService")
@Transactional
public class QteQuestionServiceImpl implements QteQuestionService {

	@Resource
	private QteQuestionDao qteQuestionDao;
	
	@Transactional(readOnly=true)
	public List<QteQuestion> findByMainIdAndGroupId(Integer mainId,Integer groupId) {
		return qteQuestionDao.findByMainIdAndGroupId(mainId, groupId);
	}
}
