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
import com.wonders.frame.iims.model.bo.AccountResourceBook;

public interface AccountResourceBookDao extends GenericRepository<AccountResourceBook, Integer>{

	public Page<AccountResourceBook> findAll(Pageable pageable);
		
	@Query("select a from AccountResourceBook a where a.removed = 0 and a.id =?")
	public AccountResourceBook findById(Integer id);
	
	@Transactional  
	@Modifying 
	@Query("update AccountResourceBook a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id")Integer id);
	
	@Transactional  
	@Modifying 
	@Query("update AccountResourceBook a set a.removed = 1 where a.accountName =:accountName")
	public Integer removedByAccountName(@Param("accountName")String accountName);
	
    @QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })  
    public List<AccountResourceBook> findAll();  

    
}
