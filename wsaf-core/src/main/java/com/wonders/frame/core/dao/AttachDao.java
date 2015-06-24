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

public interface AttachDao extends GenericRepository<Attach, Integer> {
	@Transactional
	@Modifying
	@Query("update Attach a set a.modelName =:modelName , a.modelId =:modelId where a.id in (:ids)")
	public Integer updateAttachRelation(
			@Param("modelName") String modelName,
			@Param("modelId") String modelId,
			@Param("ids") List<Integer> ids);


	public Page<Attach> findAll(Pageable pageable);

	@Query("select a from Attach a where a.removed = 0 and a.id =?")
	public Attach findById(Integer id);

	@Transactional
	@Modifying
	@Query("update Attach a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id") Integer id);
	
	@Transactional
	@Modifying
	@Query("update Attach a set a.removed = 1 where a.modelName =:modelName and a.modelId =:modelId and a.groupName =:groupName")
	public Integer removeByModelNameAndModelIdAndGroupName(
			@Param("modelName") String modelName,
			@Param("modelId") String modelId,
			@Param("groupName") String groupName);

	// spring-data-jpa默认继承实现的一些方法
	// 该类中的方法不能通过@QueryHint来实现查询缓存。
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value = "true") })
	public List<Attach> findAll();

	@Query("from Attach")
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value = "true") })
	public List<Attach> findAllCached();

}
