package com.wonders.frame.iims.crmdao.impl;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.wonders.frame.core.model.vo.PageInfo;
import com.wonders.frame.core.model.vo.SimplePage;
import com.wonders.frame.iims.crmdao.CrmInfoDao;
import com.wonders.frame.iims.crmmodel.bo.DepFaci;
import com.wonders.frame.iims.crmmodel.vo.CrmInfo;

//@Repository("crmInfoDao")
public class CrmInfoDaoImpl implements CrmInfoDao{
	
	@Resource(name="sqlserverEntityManagerFactory")
	private EntityManagerFactory entityManagerFactory;
	
	private EntityManager entityManager;

	public EntityManager getEntityManager(){
		if(entityManager==null){
			entityManager=entityManagerFactory.createEntityManager();
		}
		return entityManager;
	}

	public SimplePage<CrmInfo> findPageBySql(HashMap<String,String> paramMap,LinkedHashMap<String,String> orderBy, Integer pageSize,Integer pageNum) {
		String hqlCount="select count(*) from PcNList p,DepFaci d where p.serialNo=d.serialNo";
		String hqlData="select new com.wonders.frame.iims.crmmodel.vo.CrmInfo"
				   +"("
				   +" p.serialNo,p.faciClass,p.assetNo,d.department,d.department2,p.userName,p.userPhone1,p.brand,p.styleNo,p.coreFire,"
				   +" p.ram,p.hdSize,p.screenSize,p.macAddress,p.ipAddress,p.os"
				   +")"
				   +" from PcNList p,DepFaci d"
				   +" where p.serialNo=d.serialNo";
		//where条件
		if(paramMap!=null && paramMap.size()>0){
			if(!"".equals(paramMap.get("department"))){
				if(!"全部单位".equals(paramMap.get("department"))){
					hqlCount+=" and d.department like '%"+paramMap.get("department")+"%'";
					hqlData+=" and d.department like '%"+paramMap.get("department")+"%'";
				}
			}
		}
		//排序条件
		if(orderBy!=null && orderBy.size()>0){
			hqlData+=" order by";
			for (String key : orderBy.keySet()) {
				if(key.equals("department2")){
					hqlData+=" d."+key+" "+orderBy.get(key)+",";
				}else{
					hqlData+=" p."+key+" "+orderBy.get(key)+",";
				}
			}
			hqlData=hqlData.substring(0,hqlData.length()-1);
		}
		
		//查询总记录数
		Query query = getEntityManager().createQuery(hqlCount); 
		PageInfo pageInfo=new PageInfo(((Long)query.getSingleResult()).intValue(),pageSize);
		pageInfo.refresh(pageNum);
		//分页查询数据
		query = getEntityManager().createQuery(hqlData);
		query.setFirstResult(pageInfo.getStartRecord()).setMaxResults(pageInfo.getPageSize()); 
		return new SimplePage<CrmInfo>(pageInfo,query.getResultList());
	}
	
	
	public CrmInfo findBySerialNo(String serialNo){
		String hql="select new com.wonders.frame.iims.crmmodel.vo.CrmInfo"
				  +"(p.serialNo, p.lineNo,p.buildAddress,"
			      +"p.address, p.userName, p.userPhone1,"
			      +"p.userPhone2,p.assetOwner, p.assetNo, p.brand,"
			      +"p.styleNo, p.computerSn, p.serviceL,p.corePro,"
			      +"p.coreFire, p.ramStyle,p.ram, p.hdRev,"
			      +"p.hdSize, p.disSlotType,p.disChip,"
			      +"p.screenStyle, p.screenSize, p.macAddress,"
			      +"p.ipAddress, p.wifiMacAddress, p.os, p.virWare,"
			      +"p.licL, p.appL, p.ass1, p.ass2, p.ass3,"
			      +"p.recordTime, p.maintainer, p.beizhu, p.mainDep,"
			      +"p.lineNoPro, p.proClass, p.ass1Port,"
			      +"p.ass2Port, p.ass3Port, p.faciClass,"
			      +"p.firstLogTime,d.department,"
			      +"d.department2"
			      +")"
			      +" from PcNList p,DepFaci d"
			      +" where p.serialNo=d.serialNo and p.serialNo=?";
		Query query=getEntityManager().createQuery(hql);
		query.setParameter(1, serialNo);
		CrmInfo crmInfo=(CrmInfo) query.getSingleResult();
		//查询该设备对应的分类
		String sqlFaciType="";
		if(crmInfo.getFaciClass().length()==1){
			sqlFaciType="select f.lei1 as lei1,f.name as name,fc.lei1 as lei2,fc.name as name2"
					   +"from faci_type f left outer join faci_type fc on lower(f.father_lei)=lower(fc.lei1)"
					   +"where lower(?)=lower(f.lei1) and and fc.lei1 is null";
			query=getEntityManager().createNativeQuery(sqlFaciType);
			query.setParameter(1, crmInfo.getFaciClass());
		}else{
//			select fc.lei1 as lei2,fc.name as name2 ,f.lei1 as lei1,f.name as name
//			from (select * from faci_type ft where lower('A')=lower(ft.lei1) and ft.father_lei is null ) fc left outer join faci_type f  
//			                 on  lower(f.father_lei)=lower(fc.lei1)
//			where (f.lei1 is not null and lower('F')=lower(f.lei1)) or (f.lei1 is null)
			sqlFaciType="select f.lei1 as lei1,f.name as name ,fc.lei1 as lei2,fc.name as name2"
					   +" from (select * from faci_type ft where lower(?)=lower(ft.lei1) and ft.father_lei is null ) fc left outer join faci_type f"
					   +" on lower(f.father_lei)=lower(fc.lei1)"
					   +" where (f.lei1 is not null and lower(?)=lower(f.lei1)) or (f.lei1 is null)";
			query=getEntityManager().createNativeQuery(sqlFaciType);
			query.setParameter(1, crmInfo.getFaciClass().substring(0,1));
			query.setParameter(2, crmInfo.getFaciClass().substring(1,2));
		}
		Object[] obj=(Object[])query.getSingleResult();
		if(obj[0]==null){
			obj[0]="";
		}
		if(obj[1]==null){
			obj[1]="";
		}
		crmInfo.setLei1(obj[0].toString());
		crmInfo.setName(obj[1].toString());
		crmInfo.setLei2(obj[2].toString());
		crmInfo.setName2(obj[3].toString());
		return crmInfo; 
	}

