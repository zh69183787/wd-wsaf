package com.wonders.frame.cpq.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.dao.GenericRepository;
import com.wonders.frame.cpq.model.bo.CptComplaint;

public interface CptComplaintDao extends GenericRepository<CptComplaint, Integer> {
	
	@Query("select c from CptComplaint c where c.removed=0 and c.id=?")
	public CptComplaint findById(Integer id);
	
	@Transactional
	@Modifying
	@Query("update CptComplaint c set c.removed=1 where c.id=?")
	public Integer removeById(Integer id);
	
	
	@QueryHints({@QueryHint(name="org.hibernate.cacheable",value="true")})
	public List<CptComplaint> findAll();

}
