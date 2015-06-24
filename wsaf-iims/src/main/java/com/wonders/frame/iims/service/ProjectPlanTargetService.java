package com.wonders.frame.iims.service;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import com.wonders.frame.core.model.vo.SimplePage;
import com.wonders.frame.iims.crmmodel.bo.DepFaci;
import com.wonders.frame.iims.crmmodel.vo.CrmInfo;
import com.wonders.frame.iims.model.bo.ProjectPlanImposed;
import com.wonders.frame.iims.model.bo.ProjectPlanTarget;

public interface ProjectPlanTargetService {
	
	
	public SimplePage<ProjectPlanTarget> findByPageWithSql(String sql,
			HashMap<String, Object> queryParams, Integer pageSize,
			Integer pageNum);
	public SimplePage<ProjectPlanTarget> findByPageWithHql(String sql,
			HashMap<String, Object> queryParams, Integer pageSize,
			Integer pageNum);

	public ProjectPlanImposed findImposedByProjectTargetId(Integer id);
}
