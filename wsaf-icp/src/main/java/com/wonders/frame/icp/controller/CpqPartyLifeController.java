package com.wonders.frame.icp.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.icp.model.bo.CpqPartyLife;


@Controller
@RequestMapping("/partyLife")
public class CpqPartyLifeController extends AbstractGenericController<CpqPartyLife>{
	
	@RequestMapping(value="/userList",method=RequestMethod.GET)
	public String showList(Model model,HttpServletRequest request) {	
		 request.setAttribute("role", "user");	 
		 return "common/partyLifeList";
	}
	@RequestMapping(value="/adminList",method=RequestMethod.GET)
	public String showAdminList(Model model,HttpServletRequest request) {	
		 request.setAttribute("role", "admin");
		 return "common/partyLifeList";
	}
}
