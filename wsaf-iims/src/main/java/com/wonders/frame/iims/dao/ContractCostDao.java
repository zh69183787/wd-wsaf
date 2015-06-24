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
import com.wonders.frame.iims.model.bo.ContractCost;

public interface ContractCostDao extends GenericRepository<ContractCost, Integer>{

	public Page<ContractCost> findAll(Pageable pageable);
		
	@Query("select a from ContractCost a where a.removed = 0 and a.id =?")
	public ContractCost findById(Integer id);
	
	@Transactional  
	@Modifying 
	@Query("update ContractCost a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id")Integer id);
	
	
    @QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })  
    public List<ContractCost> findAll();  

    
}
