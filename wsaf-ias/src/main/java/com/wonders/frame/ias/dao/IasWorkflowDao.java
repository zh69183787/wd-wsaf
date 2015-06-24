package com.wonders.frame.ias.dao;

import com.wonders.frame.core.dao.GenericRepository;
import com.wonders.frame.ias.model.bo.IasWorkflow;
import org.apache.poi.hssf.record.formula.functions.T;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.QueryHint;
import java.util.List;

public interface IasWorkflowDao extends GenericRepository<IasWorkflow, Integer>{

	public Page<IasWorkflow> findAll(Pageable pageable);
		
	@Query("select a from IasWorkflow a where a.removed = 0 and a.id =?")
	public IasWorkflow findById(Integer id);
	
	@Transactional  
	@Modifying 
	@Query("update IasWorkflow a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id")Integer id);
	
	@Transactional  
	@Modifying 
	@Query("update IasWorkflow a set a.todoItemId=:todoItemId where a.removed = 0 and a.id =:id")
	public Integer updateTodoItemIdById(@Param("id")Integer id,@Param("todoItemId")String todoItemId);
	
    @QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })  
    public List<IasWorkflow> findAll();

    /**
     * 判断上月是否填报完成
     */
    @Query("from IasWorkflow w where w.removed =0 and w.iasDept = ? and w.iasMonth = ?")
    public List<IasWorkflow> findByMonth(String iasDept,String iasMonth);

}
