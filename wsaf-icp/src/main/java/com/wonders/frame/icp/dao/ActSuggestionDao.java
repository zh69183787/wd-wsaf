package com.wonders.frame.icp.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.dao.GenericRepository;
import com.wonders.frame.icp.model.bo.ActSuggestion;

public interface ActSuggestionDao extends GenericRepository<ActSuggestion, Integer> {
	
	@Query("select a from ActSuggestion a where a.removed=0 and a.id=?")
	public ActSuggestion findById(Integer id);
	
	@Query("select a from ActSuggestion a where a.removed=0 and a.ctId=?")
	public List<ActSuggestion> findByCtId(Integer ctId);
	
	@Query("select a from ActSuggestion a where a.removed=0 and a.ctId=?1 and a.loginName=?2")
	public ActSuggestion findByCtIdAndLoginName(Integer ctId,String loginName);
	
	
	@Transactional
	@Modifying
	@Query("update ActSuggestion a set a.removed=1 where a.id=?")
	public Integer removeById(Integer id);
	
	@Transactional
	@Modifying
	@Query("update ActSuggestion a set a.removed=1 where a.id=?")
	public Integer removeByCtId(Integer ctId);
	
	@QueryHints({@QueryHint(name="org.hibernate.cacheable",value="true")})
	public List<ActSuggestion> findAll();
}
