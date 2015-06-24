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
import com.wonders.frame.iims.model.bo.NetResource;

public interface NetResourceDao extends GenericRepository<NetResource, Integer>{

	public Page<NetResource> findAll(Pageable pageable);
		
	@Query("select a from NetResource a where a.removed = 0 and a.id =?")
	public NetResource findById(Integer id);
	
	@Transactional  
	@Modifying 
	@Query("update NetResource a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id")Integer id);
	
	
    @QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })  
    public List<NetResource> findAll();  
    
    @Query("select a from NetResource a where a.removed = 0 and a.switchDeviceCode =:switchDeviceCode and a.port =:port and (a.applyType='apply' or a.applyType='change') and a.status='finish'")
	public NetResource findFinishApplyBySwitchDeviceCodeAndPort(@Param("switchDeviceCode")String switchDeviceCode,@Param("port")String port);
	
	@Transactional  
	@Modifying 
	@Query("update NetResource a set a.userName =:userName,a.contactPhone=:contactPhone," +
			"a.usePlace=:usePlace,a.applyBusinessType=:applyBusinessType," +
			"a.applyUseTime=:applyUseTime,a.applyReason=:applyReason," +
			"a.equipmentType=:equipmentType,a.implementEngineer=:implementEngineer," +
			"a.implementUser=:implementUser,a.implementTime=:implementTime," +
			"a.implementPlace=:implementPlace,a.applyDept=:applyDept," +
			"a.applyDeptId=:applyDeptId,a.applyType=:applyType," +
			"a.post=:post,a.vlan=:vlan," +
			"a.netStatus=:netStatus,a.interfaceInfo=:interfaceInfo," +
			"a.ip=:ip,a.mac=:mac," +
			"a.gateway=:gateway,a.sysName=:sysName," +
			"a.applyer=:applyer,a.applyerLoginname=:applyerLoginname," +
			"a.applyTime=:applyTime,a.remarks=:remarks " +
			"where a.id =:id")
	public Integer updateAllDataById(@Param("userName")String userName,@Param("contactPhone")String contactPhone,
			@Param("usePlace")String usePlace,@Param("applyBusinessType")String applyBusinessType,
			@Param("applyUseTime")Date applyUseTime,@Param("applyReason")String applyReason,
			@Param("equipmentType")String equipmentType,@Param("implementEngineer")String implementEngineer,
			@Param("implementUser")String implementUser,@Param("implementTime")Date implementTime,
			@Param("implementPlace")String implementPlace,@Param("applyDept")String applyDept,			
			@Param("applyDeptId")String applyDeptId,@Param("applyType")String applyType,
			@Param("post")String post,@Param("vlan")String vlan,
			@Param("netStatus")String netStatus,@Param("interfaceInfo")String interfaceInfo,
			@Param("ip")String ip,@Param("mac")String mac,
			@Param("gateway")String gateway,@Param("sysName")String sysName,
			@Param("applyer")String applyer,@Param("applyerLoginname")String applyerLoginname,
			@Param("applyTime")Date applyTime,@Param("remarks")String remarks,
			@Param("id")Integer id);
	
    
}
