package com.wonders.frame.core.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.dao.RelationRuleDao;
import com.wonders.frame.core.model.bo.RelationRule;
import com.wonders.frame.core.service.RelationRuleService;
/**
 * 
 * @author taoweiwei
 *
 */
@Service("relationRuleService")
public class RelationRuleServiceImpl implements RelationRuleService{
	
	@Resource
	private RelationRuleDao relationRuleDao;
	
	@Transactional(readOnly = true)
	public RelationRule findById(Integer id) {
		return this.relationRuleDao.findById(id);
	}

	public Integer removeById(Integer id) {
		return this.relationRuleDao.removeById(id);
	}

	public Integer removeByIds(Integer[] ids) {
		return this.relationRuleDao.removeByIds(ids);
	}

	@Override
	public Integer removeByPTypeAndNTypeAndType(String ptype, String ntype,
			String type) {
		return this.relationRuleDao.removeByPTypeAndNTypeAndType(ptype, ntype, type);
	}

	@Transactional(readOnly = true)
	public List<RelationRule> findByType(String type) {
		return this.relationRuleDao.findByType(type);
	}

	@Transactional(readOnly = true)
	public RelationRule findByPTypeAndNTypeAndType(String ptype, String ntype,String type) {
		return this.relationRuleDao.findByPTypeAndNTypeAndType(ptype, ntype, type);
	}

	@Transactional(readOnly = true)
	public List<RelationRule> findByPTypeAndNType(String ptype, String ntype) {
		return this.relationRuleDao.findByPTypeAndNType(ptype,ntype);
	}

	@Override
	public List<RelationRule> findByPtypeAndType(String ptype,
			String type) {
		return this.relationRuleDao.findByPtypeAndType(ptype, type);
	}
	
	@Override
	public List<String> findRuleByPIdAndType(Integer pid,String type) {
		return this.relationRuleDao.findRuleByPIdAndType(pid, type);
	}


}
