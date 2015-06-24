package com.wonders.frame.core.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.model.bo.RelationRule;
/**
 * 
 * @author taoweiwei
 *
 */
public interface RelationRuleDao extends GenericRepository<RelationRule, Integer>{
	
	@Query("select r from RelationRule r where r.removed=0 and r.id=?")
	public RelationRule findById(Integer id);
	
	@Transactional
	@Modifying
	@Query("update RelationRule r set r.removed=1 where r.id=?")
	public Integer removeById(Integer id);

	@Transactional
	@Modifying
	@Query("update RelationRule r set r.removed=1 where r.id in (?)")
	public Integer removeByIds(Integer[] ids);
	
	@Transactional
	@Modifying
	@Query("update RelationRule r set r.removed=1 where r.ptype=?1 and r.ntype=?2 and r.type=?3")
	public Integer removeByPTypeAndNTypeAndType(String ptype,String ntype,String type);
	
	@Query("select r from RelationRule r where r.removed=0 and r.type=?")
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<RelationRule> findByType(String type);
	
	@Query("select r from RelationRule r where r.removed=0 and r.ptype=?1 and r.type=?2")
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<RelationRule> findByPtypeAndType(String ptype,String type);
	
	@Query("select r from RelationRule r where r.removed=0 and r.ptype=?1 and r.ntype=?2 and r.type=?3")
	public RelationRule findByPTypeAndNTypeAndType(String ptype,String ntype,String type);
	
	@Query("select r from RelationRule r where r.removed=0 and r.ptype=?1 and r.ntype=?2")
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<RelationRule> findByPTypeAndNType(String ptype,String ntype);
	
	@Query("select r from RelationRule r where r.removed=0 and r.ntype=?1 and r.type=?2")
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<RelationRule> findByNTypeAndType(String nType,String type);
}
