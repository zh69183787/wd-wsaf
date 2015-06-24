package com.wonders.frame.iims.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.dao.GenericRepository;
import com.wonders.frame.iims.model.bo.ProjectPlanImposed;
import com.wonders.frame.iims.model.bo.ProjectPlanTarget;

public interface ProjectPlanTargetDao  extends GenericRepository<ProjectPlanTarget, Integer>{

	
	@Query("select a from ProjectPlanTarget a where a.removed = 0 and a.id =?")
	public ProjectPlanTarget findById(Integer id);
	
	@Query("select a from ProjectPlanTarget a where a.removed = 0 and a.versionId =?")
	public List<ProjectPlanTarget> findByVersionId(String id);
	
	@Query("select a from ProjectPlanImposed a where a.removed = 0 and a.projectTargetId =?")
	public ProjectPlanImposed findImposedByProjectTargetId(Integer id);
	/*update IIMS_SIMPLE_FLOW_LOG t set t.deal_user ='胡波' where
			 exists (select 1
			from iims_simple_flow_main m
			where  m.id = t.main_id and t.id=75 )*/
	
	@Transactional  
	@Modifying 
	@Query("update ProjectPlanTarget a set a.tianbaoState ='2' where exists (select 1 from ProjectPlanImposed b where b.id =:imposedId and a.id=b.projectTargetId )")
	public void finishFlow(@Param("imposedId")Integer imposedId); 
}
