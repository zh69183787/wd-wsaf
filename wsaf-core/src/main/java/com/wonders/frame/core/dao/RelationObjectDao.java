package com.wonders.frame.core.dao;

import java.util.List;

import com.wonders.frame.core.model.bo.Relation;

public interface RelationObjectDao {

	/**
	 * 根据上级节点、下级节点查找对应下级节点的详细信息
	 * @param preNode
	 *               proNode[0]:上级节点对象   
	 *               preNode[1]:上级节点编号 
	 *               长度至少为1，此时只存在上级点对象；长度为2时，都存在
	 * @param nextNode
	 *               nextNode[0]:下级节点对象 
	 *               nextNode[1]:下级节点编号
	 *               长度至少为1，此时只存在下级点对象；长度为2时，都存在
	 * @param type 配置规则
	 * @return     
	 */
	public List<Relation> findRelationsByPreNodeAndNextNode(String[] preNode,String[] nextNode, String type);
	
	/**
	 * 根据id集合查询出所有指定节点对象的数据
	 * @param nextNode
	 * @param ids
	 * @return
	 */
	public List<Object> findNodeObjsByNextNodeIds(String nextNode,String ids);
	
	/**
	 * 根据用户查询其部门
	 * @return
	 */
	public List<Object> findDeptsByUsername(String username);
	
	
	/**
	 * 根据用户查询其权限
	 * @param username
	 * @return
	 */
	public List<Object> findPrivilegesByUsername(String username);

	public List<Object> findObjsByFieldName(String nodeName,String fieldValue);
}
