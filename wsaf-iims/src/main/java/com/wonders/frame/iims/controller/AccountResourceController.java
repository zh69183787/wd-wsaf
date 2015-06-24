package com.wonders.frame.iims.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.iims.model.bo.AccountResource;


@Controller
@RequestMapping("/accountResource")
public class AccountResourceController extends AbstractGenericController<AccountResource>{
	
	//------------------系统账户申请-------------------------------
		@RequestMapping(value="/systemAccountAdd",method=RequestMethod.GET)
		public String systemAccountAdd(Model model,HttpServletRequest request) {	
				 
			 return "common/systemAccountAdd";
		}
		@RequestMapping(value="/systemAccountList",method=RequestMethod.GET)
		public String systemAccountList(Model model,HttpServletRequest request) {	
				 
			 return "common/systemAccountList";
		}
		@RequestMapping(value="/systemAccountDetail",method=RequestMethod.GET)
		public String systemAccountDetail(Model model,HttpServletRequest request) {	
				 
			 return "common/systemAccountDetail";
		}
		@RequestMapping(value="/systemAccountReviewDetail",method=RequestMethod.GET)
		public String systemAccountReview(Model model,HttpServletRequest request) {	
				 
			 return "common/systemAccountReviewDetail";
		}
		@RequestMapping(value="/systemWaitForImplement",method=RequestMethod.GET)
		public String systemWaitForImplement(Model model,HttpServletRequest request) {	
				 
			 return "common/systemWaitForImplement";
		}
	
}
