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
import com.wonders.frame.iims.model.bo.ProjectPlanImposed;


public interface ProjectPlanImposedDao  extends GenericRepository<ProjectPlanImposed, Integer>{

	public Page<ProjectPlanImposed> findAll(Pageable pageable);
	
	
	@Query("select a from ProjectPlanImposed a where a.removed = 0 and a.id =?")
	public ProjectPlanImposed findById(Integer id);

	@Query("select a from ProjectPlanImposed a where a.removed = 0 and a.projectTargetId =?")
	public List <ProjectPlanImposed>  findByProjectId(Integer id);
	
	@Transactional  
	@Modifying 
	@Query("update ProjectPlanImposed a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id")Integer id);
	
    @QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })  
    public List<ProjectPlanImposed> findAll();  
    
    
    
}
