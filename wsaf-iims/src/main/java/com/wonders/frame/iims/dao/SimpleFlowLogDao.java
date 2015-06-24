/** 
* @Title: MeetingDao.java 
* @Package com.wonders.frame.iims.dao 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.iims.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.dao.GenericRepository;
import com.wonders.frame.iims.model.bo.SimpleFlowLog;

/** 
 * @ClassName: MeetingDao 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 */
public interface SimpleFlowLogDao extends GenericRepository<SimpleFlowLog, Integer>{

	@Query("select a from SimpleFlowLog a where a.removed = 0 and a.id =?")
	public SimpleFlowLog findById(Integer id);
	
	@Query("select a from SimpleFlowLog a where a.removed = 0  and a.flowCode =? and a.status=? order by a.dealTime desc ")
	public List<SimpleFlowLog> findListByFlowCodeStatus(String flowCode,String status);
	
	@Transactional  
	@Modifying 
	@Query("update SimpleFlowLog a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id")Integer id);
	
    @QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })  
    public List<SimpleFlowLog> findAll();

    @Query("select a from SimpleFlowLog a where a.removed = 0  and a.flowCode =? and a.status=? and a.dealUserLoginname=? order by a.dealTime desc ")
	public List<SimpleFlowLog> findLogsByLoginName(String flowCode,	String status, String userLoginName);

    @Query("select a from SimpleFlowLog a,SimpleFlowNode b where a.removed = 0  and a.flowCode =?  and a.dealUserLoginname=? and a.nodeId = b.id and b.orderIndexNext=-1 order by a.dealTime desc ")
	public List<SimpleFlowLog>  findLogsByFinalLoginName(String flowCode,String userLoginName);

    @Query("select a from SimpleFlowLog a where a.removed = 0 and  a.mainId =? and a.orderIndex =? ")
	public SimpleFlowLog findByOrderIndex(Integer mainId,Long orderIndex);

    @Transactional  
	@Modifying 
	@Query("update SimpleFlowLog a set a.status=:status,a.dealTime=:date,a.suggestion=:suggestion where a.id =:id and a.removed = 0 ")
	public void updateStatusTime(@Param("id")Integer id, @Param("status")String status, @Param("date")Date date,@Param("suggestion")String suggestion);

}
