package com.wonders.frame.iims.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wonders.frame.iims.dao.ProjectPlanImposedDao;
import com.wonders.frame.iims.dao.ProjectPlanTargetDao;
import com.wonders.frame.iims.service.ProjectPlanImposedService;
@Service("projectPlanImposedService")
public class ProjectPlanImposedServiceImpl implements ProjectPlanImposedService{
	
	@Resource
	private ProjectPlanTargetDao projectPlanTargetDao;
	
	@Resource
	private ProjectPlanImposedDao projectPlanImposed;
	
	
	public void finishFlow(Integer imposedId) {
		
		projectPlanTargetDao.finishFlow(imposedId);
	}
}
