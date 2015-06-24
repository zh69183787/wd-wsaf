package com.wonders.frame.iims.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wonders.frame.iims.dao.SecurityPlanDetailDao;
import com.wonders.frame.iims.service.SecurityPlanDetailService;

@Service("securityPlanDetailService")
public class SecurityPlanDetailServiceImpl implements SecurityPlanDetailService{
	
	@Resource
	private SecurityPlanDetailDao securityPlanDetailDao;

	public String findMaxSerialNo(String serialPreFix) {
		Long cnt=this.securityPlanDetailDao.findMaxSerialNo(serialPreFix+'%');
		String maxSerialNo=cnt+1+"";
		String zeroPreFix="";
		for(int i=0;i<3-maxSerialNo.length();i++){
			zeroPreFix+="0";
		}
		return zeroPreFix+maxSerialNo;
	}
}

