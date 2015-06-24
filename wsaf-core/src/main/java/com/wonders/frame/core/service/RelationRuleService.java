package com.wonders.frame.core.service;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.model.bo.RelationRule;
/**
 * 
 * @author taoweiwei
 *
 */
@Transactional(propagation = Propagation.SUPPORTS)
public interface RelationRuleService {
	
	public RelationRule findById(Integer id);
	
	public Integer removeById(Integer id);
	
	public Integer removeByIds(Integer[] ids);
	
	public Integer removeByPTypeAndNTypeAndType(String ptype,String ntype,String type);

	public List<RelationRule> findByType(String type);

	public RelationRule findByPTypeAndNTypeAndType(String ptype,String ntype,String type);
	
	public List<RelationRule> findByPtypeAndType(String ptype,String type);
//	public List<RelationRule> findByNTypeAndType(String nType,String type);
	public List<String> findRuleByPIdAndType(Integer pid,String type);
}
