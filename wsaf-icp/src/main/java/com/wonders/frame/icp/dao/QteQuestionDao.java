package com.wonders.frame.icp.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.dao.GenericRepository;
import com.wonders.frame.icp.model.bo.QteQuestion;

public interface QteQuestionDao extends GenericRepository<QteQuestion, Integer> {
	@Query("select q from QteQuestion q where q.removed=0 and q.id=?")
	public QteQuestion findById(Integer id);
	
	@Query("select q from QteQuestion q where q.removed=0 and q.mainId=?")
	public List<QteQuestion> findByMainId(Integer mainId);
	
	
	@Query("select q from QteQuestion q where q.removed=0 and q.mainId=?1 and q.groupId=?2")
	public List<QteQuestion> findByMainIdAndGroupId(Integer mainId,Integer groupId);
	
	@Modifying
	@Transactional
	@Query("update QteQuestion q set q.removed=1 where q.mainId=?")
	public Integer removeByMainId(Integer mainId);
	
	@Modifying
	@Transactional
	@Query("update QteQuestion q set q.removed=1 where q.mainId=?1 and q.groupId=?2")
	public Integer removeByMainIdAndGroupId(Integer mainId,Integer groupId);
	
	@Modifying
	@Transactional
	@Query("update QteQuestion q set q.removed=1 where q.id=?")
	public Integer removeById(Integer id);
	
	@QueryHints({@QueryHint(name="org.hibernate.cacheable",value="true")})
	public List<QteQuestion> findAll();
}
