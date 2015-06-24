package com.wonders.frame.iims.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.iims.model.bo.SecurityEvent;


@Controller
@RequestMapping("/securityEvent")
public class SecurityEventController extends AbstractGenericController<SecurityEvent>{
	@RequestMapping(value="/securityEventList",method=RequestMethod.GET)
	public String securityEventList(Model model,HttpServletRequest request) {	
			 
		 return "common/securityEventList";
	}
	
	@RequestMapping(value="/securityEventEnterpriseList",method=RequestMethod.GET)
	public String securityEventEnterpriseList(Model model,HttpServletRequest request) {	
			 
		 return "common/securityEventEnterpriseList";
	}
	
	
	@RequestMapping(value="/securityEventAdd",method=RequestMethod.GET)
	public String securityEventAdd(Model model,HttpServletRequest request) {	
			 
		 return "common/securityEventAdd";
	}
	
	@RequestMapping(value="/securityEventEdit",method=RequestMethod.GET)
	public String securityEventEdit(Model model,HttpServletRequest request) {	
			 
		 return "common/securityEventEdit";
	}
	@RequestMapping(value="/securityEventDetail",method=RequestMethod.GET)
	public String securityEventDetail(Model model,HttpServletRequest request) {	
			 
		 return "common/securityEventDetail";
	}
	@RequestMapping(value="/securityEventReview",method=RequestMethod.GET)
	public String securityEventReview(Model model,HttpServletRequest request) {	
			 
		 return "common/securityEventReview";
	}
	@RequestMapping(value="/securityEventReviewDepSafety",method=RequestMethod.GET)
	public String securityEventReviewDepSafety(Model model,HttpServletRequest request) {	
			 
		 return "common/securityEventReviewDepSafety";
	}
	
	@RequestMapping(value="/securityEventMaintenanceCenterList",method=RequestMethod.GET)
	public String securityEventMaintenanceCenterList(Model model,HttpServletRequest request) {	
			 
		 return "common/securityEventMaintenanceCenterList";
	}
	@RequestMapping(value="/securityEventReviewCenter",method=RequestMethod.GET)
	public String securityEventReviewCenter(Model model,HttpServletRequest request) {	
			 
		 return "common/securityEventReviewCenter";
	}
	@RequestMapping(value="/securityEventInfoCenterList",method=RequestMethod.GET)
	public String securityEventInfoCenterList(Model model,HttpServletRequest request) {	
			 
		 return "common/securityEventInfoCenterList";
	}

	
}
