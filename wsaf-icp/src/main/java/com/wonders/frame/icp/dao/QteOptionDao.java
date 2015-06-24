package com.wonders.frame.icp.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.dao.GenericRepository;
import com.wonders.frame.icp.model.bo.QteOption;

public interface QteOptionDao extends GenericRepository<QteOption, Integer> {
	
	@Query("select q from QteOption q where q.removed=0 and q.id=?")
	public QteOption findById(Integer id);
	
	@Query("select q from QteOption q where q.removed=0 and q.quesId=?")
	public List<QteOption> findByQuesId(Integer quesId);
	
	@Modifying
	@Transactional
	@Query("update QteOption q set q.removed=1 where q.id=?")
	public Integer removeById(Integer id);
	
	@Modifying
	@Transactional
	@Query("update QteOption q set q.removed=1 where q.quesId=?")
	public Integer removeByQuesId(Integer quesId);
	
	@QueryHints({@QueryHint(name="org.hibernate.cacheable",value="true")})
	public List<QteOption> findAll();
}
