package com.wonders.frame.cpq.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.dao.GenericRepository;
import com.wonders.frame.cpq.model.bo.ActTheme;

public interface ActThemeDao extends GenericRepository<ActTheme, Integer> {
	
	@Query("select a from ActTheme a where a.removed=0 and a.id=?")
	public ActTheme findById(Integer id);
	
	@Transactional
	@Modifying
	@Query("update ActTheme a set a.removed=1 where a.id=?")
	public Integer removeById(Integer id);
	
	@QueryHints({@QueryHint(name="org.hibernate.cacheable",value="true")})
	public List<ActTheme> findAll();

}
