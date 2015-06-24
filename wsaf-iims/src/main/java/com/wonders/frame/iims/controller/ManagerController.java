package com.wonders.frame.iims.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.iims.model.bo.Manager;


@Controller
@RequestMapping("/manager")
public class ManagerController extends AbstractGenericController<Manager>{
	@RequestMapping(value="/managerList",method=RequestMethod.GET)
	public String managerList(Model model,HttpServletRequest request) {	
			 
		 return "common/managerList";
	}
	@RequestMapping(value="/managerAdd",method=RequestMethod.GET)
	public String managerAdd(Model model,HttpServletRequest request) {	
			 
		 return "common/managerAdd";
	}
	@RequestMapping(value="/managerEdit",method=RequestMethod.GET)
	public String managerEdit(Model model,HttpServletRequest request) {	
			 
		 return "common/managerEdit";
	}	
}
