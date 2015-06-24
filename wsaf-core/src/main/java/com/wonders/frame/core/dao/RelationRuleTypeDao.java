package com.wonders.frame.core.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.model.bo.RelationRuleType;
/**
 * 
 * @author taoweiwei
 *
 */
public interface RelationRuleTypeDao extends GenericRepository<RelationRuleType, Integer>{
	
	@Query("select r from RelationRuleType r where r.removed=0 and r.id=?")
	public RelationRuleType findById(Integer id);
	
	@Query("select r from RelationRuleType r where r.removed=0 and r.name=?")
	public RelationRuleType findByName(String name);
	
	@Transactional
	@Modifying
	@Query("update RelationRuleType r set r.removed=1 where r.id=?")
	public Integer removeById(Integer id);

	@Transactional
	@Modifying
	@Query("update RelationRuleType r set r.removed=1 where r.id in (?)")
	public Integer removeByIds(Integer[] ids);
	
}
