/** 
* @Title: MeetingDao.java 
* @Package com.wonders.frame.iims.dao 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.iims.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.dao.GenericRepository;
import com.wonders.frame.iims.model.bo.SimpleFlowNode;

/** 
 * @ClassName: MeetingDao 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 */
public interface SimpleFlowNodeDao extends GenericRepository<SimpleFlowNode, Integer>{

		
	@Query("select a from SimpleFlowNode a where a.removed = 0 and a.id =?")
	public SimpleFlowNode findById(Integer id);
	
	@Query("select a from SimpleFlowNode a where a.removed = 0 and a.flowTypeCode =?  order by a.orderIndex asc ")
	public List<SimpleFlowNode> findListByFlowTypeCode(String flowTypeCode);
	
	@Transactional  
	@Modifying 
	@Query("update SimpleFlowNode a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id")Integer id);
	
    @QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })  
    public List<SimpleFlowNode> findAll();  

}
