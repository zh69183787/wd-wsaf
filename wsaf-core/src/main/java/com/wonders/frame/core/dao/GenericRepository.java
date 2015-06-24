package com.wonders.frame.core.dao;

import java.io.Serializable;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.persistence.Query;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.model.vo.SimplePage;



/**

 * @author mengjie

 * 针对spring data jpa所提供的接口{@link JpaRepository}再次扩展

 * @NoRepositoryBean是必须的

 */

@NoRepositoryBean
public interface GenericRepository<T, ID extends Serializable> 
	extends JpaRepository<T, ID>,JpaSpecificationExecutor<T> {
	
	List<T> findAll(HashMap<String,Object> queryParams,
			LinkedHashMap<String, String> orderby);


	SimplePage<T> findByPage(HashMap<String,Object> queryParams,
			LinkedHashMap<String, String> orderby, Integer pageSize,Integer pageNum);
	
	SimplePage<T> findByPageWithSql(String sql,
			HashMap<String, Object> queryParams, Integer pageSize,
			Integer pageNum);

	SimplePage<T> findByPageWithWhereHql(String whereHql,
			HashMap<String, Object> queryParams, Integer pageSize,
			Integer pageNum);


	SimplePage<T> findByPage(HashMap<String, Object> queryParams,
			String orderby, Integer pageSize, Integer pageNum);

	/**
	 * 
	 * 根据sql语句查询，结果是实体的集合
	 * 
	 * @param sql
	 * 
	 * @param entityClass
	 * 
	 * @return
	 */

	public List<T> findAllBySql(Class<T> entityClass, String sql);
	
	public String getUniqueResultBySql(String sql,HashMap<String,Object> queryParams);

	SimplePage<T> findComplexByPage(HashMap<String, Object> queryParams,HashMap<String, Object> complexParam,
			LinkedHashMap<String, String> orderby, Integer pageSize,
			Integer pageNum);

	//public List<T> findByAttachIds(String[] ids);
	public List<String> findRuleByPIdAndType(Integer pid, String type);
//	@Transactional
//	public void updateModelNameAndModelId(String modelName, Integer modelId, String[] ids);
}
