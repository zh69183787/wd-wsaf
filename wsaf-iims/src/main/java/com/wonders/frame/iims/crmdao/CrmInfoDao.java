package com.wonders.frame.iims.crmdao;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import com.wonders.frame.core.model.vo.SimplePage;
import com.wonders.frame.iims.crmmodel.bo.DepFaci;
import com.wonders.frame.iims.crmmodel.vo.CrmInfo;

public interface CrmInfoDao {
	/**
	 * 根据设备编号查询设备信息
	 * @param serialNo  设备编码/设备编号
	 * @return
	 */
	public CrmInfo findBySerialNo(String serialNo);
	
	/**
	 * 分页查询
	 * @param paramMap
	 * @param orderBy
	 * @param pageSize
	 * @param pageNum
	 * @return
	 */
	public SimplePage<CrmInfo> findPageBySql(HashMap<String,String> paramMap,LinkedHashMap<String,String> orderBy, Integer pageSize,Integer pageNum);
	
	/**
	 * 查询指定设备编码下的历史记录
	 * @param serialNo   设备编码/设备编号
	 * @return
	 */
	public List<CrmInfo> findAllHistoryBySerialNo(String serialNo);
	
	/**
	 * 查询出CRM当前存在记录的所有单位
	 * @return
	 */
	public List<DepFaci> findAllDepartment();
}
