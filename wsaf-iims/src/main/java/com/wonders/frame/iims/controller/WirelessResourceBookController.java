package com.wonders.frame.iims.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.iims.model.bo.WirelessResourceBook;


@Controller
@RequestMapping("/wirelessResourceBook")
public class WirelessResourceBookController extends AbstractGenericController<WirelessResourceBook>{
	@RequestMapping(value="/wirelessAccounting",method=RequestMethod.GET)
	public String wirelessAccounting(Model model,HttpServletRequest request) {	
			 
		 return "common/wirelessAccounting";
	}
	
}
