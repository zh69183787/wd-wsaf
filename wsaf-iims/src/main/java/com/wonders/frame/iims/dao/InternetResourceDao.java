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
import com.wonders.frame.iims.model.bo.AccountResource;
import com.wonders.frame.iims.model.bo.InternetResource;

public interface InternetResourceDao extends GenericRepository<InternetResource, Integer>{

	public Page<InternetResource> findAll(Pageable pageable);
		
	@Query("select a from InternetResource a where a.removed = 0 and a.id =?")
	public InternetResource findById(Integer id);
	
	@Transactional  
	@Modifying 
	@Query("update InternetResource a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id")Integer id);
	
	
    @QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })  
    public List<InternetResource> findAll();  

    @Query("select a from InternetResource a where a.removed = 0 and a.implementUser =? and (a.applyType='apply' or a.applyType='change') and a.status='finish'")
	public InternetResource findFinishApplyByImplementUser(String implementUser);

	@Transactional  
	@Modifying 
	@Query("update InternetResource a set a.userName =:userName,a.contactPhone=:contactPhone," +
			"a.usePlace=:usePlace,a.dept=:dept,a.post=:post," +
			"a.equipmentType=:equipmentType,a.applyUseTime=:applyUseTime," +
			"a.applyReason=:applyReason,a.implementEngineer=:implementEngineer," +
			"a.implementTime=:implementTime,a.implementPlace=:implementPlace," +
			"a.applyBusinessType=:applyBusinessType,a.applyDept=:applyDept," +
			"a.applyDeptId=:applyDeptId,a.applyType=:applyType," +
			"a.applyer=:applyer,a.applyerLoginname=:applyerLoginname," +
			"a.applyTime=:applyTime,a.remarks=:remarks " +
			"where a.id =:id")
	public Integer updateAllDataById(@Param("userName")String userName,@Param("contactPhone")String contactPhone,
			@Param("usePlace")String usePlace,@Param("dept")String dept,@Param("post")String post,
			@Param("equipmentType")String equipmentType,@Param("applyUseTime")Date applyUseTime,
			@Param("applyReason")String applyReason,@Param("implementEngineer")String implementEngineer,
			@Param("implementTime")Date implementTime,@Param("implementPlace")String implementPlace,
			@Param("applyBusinessType")String applyBusinessType,@Param("applyDept")String applyDept,
			@Param("applyDeptId")String applyDeptId,@Param("applyType")String applyType,
			@Param("applyer")String applyer,@Param("applyerLoginname")String applyerLoginname,
			@Param("applyTime")Date applyTime,@Param("remarks")String remarks,
			@Param("id")Integer id);
	
}
