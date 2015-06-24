package com.wonders.frame.core.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.model.bo.Relation;
import com.wonders.frame.core.model.vo.NodeObj;



/**
 * @author mengjie
 * log管理
 *
 * 2013-3-30
 */
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public interface RelationService {

	public Relation findById(Integer id);

	public Integer removeByIds(Integer[] ids);
	
	public Relation save(String ptype,Integer pid,
			 String ntype, Integer nid);
	
	public Integer remove(String ptype,Integer pid,String ntype, Integer nid);
	
	public Integer remove(String ptype,Integer pid, String ntype,Integer nid,String type);
	
	public List<Relation> findByPIdAndPType(Integer pid, String ptype);
	
	public List<Relation> findByNIdAndNType(Integer nid, String ntype);
	/*
	public List<Relation> findByPTypeAndNType(String pType, String nType);
	
	public List<Relation> findByPTypeAndPIdAndNType(String pType,Integer pId, String nType);
	
	public List<Relation> findByPTypeAndNTypeAndNId(String pType,String nType,Integer nId);

	public List<Relation> findByPTypeAndPIdAndNTypeAndNId(String pType,Integer pId, String nType,Integer nId);
	*/
	//绑定对象置hashMap
	public void bindNode2ObjDataMap(String[] curNode,Object relatedNode,HashMap<String,List<NodeObj>> hmObjData);
	//根据路径结果集转化为hashMap
	public void convertPath2Map(String pathResult,String op,String nodeType,Object relatedNode,HashMap<String,Object> hmKeyOp);
	//从path参数中获取关联对象和关联符
	public HashMap<String,List<String>> convertPath(String path);
	
	//通过递归查询，获得与url入参path格式一致的结果集()
    public List<String> getPathResult(HashMap<String,List<String>> hmPath);
    
    //2014-1-6：通过递归查询，获得与url入参path格式一致的结果集(重载方法，新增type参数)
	public List<String> getPathResult(HashMap<String,List<String>> hmPath,String type);

	//2014-12-16:添加type参数，重载save方法
	public Relation save(String ptype,Integer pid,String ntype, Integer nid, String type);
	

}