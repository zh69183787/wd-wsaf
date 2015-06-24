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
import com.wonders.frame.iims.model.bo.SimpleFlowMain;

/** 
 * @ClassName: MeetingDao 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 */
public interface SimpleFlowMainDao extends GenericRepository<SimpleFlowMain, Integer>{

		
	@Query("select a from SimpleFlowMain a where a.removed = 0 and a.id =?")
	public SimpleFlowMain findById(Integer id);
	
	@Query("select a from SimpleFlowMain a where a.removed = 0 and a.flowCode =?")
	public SimpleFlowMain findByFlowCode(String flowCode);
	
	@Transactional  
	@Modifying 
	@Query("update SimpleFlowMain a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id")Integer id);
	
    @QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })  
    public List<SimpleFlowMain> findAll();
    
    @Transactional  
   	@Modifying 
    @Query("update SimpleFlowMain a set a.status=:status,a.statusDetail=:statusDetail where a.id =:mainId and a.removed = 0 ")
	public void updateStatusTime(@Param("mainId")Integer mainId,@Param("status") String status, @Param("statusDetail")String statusDetail);  

	/*@Query("update SimpleFlowLog a set a.status=:status,a.dealTime=:date where a.id =:id and a.removed = 0 ")
	public void updateStatusTime(@Param("id")Integer id, @Param("status")String status, @Param("date")Date date);*/
}
