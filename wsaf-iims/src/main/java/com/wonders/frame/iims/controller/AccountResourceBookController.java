package com.wonders.frame.iims.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.iims.model.bo.AccountResourceBook;


@Controller
@RequestMapping("/accountResourceBook")
public class AccountResourceBookController extends AbstractGenericController<AccountResourceBook>{
	@RequestMapping(value="/accountAccounting",method=RequestMethod.GET)
	public String wirelessAccounting(Model model,HttpServletRequest request) {	
			 
		 return "common/accountAccounting";
	}
	
	
}
