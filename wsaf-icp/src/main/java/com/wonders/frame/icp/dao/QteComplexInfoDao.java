package com.wonders.frame.icp.dao;

import java.util.List;
import java.util.Map;

import com.wonders.frame.icp.model.vo.QteDeptStatistics;
import com.wonders.frame.icp.model.vo.QteMainDetail;
import com.wonders.frame.icp.model.vo.QteStatistics;

public interface QteComplexInfoDao {
	
	public List<QteMainDetail> findMainDetailByMainId(Integer mainId);

	public Integer findUserCountByMainId(Integer mainId);
	
	public Map<String,Integer> getPieDataOfDeptByMainId(Integer mainId);
	
	public List<Object> getDeptsByMainId(Integer mainId);
	
	public List<QteStatistics> getQteMainByMainId(Integer mainId);
}
