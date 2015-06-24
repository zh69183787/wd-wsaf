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

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.dao.GenericRepository;
import com.wonders.frame.iims.model.bo.Power;

/** 
 * @ClassName: MeetingDao 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 */
public interface PowerDao extends GenericRepository<Power, Integer>{

	public Page<Power> findAll(Pageable pageable);
		
	@Query("select a from Power a where a.removed = 0 and a.id =?")
	public Power findById(Integer id);
	
	@Transactional  
	@Modifying 
	@Query("update Power a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id")Integer id);
	
    @QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })  
    public List<Power> findAll();  

}
