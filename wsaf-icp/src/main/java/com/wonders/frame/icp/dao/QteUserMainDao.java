package com.wonders.frame.icp.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.dao.GenericRepository;
import com.wonders.frame.icp.model.bo.CptComplaint;
import com.wonders.frame.icp.model.bo.QteUserMain;

public interface QteUserMainDao extends GenericRepository<QteUserMain, Integer> {
	@Query("select q from QteUserMain q where q.removed=0 and q.id=?")
	public QteUserMain findById(Integer id);
	
	@Transactional
	@Modifying
	@Query("update QteUserMain q set q.removed=1 where q.id=?")
	public Integer removeById(Integer id);
	
	@Query("select q from QteUserMain q where q.removed=0 and q.mainId=:mainId and q.loginName=:loginName")
	public QteUserMain findByMainIdAndLoginName(@Param("mainId")Integer mainId,@Param("loginName")String loginName);
	
	@QueryHints({@QueryHint(name="org.hibernate.cacheable",value="true")})
	public List<QteUserMain> findAll();

}
