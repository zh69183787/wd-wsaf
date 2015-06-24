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
import com.wonders.frame.iims.dao.ProjectPlanImposedDao;
import com.wonders.frame.iims.dao.ProjectPlanTargetDao;
import com.wonders.frame.iims.model.bo.ProjectPlanImposed;
import com.wonders.frame.iims.model.bo.ProjectPlanTarget;
import com.wonders.frame.iims.service.CrmInfoService;
import com.wonders.frame.iims.service.ProjectPlanTargetService;

@Service("projectPlanTargetService")
public class ProjectPlanTargetServiceImpl implements ProjectPlanTargetService{
	
	@Resource
	private ProjectPlanTargetDao projectPlanTargetDao;
	
	@Resource
	private ProjectPlanImposedDao projectPlanImposed;
	
	public SimplePage<ProjectPlanTarget> findByPageWithSql(String sql,
			HashMap<String, Object> queryParams, Integer pageSize,
			Integer pageNum){
		return this.projectPlanTargetDao.findByPageWithSql( sql,
				queryParams,  pageSize,
				 pageNum);
	}

	public SimplePage<ProjectPlanTarget> findByPageWithHql(String hql,
			HashMap<String, Object> queryParams, Integer pageSize,
			Integer pageNum){
		return this.projectPlanTargetDao.findByPageWithHql( hql,
				queryParams,  pageSize,
				 pageNum);
	}

	/*  新增  目标计划填报  及  开启流程
	 * @see com.wonders.frame.iims.service.ProjectPlanTargetService#findImposedByProjectTargetId(java.lang.Integer)
	 */
	@Override
	public ProjectPlanImposed findImposedByProjectTargetId(Integer id) {
		ProjectPlanImposed ppi = projectPlanTargetDao.findImposedByProjectTargetId(id);
		
		if(ppi==null||ppi.getId()==null){
			ppi = new ProjectPlanImposed();
			ppi.setRemoved(0);
			ppi.setProjectTargetId(id);
			ppi = projectPlanImposed.save(ppi);
			// 开启流程信息
			
		}
		
		return ppi;
	}
}
