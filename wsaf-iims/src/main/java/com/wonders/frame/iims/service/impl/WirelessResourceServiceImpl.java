package com.wonders.frame.iims.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wonders.frame.iims.dao.WirelessResourceDao;
import com.wonders.frame.iims.service.WirelessResourceService;

@Service("wirelessResourceService")
public class WirelessResourceServiceImpl implements WirelessResourceService{
	
	@Resource
	private WirelessResourceDao wirelessResourceDao;

	public String findDailyMaxSerialNo(String daily) {
		Long cnt=this.wirelessResourceDao.findDailyMaxSerialNo('%'+daily+'%');
		String serialNo=cnt+1+"";
		String preFix="";
		for(int i=0;i<3-serialNo.length();i++){
			preFix+="0";
		}
		return preFix+serialNo;
	}
}

