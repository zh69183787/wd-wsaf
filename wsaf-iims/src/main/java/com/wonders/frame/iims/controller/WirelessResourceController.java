package com.wonders.frame.iims.controller;


import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.core.utils.DateFormatUtil;
import com.wonders.frame.iims.model.bo.WirelessResource;
import com.wonders.frame.iims.service.CrmInfoService;
import com.wonders.frame.iims.service.WirelessResourceService;


@Controller
@RequestMapping("/wirelessResource")
public class WirelessResourceController extends AbstractGenericController<WirelessResource>{
	
	@Resource
	private WirelessResourceService wirelessResourceService;
	//-------------------无线网络---------------------------------------------
	@RequestMapping(value="/wirelessNetAdd",method=RequestMethod.GET)
	public String wirelessNetAdd(Model model,HttpServletRequest request) {
			 
		 return "common/wirelessNetAdd";
	}
	@RequestMapping(value="/wirelessNetList",method=RequestMethod.GET)
	public String wirelessNetList(Model model,HttpServletRequest request) {	
			 
		 return "common/wirelessNetList";
	}
	@RequestMapping(value="/wirelessNetDetail",method=RequestMethod.GET)
	public String wirelessNetDetail(Model model,HttpServletRequest request) {	
			 
		 return "common/wirelessNetDetail";
	}
	@RequestMapping(value="/wirelessNetReviewDetail",method=RequestMethod.GET)
	public String wirelessNetReviewDetail(Model model,HttpServletRequest request) {	
			 
		 return "common/wirelessNetReviewDetail";
	}
	
	@RequestMapping(value="/wirelessWaitForImplement",method=RequestMethod.GET)
	public String wirelessWaitForImplement(Model model,HttpServletRequest request) {	
			 
		 return "common/wirelessWaitForImplement";
	}
	
	@RequestMapping(value="/getSerialNo",method=RequestMethod.GET)
	@ResponseBody 
	public HashMap<String,String> getSerialNo() {	
		String daily=DateFormatUtil.timeFormat("yyyyMMdd", new Date());
		String serialNo=wirelessResourceService.findDailyMaxSerialNo(daily);	
		HashMap<String,String> result=new HashMap<String,String>();
		result.put("serialNo", daily+"-"+serialNo);
		return result;
	}
	
	
	
	
}
