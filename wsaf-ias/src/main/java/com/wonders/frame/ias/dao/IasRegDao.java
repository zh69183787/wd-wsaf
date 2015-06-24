package com.wonders.frame.ias.dao;

import com.wonders.frame.core.dao.GenericRepository;
import com.wonders.frame.ias.model.bo.IasReg;
import com.wonders.frame.ias.model.bo.IasStaff;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.QueryHint;
import java.util.List;

public interface IasRegDao extends GenericRepository<IasReg, Integer>{

	public Page<IasReg> findAll(Pageable pageable);
		
	@Query("select a from IasStaff a where a.removed = 0 and a.id =?")
	public IasStaff findById(Integer id);
	
	@Transactional  
	@Modifying 
	@Query("update IasReg a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id") Integer id);
	
	
    @QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })  
    public List<IasReg> findAll();
}
