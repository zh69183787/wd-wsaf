package com.wonders.frame.icp.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.dao.GenericRepository;
import com.wonders.frame.icp.model.bo.QteMain;

public interface QteMainDao extends GenericRepository<QteMain, Integer>{
	
	@Query("select q from QteMain q where q.removed=0 and q.id=?")
	public QteMain findById(Integer id);
	
	@Modifying
	@Transactional
	@Query("update QteMain q set q.removed=1 where q.id=?")
	public Integer removeById(Integer id);
	
	@Modifying
	@Transactional
	@Query("update QteMain q set q.status=:status where q.removed=0 and q.id=:id")
	public Integer updateStatusById(@Param("status")String status,@Param("id")Integer id);
	
	@QueryHints({@QueryHint(name="org.hibernate.cacheable",value="true")})
	public List<QteMain> findAll();
}
