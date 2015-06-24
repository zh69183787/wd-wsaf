package com.wonders.frame.core.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.wonders.frame.core.dao.RelationObjectDao;
import com.wonders.frame.core.model.bo.Relation;

@Repository("relationObjectDao")
public class RelationObjectDaoImpl implements RelationObjectDao {
	
	@PersistenceContext
	protected EntityManager em;

	@SuppressWarnings("unchecked")
	@Override
	public List<Relation> findRelationsByPreNodeAndNextNode(String[] preNode,String[] nextNode, String type) {
		
		String jpql="select o from Relation o where";
		jpql+=" o.ptype='"+preNode[0].trim()+"'";
		if(preNode.length==2){
			jpql+=" and o.pid="+Integer.parseInt(preNode[1].trim());
		}
		
		jpql+=" and o.ntype='"+nextNode[0].trim()+"'";
		if(nextNode.length==2){
			jpql+=" and o.nid="+Integer.parseInt(nextNode[1].trim());
		}
		
		jpql+=" and o.type='"+type.trim()+"'";
		Query query=em.createQuery(jpql);
		List<Relation> relations=query.getResultList();
		return relations;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Object> findNodeObjsByNextNodeIds(String nextNode,String ids){
		String jpql="select distinct o from "+StringUtils.capitalize(nextNode.trim())+" o where o.id in ("+ids+")";
		Query query=em.createQuery(jpql);
		List<Object> objs=query.getResultList();
		return objs;
	}
	
	@SuppressWarnings("unchecked")
	public List<Object> findObjsByFieldName(String nodeName,String fieldValue){
		String jpql="select distinct o from "+StringUtils.capitalize(nodeName.trim())+" o where o.name = :fieldValue";
		Query query=em.createQuery(jpql).setParameter("fieldValue", fieldValue);
		List<Object> objs=query.getResultList();
		return objs;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Object> findDeptsByUsername(String username) {
		String jpql="select o.name,o.type,o.description from Relation re,Organ o,User u "
				   +"where u.id=re.nid and re.pid =o.id and u.name=:username";
		Query query=em.createQuery(jpql).setParameter("username", username);
		return query.getResultList();
	}


	@Override
	public List<Object> findPrivilegesByUsername(String username) {
		String jpql="select p.name,p.type from Relation re,Privilege p,User u "
				   +"where u.id=re.pid and re.nid=p.id and u.name=:username";
		Query query=em.createQuery(jpql).setParameter("username", username);
		return query.getResultList();
	}

}
