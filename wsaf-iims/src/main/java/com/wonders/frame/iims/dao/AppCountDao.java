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
import com.wonders.frame.iims.model.bo.AppCount;

/** 
 * @ClassName: AppCountDao 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 */
public interface AppCountDao extends GenericRepository<AppCount, Integer>{

	public Page<AppCount> findAll(Pageable pageable);
		
	@Query("select a from AppCount a where a.removed = 0 and a.id =?")
	public AppCount findById(Integer id);
	
	@Query("select a from AppCount a where a.removed = 0 and a.dept =:dept and a.deviceNum=:deviceNum")
	public AppCount findByDeptAndDeviceNum(@Param("dept")String dept,@Param("deviceNum")String deviceNum);
	
	@Transactional  
	@Modifying 
	@Query("update AppCount a set a.authorizeOpsys=:authorizeOpsys,a.opsys=:opsys,a.authorizeOa=:authorizeOa,a.oa=:oa,a.authorizeApp=:authorizeApp,a.app=:app where a.removed = 0 and a.id =:id")
	public Integer updateCountNumById(@Param("id")Integer id,
			@Param("authorizeOpsys")Integer authorizeOpsys,@Param("opsys")Integer opsys,
			@Param("authorizeOa")Integer authorizeOa,@Param("oa")Integer oa,
			@Param("authorizeApp")Integer authorizeApp,@Param("app")Integer app);
	
	@Transactional  
	@Modifying 
	@Query("update AppCount a set a.authorizeOpsys=:authorizeOpsys,a.opsys=:opsys,a.authorizeOa=:authorizeOa,a.oa=:oa,a.authorizeApp=:authorizeApp,a.app=:app where a.removed = 0 and a.dept =:dept and a.deviceNum=:deviceNum")
	public Integer updateCountNumByDeptAndDeviceNum(@Param("dept")String dept,@Param("deviceNum")String deviceNum,
			@Param("authorizeOpsys")Integer authorizeOpsys,@Param("opsys")Integer opsys,
			@Param("authorizeOa")Integer authorizeOa,@Param("oa")Integer oa,
			@Param("authorizeApp")Integer authorizeApp,@Param("app")Integer app);
	
	@Transactional  
	@Modifying 
	@Query("update AppCount a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id")Integer id);
	
    @QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })  
    public List<AppCount> findAll();  

}
