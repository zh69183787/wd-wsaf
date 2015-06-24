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
import com.wonders.frame.iims.model.bo.VpnResource;

public interface VpnResourceDao extends GenericRepository<VpnResource, Integer>{

	public Page<VpnResource> findAll(Pageable pageable);
		
	@Query("select a from VpnResource a where a.removed = 0 and a.id =?")
	public VpnResource findById(Integer id);
	
	@Transactional  
	@Modifying 
	@Query("update VpnResource a set a.removed = 1 where a.id =:id")
	public Integer removeById(@Param("id")Integer id);
	
	
    @QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })  
    public List<VpnResource> findAll();  

    @Query("select a from VpnResource a where a.removed = 0 and a.accountName =? and (a.applyType='apply' or a.applyType='change') and a.status='finish'")
	public VpnResource findFinishApplyByAccountName(String accountName);
	
	@Transactional  
	@Modifying 
	@Query("update VpnResource a set a.userName =:userName,a.contactPhone=:contactPhone," +
			"a.applyBusinessType=:applyBusinessType,a.applyUseTime=:applyUseTime," +
			"a.applyReason=:applyReason,a.implementEngineer=:implementEngineer," +
			"a.implementUser=:implementUser,a.implementTime=:implementTime," +
			"a.post=:post,a.permissions=:permissions," +
			"a.userGroup=:userGroup,a.applyDept=:applyDept," +
			"a.applyDeptId=:applyDeptId,a.applyType=:applyType," +
			"a.applyer=:applyer,a.applyerLoginname=:applyerLoginname," +
			"a.applyTime=:applyTime,a.remarks=:remarks " +
			"where a.id =:id")
	public Integer updateAllDataById(@Param("userName")String userName,@Param("contactPhone")String contactPhone,
			@Param("applyBusinessType")String applyBusinessType,@Param("applyUseTime")Date applyUseTime,
			@Param("applyReason")String applyReason,@Param("implementEngineer")String implementEngineer,
			@Param("implementUser")String implementUser,@Param("implementTime")Date implementTime,
			@Param("post")String post,@Param("permissions")String permissions,
			@Param("userGroup")String userGroup,@Param("applyDept")String applyDept,
			@Param("applyDeptId")String applyDeptId,@Param("applyType")String applyType,
			@Param("applyer")String applyer,@Param("applyerLoginname")String applyerLoginname,
			@Param("applyTime")Date applyTime,@Param("remarks")String remarks,
			@Param("id")Integer id);
}
