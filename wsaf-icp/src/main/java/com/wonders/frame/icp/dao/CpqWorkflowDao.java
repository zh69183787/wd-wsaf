package com.wonders.frame.icp.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.dao.GenericRepository;
import com.wonders.frame.icp.model.bo.CpqWorkflow;

public interface CpqWorkflowDao extends GenericRepository<CpqWorkflow, Integer>{

	public Page<CpqWorkflow> findAll(Pageable pageable);
		
	@Query("select a from CpqWorkflow a where a.removed = 0 and a.id =?")
	public CpqWorkflow findById(Integer id);
	
	@Transactional  
	@Modifying 
	@Query("update CpqWorkflow a set a.todoItemId=:todoItemId where a.removed = 0 and a.id =:id")
	public Integer updateTodoItemIdById(@Param("id")Integer id,@Param("todoItemId")String todoItemId);
	
	@Transactional  
	@Modifying 
	@Query("update CpqWorkflow a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id")Integer id);
	
	
    @QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })  
    public List<CpqWorkflow> findAll();  

    
}
