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
import com.wonders.frame.core.utils.ReflectUtil;
import com.wonders.frame.iims.model.bo.WirelessResource;

public interface WirelessResourceDao extends GenericRepository<WirelessResource, Integer>{

	public Page<WirelessResource> findAll(Pageable pageable);
		
	@Query("select a from WirelessResource a where a.removed = 0 and a.id =?")
	public WirelessResource findById(Integer id);
	
	@Query("select a from WirelessResource a where a.removed = 0 and a.macAddress =? and (a.applyType='apply' or a.applyType='change') and a.status='finish'")
	public WirelessResource findFinishApplyByMacAddress(String macAddress);
	
	@Query("select count(*) from WirelessResource a where a.removed = 0 and a.businessCode like ?")
	public Long findDailyMaxSerialNo(String daily);
	
	
	@Transactional  
	@Modifying 
	@Query("update WirelessResource a set a.accountName =:accountName,"
			+ "a.applyBusinessType=:applyBusinessType,a.businessCode=:businessCode,"
			+ "a.startDate=:startDate,a.endDate=:endDate,"
			+ "a.companyName=:companyName,a.staffCardId=:staffCardId,"
			+ "a.applyDept=:applyDept,a.applyDeptId=:applyDeptId,"
			+ "a.applyer=:applyer,a.applyerLoginname=:applyerLoginname,"
			+ "a.applyReason=:applyReason,a.applyTime=:applyTime,"
			+ "a.applyType=:applyType,a.applyUseTime=:applyUseTime,"
			+ "a.contactPhone=:contactPhone,a.equipmentType=:equipmentType,"
			+ "a.handledCondition=:handledCondition,a.implementEngineer=:implementEngineer,a.implementUser=:implementUser,"
			+ "a.implementTime=:implementTime,a.remarks=:remarks,"
			+ "a.usePlace=:usePlace,a.usePosition=:usePosition,a.usePosition2=:usePosition2,"
			+ "a.userName=:userName,a.userPost=:userPost where a.id =:id")
	public Integer updateAllDataById(@Param("accountName")String accountName,@Param("applyBusinessType")String applyBusinessType,
			@Param("businessCode")String businessCode,
			@Param("startDate")String startDate,@Param("endDate")String endDate,
			@Param("companyName")String companyName,@Param("staffCardId")String staffCardId,
			@Param("applyDept")String applyDept,@Param("applyDeptId")String applyDeptId,
			@Param("applyer")String applyer,@Param("applyerLoginname")String applyerLoginname,
			@Param("applyReason")String applyReason,@Param("applyTime")Date applyTime,
			@Param("applyType")String applyType,@Param("applyUseTime")Date applyUseTime,
			@Param("contactPhone")String contactPhone,@Param("equipmentType")String equipmentType,
			@Param("handledCondition")String handledCondition,@Param("implementEngineer")String implementEngineer,
			@Param("implementUser")String implementUser,
			@Param("implementTime")Date implementTime,@Param("remarks")String remarks,
			@Param("usePlace")String usePlace,@Param("usePosition")String usePosition,@Param("usePosition2")String usePosition2,
			@Param("userName")String userName,@Param("userPost")String userPost,
			@Param("id")Integer id);
	
	@Transactional  
	@Modifying 
	@Query("update WirelessResource a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id")Integer id);
	
    @QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })  
    public List<WirelessResource> findAll();  

    
}
