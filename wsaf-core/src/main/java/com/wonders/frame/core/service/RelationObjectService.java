package com.wonders.frame.core.service;

import java.util.List;

public interface RelationObjectService {
	public List<Object> findNodeObjs(String[] preNode,String[] nextNode,String type);
	
	public List<Object> findObjectsByNextNodeIds(String nextNode, String ids);
	
	public List<Object> findDeptsByUsername(String username);
	
	public List<Object> findPrivilegesByUsername(String username);
	
	public List<Object> findObjsByFieldName(String nodeName,String fieldValue);
}
