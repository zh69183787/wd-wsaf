package com.wonders.frame.iims.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.iims.model.bo.SecurityRisk;


@Controller
@RequestMapping("/securityRisk")
public class SecurityRiskController extends AbstractGenericController<SecurityRisk>{
	@RequestMapping(value="/securityRiskList",method=RequestMethod.GET)
	public String securityRiskList(Model model,HttpServletRequest request) {	
			 
		 return "common/securityRiskList";
	}
	@RequestMapping(value="/securityRiskDetail",method=RequestMethod.GET)
	public String securityRiskDetail(Model model,HttpServletRequest request) {	
			 
		 return "common/securityRiskDetail";
	}
	@RequestMapping(value="/securityRiskAdd",method=RequestMethod.GET)
	public String securityRiskAdd(Model model,HttpServletRequest request) {	
			 
		 return "common/securityRiskAdd";
	}
	@RequestMapping(value="/securityRiskEdit",method=RequestMethod.GET)
	public String securityRiskEdit(Model model,HttpServletRequest request) {	
			 
		 return "common/securityRiskEdit";
	}
	@RequestMapping(value="/securityRiskReview",method=RequestMethod.GET)
	public String securityRiskReview(Model model,HttpServletRequest request) {	
			 
		 return "common/securityRiskReview";
	}
	@RequestMapping(value="/securityRiskInfoCenterList",method=RequestMethod.GET)
	public String securityRiskInfoCenterList(Model model,HttpServletRequest request) {	
			 
		 return "common/securityRiskInfoCenterList";
	}
	@RequestMapping(value="/securityRiskPassList",method=RequestMethod.GET)
	public String securityRiskPassList(Model model,HttpServletRequest request) {	
			 
		 return "common/securityRiskPassList";
	}
	
}
