package com.wonders.frame.iims.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.iims.model.bo.SecurityCheck;


@Controller
@RequestMapping("/securityCheck")
public class SecurityCheckController extends AbstractGenericController<SecurityCheck>{
	@RequestMapping(value="/securityCheckAdd",method=RequestMethod.GET)
	public String securityCheckAdd(Model model,HttpServletRequest request) {	
			 
		 return "common/networkSecurityCheckAdd";
	}
	@RequestMapping(value="/securityCheckList",method=RequestMethod.GET)
	public String securityCheckList(Model model,HttpServletRequest request) {	
			 
		 return "common/networkSecurityCheckList";
	}
	@RequestMapping(value="/securityCheckReview",method=RequestMethod.GET)
	public String securityCheckReview(Model model,HttpServletRequest request) {	
			 
		 return "common/networkSecurityCheckReview";
	}
	@RequestMapping(value="/securityCheckDetail",method=RequestMethod.GET)
	public String securityCheckDetail(Model model,HttpServletRequest request) {	
			 
		 return "common/networkSecurityCheckDetail";
	}
	@RequestMapping(value="/securityCheckApply",method=RequestMethod.GET)
	public String securityCheckApply(Model model,HttpServletRequest request) {	
			 
		 return "common/networkSecurityCheckApply";
	}
	@RequestMapping(value="/securityCheckApplyList",method=RequestMethod.GET)
	public String securityCheckApplyList(Model model,HttpServletRequest request) {	
			 
		 return "common/networkSecurityCheckApplyList";
	}
	
}
