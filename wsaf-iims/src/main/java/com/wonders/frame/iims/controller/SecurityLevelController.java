package com.wonders.frame.iims.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.iims.model.bo.SecurityLevel;


@Controller
@RequestMapping("/securityLevel")
public class SecurityLevelController extends AbstractGenericController<SecurityLevel>{
	@RequestMapping(value="/securityLevelList",method=RequestMethod.GET)
	public String securityLevelList(Model model,HttpServletRequest request) {	
			 
		 return "common/securityLevelList";
	}	
	@RequestMapping(value="/securityLevelAdd",method=RequestMethod.GET)
	public String securityLevelAdd(Model model,HttpServletRequest request) {	
			 
		 return "common/securityLevelAdd";
	}
	@RequestMapping(value="/securityLevelDetail",method=RequestMethod.GET)
	public String securityLevelDetail(Model model,HttpServletRequest request) {	
			 
		 return "common/securityLevelDetail";
	}
	@RequestMapping(value="/securityLevelEdit",method=RequestMethod.GET)
	public String securityLevelEdit(Model model,HttpServletRequest request) {	
			 
		 return "common/securityLevelEdit";
	}
	@RequestMapping(value="/securityLevelReview",method=RequestMethod.GET)
	public String securityLevelReview(Model model,HttpServletRequest request) {	
			 
		 return "common/securityLevelReview";
	}
	@RequestMapping(value="/securityLevelReviewInfoCenter",method=RequestMethod.GET)
	public String securityLevelReviewInfoCenter(Model model,HttpServletRequest request) {	
			 
		 return "common/securityLevelReviewInfoCenter";
	}
	@RequestMapping(value="/securityLevelInfoCenterList",method=RequestMethod.GET)
	public String securityLevelInfoCenterList(Model model,HttpServletRequest request) {	
			 
		 return "common/securityLevelInfoCenterList";
	}
	@RequestMapping(value="/securityLevelReviewInfoLeader",method=RequestMethod.GET)
	public String securityLevelReviewInfoLeader(Model model,HttpServletRequest request) {	
			 
		 return "common/securityLevelReviewInfoLeader";
	}
	@RequestMapping(value="/securityLevelReviewPolice",method=RequestMethod.GET)
	public String securityLevelReviewPolice(Model model,HttpServletRequest request) {	
			 
		 return "common/securityLevelReviewPolice";
	}
	@RequestMapping(value="/securityLevelPassList",method=RequestMethod.GET)
	public String securityLevelPassList(Model model,HttpServletRequest request) {	
			 
		 return "common/securityLevelPassList";
	}
	@RequestMapping(value="/securityLevelContentChange",method=RequestMethod.GET)
	public String securityLevelContentChange(Model model,HttpServletRequest request) {	
			 
		 return "common/securityLevelContentChange";
	}
	@RequestMapping(value="/securityLevelChange",method=RequestMethod.GET)
	public String securityLevelChange(Model model,HttpServletRequest request) {	
			 
		 return "common/securityLevelChange";
	}
	@RequestMapping(value="/securityLevelLeaderEdit",method=RequestMethod.GET)
	public String securityLevelLeaderEdit(Model model,HttpServletRequest request) {	
			 
		 return "common/securityLevelLeaderEdit";
	}
	
	
}
