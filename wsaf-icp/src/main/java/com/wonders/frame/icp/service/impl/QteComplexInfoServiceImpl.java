package com.wonders.frame.icp.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.icp.dao.QteComplexInfoDao;
import com.wonders.frame.icp.dao.QteGroupDao;
import com.wonders.frame.icp.dao.QteQuestionDao;
import com.wonders.frame.icp.model.bo.QteGroup;
import com.wonders.frame.icp.model.bo.QteQuestion;
import com.wonders.frame.icp.model.vo.QteMainDetail;
import com.wonders.frame.icp.model.vo.QteStatistics;
import com.wonders.frame.icp.service.QteComplexInfoService;

@Service("qteComplexInfoService")
@Transactional
public class QteComplexInfoServiceImpl implements QteComplexInfoService {

	@Resource
	private QteComplexInfoDao qteComplexInfoDao;
	
	@Resource
	private QteQuestionDao qteQuestionDao;
	
	@Resource
	private QteGroupDao qteGroupDao;
	
	@Transactional(readOnly=true)
	public List<QteMainDetail> findMainDetailByMainId(Integer mainId) {
		return qteComplexInfoDao.findMainDetailByMainId(mainId);
	}

	 @Transactional(readOnly=true)
	public Integer findCountByMainId(Integer mainId) {
		List<QteQuestion>  qteQuestions=qteQuestionDao.findByMainId(mainId);
		int count;
		if(qteQuestions==null || qteQuestions.size()<0){
			count=0;
		}else{
			count=qteQuestions.size();
		}
    	
		return count;
	}
	 

	@Transactional(readOnly=true)
	public List<QteGroup> findByMainId(Integer mainId) {
		return qteGroupDao.findByMainId(mainId);
	}
	
	public Integer findUserCountByMainId(Integer mainId){
		return qteComplexInfoDao.findUserCountByMainId(mainId);
	}

	@Override
	public Map<String, Integer> getPieDataOfDeptByMainId(Integer mainId) {
		return qteComplexInfoDao.getPieDataOfDeptByMainId(mainId);
	}
	
	

	@Override
	public List<Object> getDeptsByMainId(Integer mainId) {
		return qteComplexInfoDao.getDeptsByMainId(mainId);
	}

	@Override
	public List<QteStatistics> getQteMainByMainId(Integer mainId) {
		// TODO Auto-generated method stub
		return qteComplexInfoDao.getQteMainByMainId(mainId);
	}

}
