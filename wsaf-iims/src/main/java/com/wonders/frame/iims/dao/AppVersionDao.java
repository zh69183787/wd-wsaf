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
import com.wonders.frame.iims.model.bo.AppVersion;

/** 
 * @ClassName: AppVersionDao 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 */
public interface AppVersionDao extends GenericRepository<AppVersion, Integer>{

	public Page<AppVersion> findAll(Pageable pageable);
		
	@Query("select a from AppVersion a where a.removed = 0 and a.id =?")
	public AppVersion findById(Integer id);
	
	@Transactional  
	@Modifying 
	@Query("update AppVersion a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id")Integer id);
	
	@Transactional  
	@Modifying 
	@Query("update AppVersion a set a.removed = 1 where a.dept =:dept and a.deviceNum=:deviceNum")
	public Integer removedByDeptAndDeviceNum(@Param("dept")String dept,@Param("deviceNum")String deviceNum);
	
    @QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })  
    public List<AppVersion> findAll();  

}
