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
import com.wonders.frame.iims.model.bo.SpecialContract;

public interface SpecialContractDao extends GenericRepository<SpecialContract, Integer>{

	public Page<SpecialContract> findAll(Pageable pageable);
		
	@Query("select a from SpecialContract a where a.removed = 0 and a.id =?")
	public SpecialContract findById(Integer id);
	
	@Transactional  
	@Modifying 
	@Query("update SpecialContract a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id")Integer id);
	
	
    @QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })  
    public List<SpecialContract> findAll();  

    
}
