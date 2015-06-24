package com.wonders.frame.iims.dao;

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
import com.wonders.frame.iims.model.bo.ProjectPlan;

public interface ProjectPlanDao extends GenericRepository<ProjectPlan, Integer>{

	public Page<ProjectPlan> findAll(Pageable pageable);
		
	@Query("select a from ProjectPlan a where a.removed = 0 and a.id =?")
	public ProjectPlan findById(Integer id);
	
	@Transactional  
	@Modifying 
	@Query("update ProjectPlan a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id")Integer id);
	
	
	@Transactional  
	@Modifying 
	@Query("update ProjectPlan a set a.initiator =:initiator,a.initiatorLoginname=:initiatorLoginname,a.handler=:handler,a.handlerLoginname=:handlerLoginname,a.suggestion=:suggestion,a.status=:status where a.id =:id")
	public Integer updateFlowInfoById(@Param("initiator")String initiator,@Param("initiatorLoginname")String initiatorLoginname,
			@Param("handler")String handler,@Param("handlerLoginname")String handlerLoginname,
			@Param("suggestion")String suggestion,@Param("status")String status,@Param("id")Integer id);
	
	
    @QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })  
    public List<ProjectPlan> findAll();  

    
}