	@Override
	public List<CrmInfo> findAllHistoryBySerialNo(String serialNo) {
		String hql="select new com.wonders.frame.iims.crmmodel.vo.CrmInfo"
				  +"("
				  +"p.serialNo, p.lineNo, p.buildAddress,"
			      +"p.address, p.userName, p.userPhone1,"
			      +"p.userPhone2, p.assetOwner, p.assetNo, p.brand,"
			      +"p.styleNo, p.computerSn, p.serviceL, p.corePro,"
			      +"p.coreFire, p.ramStyle, p.ram, p.hdRev,"
			      +"p.hdSize, p.disSlotType, p.disChip,"
			      +"p.screenStyle, p.screenSize, p.macAddress,"
			      +"p.ipAddress, p.wifiMacAddress, p.os, p.virWare,"
			      +"p.licL, p.appL, p.ass1, p.ass2, p.ass3,"
			      +"p.recordTime, p.maintainer, p.beizhu, p.mainDep,"
			      +"p.lineNoPro, p.proClass, p.ass1Port,"
			      +"p.ass2Port, p.ass3Port, p.faciClass,"
			      +"p.firstLogTime, p.endTime, d.department,"
			      +"d.department2"
			      +")"
			      +" from PcNListHis p,DepFaci d"
			      +" where p.serialNo=d.serialNo and p.serialNo=?";
		Query query=getEntityManager().createQuery(hql);
		query.setParameter(1,serialNo);
		List<CrmInfo> crmInfoHises=query.getResultList();
		return crmInfoHises;
	}

	@Override
	public List<DepFaci> findAllDepartment() {
		String hql="select d.department from DepFaci d"
				  +" group by d.department"
				  +" order by case d.department"
				  +" when '上海地铁第一运营有限公司' then 0"
				  +" when '上海地铁第二运营有限公司' then 1"
				  +" when '上海地铁第三运营有限公司' then 2"
				  +" when '上海地铁第四运营有限公司' then 3"
		          +" when '其他' then 5"
		          +" else 4 end";
		Query query=getEntityManager().createQuery(hql);
		List<DepFaci> depFacies=query.getResultList();
		return depFacies;
	}
}
