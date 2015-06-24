package com.wonders.frame.cpq.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.dao.GenericRepository;
import com.wonders.frame.cpq.model.bo.ActSuggestion;

public interface ActSuggestionDao extends GenericRepository<ActSuggestion, Integer> {
	
	@Query("select a from ActSuggestions a where a.removed=0 and a.id=?")
	public ActSuggestion findById(Integer id);
	
	@Query("select a from ActSuggestions a where a.removed=0 and a.ctId=?")
	public List<ActSuggestion> findByCtId(Integer ctId);
	
	@Transactional
	@Modifying
	@Query("update ActSuggestions a set a.removed=1 where a.id=?")
	public Integer removeById(Integer id);
	
	@Transactional
	@Modifying
	@Query("update ActSuggestions a set a.removed=1 where a.id=?")
	public Integer removeByCtId(Integer ctId);
	
	@QueryHints({@QueryHint(name="org.hibernate.cacheable",value="true")})
	public List<ActSuggestion> findAll();
}
