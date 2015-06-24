package com.wonders.frame.iims.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.iims.model.bo.VpnResource;


@Controller
@RequestMapping("/vpnResource")
public class VpnResourceController extends AbstractGenericController<VpnResource>{
	
	//--------------------------VPN访问-------------------------------------
		@RequestMapping(value="/vpnDetail",method=RequestMethod.GET)
		public String vpnDetail(Model model,HttpServletRequest request) {	
				 
			 return "common/vpnDetail";
		}
		@RequestMapping(value="/vpnReviewDetail",method=RequestMethod.GET)
		public String vpnReviewDetail(Model model,HttpServletRequest request) {	
				 
			 return "common/vpnReviewDetail";
		}
		@RequestMapping(value="/vpnList",method=RequestMethod.GET)
		public String vpnList(Model model,HttpServletRequest request) {	
				 
			 return "common/vpnList";
		}
		@RequestMapping(value="/vpnAdd",method=RequestMethod.GET)
		public String vpnAdd(Model model,HttpServletRequest request) {	
				 
			 return "common/vpnAdd";
		}
		@RequestMapping(value="/vpnWaitForImplement",method=RequestMethod.GET)
		public String vpnWaitForImplement(Model model,HttpServletRequest request) {	
				 
			 return "common/vpnWaitForImplement";
		}
	
}
