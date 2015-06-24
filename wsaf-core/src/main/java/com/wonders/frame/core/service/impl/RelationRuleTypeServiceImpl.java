package com.wonders.frame.core.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.dao.RelationRuleTypeDao;
import com.wonders.frame.core.model.bo.RelationRuleType;
import com.wonders.frame.core.service.RelationRuleTypeService;
/**
 * 
 * @author taoweiwei
 *
 */
@Service("relationRuleTypeService")
public class RelationRuleTypeServiceImpl implements RelationRuleTypeService{
	
	@Resource
	private RelationRuleTypeDao relationRuleTypeDao;
	
	@Transactional(readOnly = true)
	public RelationRuleType findById(Integer id) {
		return this.relationRuleTypeDao.findById(id);
	}
	public RelationRuleType findByName(String name){
		return this.relationRuleTypeDao.findByName(name);
	}

	public Integer removeById(Integer id) {
		return this.relationRuleTypeDao.removeById(id);
	}

	public Integer removeByIds(Integer[] ids) {
		return this.relationRuleTypeDao.removeByIds(ids);
	}

}
