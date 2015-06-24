package com.wonders.frame.iims.service;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wonders.frame.core.model.vo.SimplePage;
import com.wonders.frame.iims.crmmodel.bo.DepFaci;
import com.wonders.frame.iims.crmmodel.vo.CrmInfo;
import com.wonders.frame.iims.model.bo.ProjectPlanTarget;
import com.wonders.frame.iims.model.bo.SimpleFlowLog;
import com.wonders.frame.iims.model.bo.SimpleFlowMain;
import com.wonders.frame.iims.model.bo.SimpleFlowNode;

public interface SimpleFlowService {
	
	
	/*public SimplePage<ProjectPlanTarget> findByPageWithSql(String sql,
			HashMap<String, Object> queryParams, Integer pageSize,
			Integer pageNum);
	public SimplePage<ProjectPlanTarget> findByPageWithHql(String sql,
			HashMap<String, Object> queryParams, Integer pageSize,
			Integer pageNum);
*/
	public SimpleFlowMain startFlow(SimpleFlowMain simpleFlowMain, List<SimpleFlowNode> nodes);
	
	public List<SimpleFlowLog> findLogsByFlowCodeStatus(String flowCode,String status);

	public List<SimpleFlowLog> findLogsByLoginName(String flowCode, String status,String userLoginName);

	public List<SimpleFlowLog> findLogsByFinalLoginName(String flowCode, String userLoginName);


	public SimpleFlowMain startFlow(String flowCode,String flowName,String userName,String loginName,String deptName,String deptId);

	public SimpleFlowMain findByFlowCodeWithNowLog(String flowCode);

	public SimpleFlowLog findByOrderIndex(Integer mainId,Long orderIndex);

	public void firstStartFlow(SimpleFlowLog log, HttpServletRequest request);

	public SimpleFlowMain findMainByFlowCode(String flowCode);

	public SimplePage<SimpleFlowMain> findByPageWithHql(String sql,
			HashMap<String, Object> formatQueryParam, int pz, int pn);

}
