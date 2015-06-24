package com.wonders.frame.iims.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.iims.model.bo.InternetResourceBook;


@Controller
@RequestMapping("/internetResourceBook")
public class InternetResourceBookController extends AbstractGenericController<InternetResourceBook>{
	@RequestMapping(value="/internetAccounting",method=RequestMethod.GET)
	public String wirelessAccounting(Model model,HttpServletRequest request) {	
			 
		 return "common/internetAccounting";
	}
	
}
