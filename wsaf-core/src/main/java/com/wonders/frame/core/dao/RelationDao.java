package com.wonders.frame.core.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.model.bo.Relation;



public interface RelationDao  extends GenericRepository<Relation, Integer>{
	@Query("select t from Relation t where t.removed = 0 and t.id =?")
	public Relation findById(Integer id);
	
	@Transactional  
	@Modifying 
	@Query("update Relation t set t.removed = 1 where t.id =:id")
	public Integer removeById(@Param("id")Integer id);
	
	@Modifying 
	@Query("update Relation t set t.removed = 1 where t.id in (?)")
	public Integer removeByIds(Integer[] ids);
	 
	@Transactional  
	@Modifying 
	@Query("update Relation t set t.removed = 1 where t.ptype = ?1 and t.pid =?2 and t.ntype=?3 and t.nid =?4")
	public Integer removeByPTypeAndPIdAndNTypeAndNId(String ptype,Integer pid, String ntype,Integer nid);
	
	@Transactional  
	@Modifying 
	@Query("update Relation t set t.removed = 1 where t.ptype = ?1 and t.pid =?2 and t.ntype=?3 and t.nid =?4 and t.type=?5")
	public Integer removeByPTypeAndPIdAndNTypeAndNIdAndType(String ptype,Integer pid, String ntype,Integer nid,String type);
	
	
	@Query("select t from Relation t where t.removed = 0 and t.pid = ?1 and t.ptype=?2")
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<Relation> findByPIdAndPType(Integer pid, String ptype);
	
	@Query("select t from Relation t where t.removed = 0 and t.nid = ?1 and t.ntype=?2")
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<Relation> findByNIdAndNType(Integer nid, String ntype);
	
	
	@Query("select t from Relation t where t.removed = 0 and t.ptype = ?1 and t.ntype=?2")
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<Relation> findByPTypeAndNType(String ptype, String ntype);
	
	//2014-1-6:新增
	@Query("select t from Relation t where t.removed = 0 and t.ptype = ?1 and t.ntype=?2 and t.type=?3")
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<Relation> findByPTypeAndNType(String ptype, String ntype,String type);
	
	
	@Query("select t from Relation t where t.removed = 0 and t.ptype = ?1 and t.pid = ?2 and t.ntype=?3")
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<Relation> findByPTypeAndPIdAndNType(String ptype,Integer pid, String ntype);
	
	//2014-1-6:新增
	@Query("select t from Relation t where t.removed = 0 and t.ptype = ?1 and t.pid = ?2 and t.ntype=?3 and t.type=?4")
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<Relation> findByPTypeAndPIdAndNType(String ptype,Integer pid, String ntype,String type);
	
	@Query("select t from Relation t where t.removed = 0 and t.ptype = ?1 and t.ntype=?2 and t.nid = ?3")
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<Relation> findByPTypeAndNTypeAndNId(String ptype,String ntype,Integer nid);
	
	//2014-1-6:新增
	@Query("select t from Relation t where t.removed = 0 and t.ptype = ?1 and t.ntype=?2 and t.nid = ?3 and t.type=?4")
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<Relation> findByPTypeAndNTypeAndNId(String ptype,String ntype,Integer nid,String type);
	
	@Query("select t from Relation t where t.removed = 0 and t.ptype = ?1 and t.pid = ?2 and t.ntype=?3 and t.nid = ?4")
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<Relation> findByPTypeAndPIdAndNTypeAndNId(String ptype,Integer pid, String ntype,Integer nid);
	
	//2014-1-6:新增
	@Query("select t from Relation t where t.removed = 0 and t.ptype = ?1 and t.pid = ?2 and t.ntype=?3 and t.nid = ?4 and t.type=?5")
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<Relation> findByPTypeAndPIdAndNTypeAndNId(String ptype,Integer pid, String ntype,Integer nid,String type);

	@Query("select t from Relation t where t.removed = 0 and t.ptype = ?1 and t.pid = ?2 and t.ntype=?3 and t.nid = ?4 and t.type=?5")
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public Relation findByPTypeAndPIdAndNTypeAndNIdAndType(String ptype,Integer pid, String ntype, Integer nid, String type);
}