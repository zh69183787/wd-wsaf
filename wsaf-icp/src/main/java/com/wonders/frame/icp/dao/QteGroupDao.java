package com.wonders.frame.icp.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.dao.GenericRepository;
import com.wonders.frame.icp.model.bo.QteGroup;

public interface QteGroupDao extends GenericRepository<QteGroup, Integer> {

	@Query("select q from QteGroup q where q.removed=0 and q.id=?")
	public QteGroup findById(Integer id);
	
	@Query("select q from QteGroup q where q.removed=0 and q.mainId=?")
	public List<QteGroup> findByMainId(Integer mainId);
	
	@Modifying
	@Transactional
	@Query("update QteGroup q set q.removed=1 where q.id=?")
	public Integer removeById(Integer id);
	
	
	
	@QueryHints({@QueryHint(name="org.hibernate.cacheable",value="true")})
	public List<QteGroup> findAll();
}
