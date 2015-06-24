package com.wonders.frame.console.dao;


import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.console.model.bo.Role;
import com.wonders.frame.core.dao.GenericRepository;

public interface RoleDao extends  GenericRepository<Role, Integer>{
	public Role findByName(String name);
	@Query("select a from Role a where a.removed = 0 and a.id =?")
	public Role findById(Integer id);
	
	@Transactional  
	@Modifying 
	@Query("update Role a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id")Integer id);
}
