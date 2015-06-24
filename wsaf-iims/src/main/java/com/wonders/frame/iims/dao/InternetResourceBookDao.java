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
import com.wonders.frame.iims.model.bo.InternetResourceBook;

public interface InternetResourceBookDao extends GenericRepository<InternetResourceBook, Integer>{

	public Page<InternetResourceBook> findAll(Pageable pageable);
		
	@Query("select a from InternetResourceBook a where a.removed = 0 and a.id =?")
	public InternetResourceBook findById(Integer id);
	
	@Transactional  
	@Modifying 
	@Query("update InternetResourceBook a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id")Integer id);
	
	
	@Transactional  
	@Modifying 
	@Query("update InternetResourceBook a set a.removed = 1 where a.implementUser =:implementUser")
	public Integer removedByImplementUser(@Param("implementUser")String implementUser);
	
    @QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })  
    public List<InternetResourceBook> findAll();  

    
}
