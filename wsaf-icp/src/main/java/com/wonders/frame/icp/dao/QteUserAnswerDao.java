package com.wonders.frame.icp.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.dao.GenericRepository;
import com.wonders.frame.icp.model.bo.QteUserAnswer;

public interface QteUserAnswerDao extends GenericRepository<QteUserAnswer, Integer> {

	@Query("select q from QteUserAnswer q where q.removed=0 and q.id=?")
	public QteUserAnswer findById(Integer id);
	
	@Query("select q from QteUserAnswer q where q.removed=0 and q.questId=:questId and q.loginName=:loginName")
	public QteUserAnswer findByQuestIdAndLoginName(@Param("questId")Integer questId,@Param("loginName")String loginName);
	
	@Query("select q from QteUserAnswer q where q.removed=0 and q.questId=?1 and q.optionId=?2 and q.loginName=?3 ")
	public QteUserAnswer findByQuestIdAndOptionIdAndLoginName(Integer questId,Integer optionId,String loginName);
	
	@Query("select q from QteUserAnswer q where q.removed=0 and q.questId=?1 and q.optionId=?2 and q.deptId=?3 ")
	public List<QteUserAnswer> findByQuestIdAndOptionIdAndDeptId(Integer questId,Integer optionId,String deptId);
	
	@Modifying
	@Transactional
	@Query("update QteUserAnswer q set q.removed=1 where q.id=?")
	public Integer removeById(Integer id);
	
	@QueryHints({@QueryHint(name="org.hibernate.cacheable",value="true")})
	public List<QteUserAnswer> findAll();
}
