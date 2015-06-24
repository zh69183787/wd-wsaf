package com.wonders.frame.icp.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.dao.GenericRepository;
import com.wonders.frame.icp.model.bo.QteMainWorkflow;

public interface QteMainWorkflowDao extends GenericRepository<QteMainWorkflow, Integer>{
	
	@Query("select q from QteMainWorkflow q where q.removed=0 and q.id=?")
	public QteMainWorkflow findById(Integer id);
	
	@Query("select q from QteMainWorkflow q where q.removed=0 and q.qteId=?")
	public QteMainWorkflow findByQteId(Integer qteId);
	
	@Modifying
	@Transactional
	@Query("update QteMainWorkflow q set q.removed=1 where q.id=?")
	public Integer removeById(Integer id);
	
	@Modifying
	@Transactional
	@Query("update QteMainWorkflow q set q.todoItemId=:todoItemId where q.removed=0 and q.id=:id")
	public Integer updateTodoItemIdById(@Param("todoItemId")String todoItemId,@Param("id")Integer id);
	
	
	@QueryHints({@QueryHint(name="org.hibernate.cacheable",value="true")})
	public List<QteMainWorkflow> findAll();

}
