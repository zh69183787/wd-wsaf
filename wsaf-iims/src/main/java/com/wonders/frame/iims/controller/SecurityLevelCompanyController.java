package com.wonders.frame.iims.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.iims.model.bo.SecurityLevelCompany;


@Controller
@RequestMapping("/securityLevelCompany")
public class SecurityLevelCompanyController extends AbstractGenericController<SecurityLevelCompany>{
	
	@RequestMapping(value="/securityLevelCompanyList",method=RequestMethod.GET)
	public String securityLevelCompanyList(Model model,HttpServletRequest request) {	
			 
		 return "common/securityLevelCompanyList";
	}
	@RequestMapping(value="/securityLevelCompanyAdd",method=RequestMethod.GET)
	public String securityLevelCompanyAdd(Model model,HttpServletRequest request) {	
			 
		 return "common/securityLevelCompanyAdd";
	}
	@RequestMapping(value="/securityLevelCompanyEdit",method=RequestMethod.GET)
	public String securityLevelCompanyEdit(Model model,HttpServletRequest request) {	
			 
		 return "common/securityLevelCompanyEdit";
	}

	
}
