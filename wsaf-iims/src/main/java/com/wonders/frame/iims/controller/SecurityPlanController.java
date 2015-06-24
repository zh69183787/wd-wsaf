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
import com.wonders.frame.iims.model.bo.SecurityPlan;
import com.wonders.frame.iims.service.SecurityPlanDetailService;
import com.wonders.frame.iims.service.WirelessResourceService;


@Controller
@RequestMapping("/securityPlan")
public class SecurityPlanController extends AbstractGenericController<SecurityPlan>{
	
	@Resource
	private SecurityPlanDetailService securityPlanDetailService;
	
	@RequestMapping(value="/securityPlanList",method=RequestMethod.GET)
	public String securityPlanList(Model model,HttpServletRequest request) {	
			 
		 return "common/securityPlanList";
	}
	
	@RequestMapping(value="/securityPlanEdit",method=RequestMethod.GET)
	public String securityPlanEdit(Model model,HttpServletRequest request) {	
			 
		 return "common/securityPlanEdit";
	}
	
	@RequestMapping(value="/securityPlanAdd",method=RequestMethod.GET)
	public String securityPlanAdd(Model model,HttpServletRequest request) {	
			 
		 return "common/securityPlanAdd";
	}
	
	@RequestMapping(value="/securityPlanInfo",method=RequestMethod.GET)
	public String securityPlanInfo(Model model,HttpServletRequest request) {	
			 
		 return "common/securityPlanInfo";
	}
	
	@RequestMapping(value="/securityPlanDetail",method=RequestMethod.GET)
	public String securityPlanDetail(Model model,HttpServletRequest request) {	
			 
		 return "common/securityPlanDetail";
	}
	
	@RequestMapping(value="/securityPlanDetailAdd",method=RequestMethod.GET)
	public String securityPlanDetailAdd(Model model,HttpServletRequest request) {	
			 
		 return "common/securityPlanDetailAdd";
	}
	
	@RequestMapping(value="/securityPlanDetailEdit",method=RequestMethod.GET)
	public String securityPlanDetailEdit(Model model,HttpServletRequest request) {	
			 
		 return "common/securityPlanDetailEdit";
	}
	
	@RequestMapping(value="/securityPlanInfoCenterList",method=RequestMethod.GET)
	public String securityPlanInfoCenterList(Model model,HttpServletRequest request) {	
			 
		 return "common/securityPlanInfoCenterList";
	}
	
	@RequestMapping(value="/securityPlanReview",method=RequestMethod.GET)
	public String securityPlanReview(Model model,HttpServletRequest request) {	
			 
		 return "common/securityPlanReview";
	}
	
	@RequestMapping(value="/securityPlanReviewInfoCenter",method=RequestMethod.GET)
	public String securityPlanReviewInfoCenter(Model model,HttpServletRequest request) {	
			 
		 return "common/securityPlanReviewInfoCenter";
	}
	@RequestMapping(value="/securityPlanReviewInfoLeader",method=RequestMethod.GET)
	public String securityPlanReviewInfoLeader(Model model,HttpServletRequest request) {	
			 
		 return "common/securityPlanReviewInfoLeader";
	}
	
	@RequestMapping(value="/securityPlanPassList",method=RequestMethod.GET)
	public String securityPlanPassList(Model model,HttpServletRequest request) {	
			 
		 return "common/securityPlanPassList";
	}
	
	@RequestMapping(value="/securityPlanPassChange",method=RequestMethod.GET)
	public String securityPlanPassChange(Model model,HttpServletRequest request) {	
			 
		 return "common/securityPlanPassChange";
	}
	
	@RequestMapping(value="/securityPlanPassAttachment",method=RequestMethod.GET)
	public String securityPlanPassAttachment(Model model,HttpServletRequest request) {	
			 
		 return "common/securityPlanPassAttachment";
	}
	@RequestMapping(value="/securityPlanReviewPassList",method=RequestMethod.GET)
	public String securityPlanReviewPassList(Model model,HttpServletRequest request) {	
			 
		 return "common/securityPlanReviewPassList";
	}
	
	@RequestMapping(value="/getSerialNo",method=RequestMethod.GET)
	@ResponseBody 
	public HashMap<String,String> getSerialNo(HttpServletRequest request) {	
		String type=request.getParameter("type");
		String year=request.getParameter("year");
		String serialNoPreFix=year+"-XA-"+type;
		String serialNo=securityPlanDetailService.findMaxSerialNo(serialNoPreFix);	
		HashMap<String,String> result=new HashMap<String,String>();
		result.put("serialNo", serialNoPreFix+"-"+serialNo);
		return result;
	}
}
