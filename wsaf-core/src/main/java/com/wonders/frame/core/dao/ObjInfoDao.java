package com.wonders.frame.core.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.model.bo.Attach;
import com.wonders.frame.core.model.bo.ObjInfo;



public interface ObjInfoDao  extends GenericRepository<ObjInfo, Integer>{
	
	
	public ObjInfo findByName(String name);
	@Query("select a from ObjInfo a where a.removed = 0 and a.id =?")
	public ObjInfo findById(Integer id);
	
	@Query("select a from ObjInfo a where a.removed = 0 and a.id in (:ids)")
	public List<ObjInfo> findByIds(@Param("ids") List<Integer> ids);
	
//	@Query("select a from ObjInfo a where a.removed = 0 and a.id in :ids")
	public List<ObjInfo> findByIdIn(@Param("ids") Integer[] ids);
	
	@Transactional  
	@Modifying 
	@Query("update ObjInfo a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id")Integer id);
	
	@Query("select a from ObjInfo a where a.removed=0 and type=?")
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public ObjInfo findByType(String type);
		
	 @Modifying 
	 @Query("update ObjInfo a set a.removed = 1 where a.id in (?)")
	public List<ObjInfo> removeByIds(Integer[] ids);
	 
	//2014-12-12：taoweiwei
	// spring-data-jpa默认继承实现的一些方法
	// 该类中的方法不能通过@QueryHint来实现查询缓存。
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value = "true") })
	public List<ObjInfo> findAll();

	@Query("from ObjInfo")
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value = "true") })
	public List<ObjInfo> findAllCached();
}