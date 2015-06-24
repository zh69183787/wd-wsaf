package com.wonders.frame.iims.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.iims.model.bo.SecurityIssue;


@Controller
@RequestMapping("/securityIssue")
public class SecurityIssueController extends AbstractGenericController<SecurityIssue>{
	@RequestMapping(value="/securityIssueList",method=RequestMethod.GET)
	public String securityIssueList(Model model,HttpServletRequest request) {	
			 
		 return "common/securityIssueList";
	}
	@RequestMapping(value="/securityIssueDetail",method=RequestMethod.GET)
	public String securityIssueDetail(Model model,HttpServletRequest request) {	
			 
		 return "common/securityIssueDetail";
	}
	@RequestMapping(value="/securityIssueAdd",method=RequestMethod.GET)
	public String securityIssueAdd(Model model,HttpServletRequest request) {	
			 
		 return "common/securityIssueAdd";
	}
	@RequestMapping(value="/securityIssueEdit",method=RequestMethod.GET)
	public String securityIssueEdit(Model model,HttpServletRequest request) {	
			 
		 return "common/securityIssueEdit";
	}
	@RequestMapping(value="/securityIssueReview",method=RequestMethod.GET)
	public String securityIssueReview(Model model,HttpServletRequest request) {	
			 
		 return "common/securityIssueReview";
	}
	@RequestMapping(value="/securityIssueInfoCenterList",method=RequestMethod.GET)
	public String securityIssueInfoCenterList(Model model,HttpServletRequest request) {	
			 
		 return "common/securityIssueInfoCenterList";
	}
	@RequestMapping(value="/securityIssuePassList",method=RequestMethod.GET)
	public String securityIssuePassList(Model model,HttpServletRequest request) {	
			 
		 return "common/securityIssuePassList";
	}
	
}
