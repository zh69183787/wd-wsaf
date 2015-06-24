package com.wonders.frame.iims.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.iims.model.bo.Special;


@Controller
@RequestMapping("/special")
public class SpecialController extends AbstractGenericController<Special>{
	@RequestMapping(value="/specialAdd",method=RequestMethod.GET)
	public String specialAdd(Model model,HttpServletRequest request) {	
			 
		 return "common/specialAdd";
	}
	@RequestMapping(value="/specialProjectAdd",method=RequestMethod.GET)
	public String specialProjectAdd(Model model,HttpServletRequest request) {	
			 
		 return "common/specialProjectAdd";
	}
	@RequestMapping(value="/specialContractAdd",method=RequestMethod.GET)
	public String specialContractAdd(Model model,HttpServletRequest request) {	
			 
		 return "common/specialContractAdd";
	}
	@RequestMapping(value="/specialDetail",method=RequestMethod.GET)
	public String specialDetail(Model model,HttpServletRequest request) {	
			 
		 return "common/specialDetail";
	}
	@RequestMapping(value="/specialEdit",method=RequestMethod.GET)
	public String specialEdit(Model model,HttpServletRequest request) {	
			 
		 return "common/specialEdit";
	}
	@RequestMapping(value="/specialAddOther",method=RequestMethod.GET)
	public String specialAddOther(Model model,HttpServletRequest request) {	
			 
		 return "common/specialAddOther";
	}
	@RequestMapping(value="/specialProjectOther",method=RequestMethod.GET)
	public String specialProjectOther(Model model,HttpServletRequest request) {	
			 
		 return "common/specialProjectOther";
	}
	@RequestMapping(value="/specialContractOther",method=RequestMethod.GET)
	public String specialContractOther(Model model,HttpServletRequest request) {	
			 
		 return "common/specialContractOther";
	}
	
}
