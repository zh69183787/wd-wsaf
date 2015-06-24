package com.wonders.frame.iims.dao;

import java.util.Date;
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
import com.wonders.frame.iims.model.bo.VirtualResource;
import com.wonders.frame.iims.model.bo.VpnResource;

public interface VirtualResourceDao extends GenericRepository<VirtualResource, Integer>{

	public Page<VirtualResource> findAll(Pageable pageable);
		
	@Query("select a from VirtualResource a where a.removed = 0 and a.id =?")
	public VirtualResource findById(Integer id);
	
	@Transactional  
	@Modifying 
	@Query("update VirtualResource a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id")Integer id);
	
	
    @QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })  
    public List<VirtualResource> findAll();  

    @Query("select a from VirtualResource a where a.removed = 0 and ip =? and (a.applyType='apply' or a.applyType='change') and a.status='finish'")
	public VirtualResource findFinishApplyByIp(String ip);
	
	@Transactional  
	@Modifying 
	@Query("update VirtualResource a set a.userName =:userName,a.applyUseTime=:applyUseTime," +
			"a.contactPhone=:contactPhone,a.projectId=:projectId," +
			"a.projectName=:projectName,a.projectPrincipal=:projectPrincipal," +
			"a.virtualServer=:virtualServer,a.memory=:memory," +
			"a.cpu=:cpu,a.hardDisk=:hardDisk," +
			"a.opsys=:opsys,a.opsysDescription=:opsysDescription," +
			"a.middleware=:middleware,a.middlewareDescription=:middlewareDescription," +
			"a.db=:db,a.dbDescription=:dbDescription," +
			"a.sysName=:sysName,a.hostName=:hostName," +
			"a.software=:software,a.implementUser=:implementUser," +
			"a.implementTime=:implementTime,a.applyType=:applyType," +
			"a.applyDept=:applyDept,a.applyDeptId=:applyDeptId," +
			"a.applyer=:applyer,a.applyerLoginname=:applyerLoginname," +
			"a.applyTime=:applyTime,a.remarks=:remarks " +
			"where a.id =:id")
	public Integer updateAllDataById(@Param("userName")String userName,@Param("applyUseTime")Date applyUseTime,
			@Param("contactPhone")String contactPhone,@Param("projectId")String projectId,
			@Param("projectName")String projectName,@Param("projectPrincipal")String projectPrincipal,
			@Param("virtualServer")String virtualServer,@Param("memory")String memory,
			@Param("cpu")String cpu,@Param("hardDisk")String hardDisk,
			@Param("opsys")String opsys,@Param("opsysDescription")String opsysDescription,
			@Param("middleware")String middleware,@Param("middlewareDescription")String middlewareDescription,
			@Param("db")String db,@Param("dbDescription")String dbDescription,
			@Param("sysName")String sysName,@Param("hostName")String hostName,
			@Param("software")String software,@Param("implementUser")String implementUser,
			@Param("implementTime")Date implementTime,@Param("applyType")String applyType,
			@Param("applyDept")String applyDept,@Param("applyDeptId")String applyDeptId,
			@Param("applyer")String applyer,@Param("applyerLoginname")String applyerLoginname,
			@Param("applyTime")Date applyTime,@Param("remarks")String remarks,
			@Param("id")Integer id);
}
