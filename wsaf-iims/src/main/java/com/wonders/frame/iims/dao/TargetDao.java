package com.wonders.frame.iims.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.QueryHints;

import com.wonders.frame.core.dao.GenericRepository;
import com.wonders.frame.iims.model.bo.Target;

public interface TargetDao extends GenericRepository<Target, Integer> {
	
	 @QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })  
	 public List<Target> findAll();  

}
