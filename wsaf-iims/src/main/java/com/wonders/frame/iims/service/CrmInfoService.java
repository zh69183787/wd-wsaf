package com.wonders.frame.iims.service;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import com.wonders.frame.core.model.vo.SimplePage;
import com.wonders.frame.iims.crmmodel.bo.DepFaci;
import com.wonders.frame.iims.crmmodel.vo.CrmInfo;

public interface CrmInfoService {
	
	public CrmInfo findBySerialNo(String serialNo);
	
	public SimplePage<CrmInfo> findPageBySql(HashMap<String,String> paramMap,LinkedHashMap<String,String> orderBy, Integer pageSize,Integer pageNum);

	public List<CrmInfo> findAllHistoryBySerialNo(String serialNo);
	
	public List<DepFaci> findAllDepartment();
}
