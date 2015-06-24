package com.wonders.frame.core.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.dao.RelationObjectDao;
import com.wonders.frame.core.model.bo.Relation;
import com.wonders.frame.core.service.RelationObjectService;

@Service("relationObjectService")
@Transactional
public class RelationObjectServiceImpl implements RelationObjectService {
	
	@Resource
	private RelationObjectDao relationObjectDao;

	@Transactional(readOnly=true)
	public List<Object> findNodeObjs(String[] preNode, String[] nextNode,String type) {
		List<Relation> relations=relationObjectDao.findRelationsByPreNodeAndNextNode(preNode, nextNode, type);
		if(relations==null){
			return null;
		}
		
		String ids="";
		for(Relation relation:relations){
			ids+=relation.getNid()+",";
		}
		ids=ids.substring(0,ids.length()-1);
		List<Object> objs=relationObjectDao.findNodeObjsByNextNodeIds(relations.get(0).getNtype(),ids);
		return objs;
	}

	@Transactional(readOnly=true)
	public List<Object> findObjectsByNextNodeIds(String nextNode, String ids) {
		return relationObjectDao.findNodeObjsByNextNodeIds(nextNode,ids);
	}

	@Override
	public List<Object> findDeptsByUsername(String username) {
		return relationObjectDao.findDeptsByUsername(username);
	}

	@Override
	public List<Object> findPrivilegesByUsername(String username) {
		return relationObjectDao.findPrivilegesByUsername(username);
	}
	
	public List<Object> findObjsByFieldName(String nodeName,String fieldValue){
		return relationObjectDao.findObjsByFieldName(nodeName, fieldValue);
	}
}
