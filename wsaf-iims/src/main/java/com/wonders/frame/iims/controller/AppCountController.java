package com.wonders.frame.iims.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.iims.model.bo.AppCount;


@Controller
@RequestMapping("/appCount")
public class AppCountController extends AbstractGenericController<AppCount>{
	@RequestMapping(value="/AppCountList",method=RequestMethod.GET)
	public String AppAcountList(Model model,HttpServletRequest request) {	
			 
		 return "common/appCountList";
	}
}
