package com.wonders.frame.core.service;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.model.bo.RelationRuleType;
/**
 * 
 * @author taoweiwei
 *
 */
@Transactional(propagation = Propagation.SUPPORTS)
public interface RelationRuleTypeService {
	
	public RelationRuleType findById(Integer id);
	public RelationRuleType findByName(String name);
	
	public Integer removeById(Integer id);
	
	public Integer removeByIds(Integer[] ids);
	
}
