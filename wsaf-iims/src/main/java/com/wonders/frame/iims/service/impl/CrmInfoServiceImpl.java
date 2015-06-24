package com.wonders.frame.iims.service.impl;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wonders.frame.core.model.vo.SimplePage;
import com.wonders.frame.iims.crmdao.CrmInfoDao;
import com.wonders.frame.iims.crmmodel.bo.DepFaci;
import com.wonders.frame.iims.crmmodel.bo.PcNList;
import com.wonders.frame.iims.crmmodel.vo.CrmInfo;
import com.wonders.frame.iims.service.CrmInfoService;

//@Service("crmInfoService")
public class CrmInfoServiceImpl implements CrmInfoService{
	
	@Resource
	private CrmInfoDao crmInfodao;

	@Override
	public CrmInfo findBySerialNo(String serialNo) {
		return this.crmInfodao.findBySerialNo(serialNo) ;
	}
	public SimplePage<CrmInfo> findPageBySql(HashMap<String,String> paramMap,LinkedHashMap<String,String> orderBy, Integer pageSize,Integer pageNum){
		return this.crmInfodao.findPageBySql(paramMap,orderBy, pageSize, pageNum);
	}
	@Override
	public List<CrmInfo> findAllHistoryBySerialNo(String serialNo) {
		return this.crmInfodao.findAllHistoryBySerialNo(serialNo);
	}
	
	public List<DepFaci> findAllDepartment(){
		return this.crmInfodao.findAllDepartment();
	}
}
