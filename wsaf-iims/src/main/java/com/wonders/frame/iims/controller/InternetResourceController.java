package com.wonders.frame.iims.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.iims.model.bo.InternetResource;


@Controller
@RequestMapping("/internetResource")
public class InternetResourceController extends AbstractGenericController<InternetResource>{
	
	//----------------------互联网访问------------------------------------------
		@RequestMapping(value="/internetAccessList",method=RequestMethod.GET)
		public String internetAccessList(Model model,HttpServletRequest request) {	
				 
			 return "common/internetAccessList";
		}
		@RequestMapping(value="/internetAccessAdd",method=RequestMethod.GET)
		public String internetAccessAdd(Model model,HttpServletRequest request) {	
				 
			 return "common/internetAccessAdd";
		}
		@RequestMapping(value="/internetAccessDetail",method=RequestMethod.GET)
		public String internetAccessDetail(Model model,HttpServletRequest request) {	
				 
			 return "common/internetAccessDetail";
		}
		@RequestMapping(value="/internetAccessReviewDetail",method=RequestMethod.GET)
		public String internetAccessReviewDetail(Model model,HttpServletRequest request) {	
				 
			 return "common/internetAccessReviewDetail";
		}
		@RequestMapping(value="/internetAccessWaitForImplement",method=RequestMethod.GET)
		public String internetAccessWaitForImplement(Model model,HttpServletRequest request) {	
				 
			 return "common/internetAccessWaitForImplement";
		}
	
}
