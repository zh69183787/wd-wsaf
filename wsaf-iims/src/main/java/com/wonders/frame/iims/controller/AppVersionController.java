package com.wonders.frame.iims.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.iims.model.bo.AppVersion;


@Controller
@RequestMapping("/appVersion")
public class AppVersionController extends AbstractGenericController<AppVersion>{
	@RequestMapping(value="/AppVersionList",method=RequestMethod.GET)
	public String AppVersionList(Model model,HttpServletRequest request) {	
			 
		 return "common/appVersionList";
	}
	
	@RequestMapping(value="/AppVersionAdd",method=RequestMethod.GET)
	public String AppVersionAdd(Model model,HttpServletRequest request) {	
			 
		 return "common/appVersionAdd";
	}
	
	@RequestMapping(value="/AppVersionModify",method=RequestMethod.GET)
	public String AppVersionModify(Model model,HttpServletRequest request) {	
			 
		 return "common/appVersionModify";
	}
	
}
