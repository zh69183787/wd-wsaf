/** 
* @Title: WorkFlowLogDao.java 
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
import com.wonders.frame.iims.model.bo.WorkflowLog;

/** 
 * @ClassName: WorkFlowLogDao 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 */
public interface WorkflowLogDao extends GenericRepository<WorkflowLog, Integer> {
	@Query("select a from WorkflowLog a where a.removed = 0 and a.id =?")
	public WorkflowLog findById(Integer id);
	
	@Transactional  
	@Modifying 
	@Query("update WorkflowLog a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id")Integer id);
	
	
	@Query("select a from WorkflowLog a where a.removed = 0 and a.handleTime is null and a.PType=:PType and a.PId=:PId order by a.initiateTime desc")
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<WorkflowLog> findUnHandleByPTypeAndPId(@Param("PType")String PType,@Param("PId")Integer PId);
	
}
