package com.wonders.frame.iims.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.iims.model.bo.NetResource;


@Controller
@RequestMapping("/netResource")
public class NetResourceController extends AbstractGenericController<NetResource>{

	
	//---------------------网络接入-------------------------------------------
	@RequestMapping(value="/resourceManageDetail",method=RequestMethod.GET)
	public String resourceManageDetail(Model model,HttpServletRequest request) {	
			 
		 return "common/resourceManageDetail";
	}
	@RequestMapping(value="/resourceManageAdd",method=RequestMethod.GET)
	public String resourceManageAdd(Model model,HttpServletRequest request) {	
			 
		 return "common/resourceManageAdd";
	}
	@RequestMapping(value="/resourceManageList",method=RequestMethod.GET)
	public String resourceManageReviewList(Model model,HttpServletRequest request) {	
			 
		 return "common/resourceManageList";
	}
	@RequestMapping(value="/resourceManageReviewDetail",method=RequestMethod.GET)
	public String resourceManageReviewDetail(Model model,HttpServletRequest request) {	
			 
		 return "common/resourceManageReviewDetail";
	}
	@RequestMapping(value="/resourceManageWaitForImplement",method=RequestMethod.GET)
	public String resourceManageWaitForImplement(Model model,HttpServletRequest request) {	
			 
		 return "common/resourceManageWaitForImplement";
	}
	
	/** 目标计划      实施计划   */
	@RequestMapping(value="/targetPlanList",method=RequestMethod.GET)
	public String targetPlanList(Model model,HttpServletRequest request) {	
			 
		 return "common/targetPlanList";
	}
	@RequestMapping(value="/implementPlanList",method=RequestMethod.GET)
	public String implementPlanList(Model model,HttpServletRequest request) {	
			 
		 return "common/implementPlanList";
	}

}
