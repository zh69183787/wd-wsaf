package com.wonders.frame.iims.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.iims.model.bo.Meeting;


@Controller
@RequestMapping("/meeting")
public class MeetingController extends AbstractGenericController<Meeting>{
	
	@RequestMapping(value="/meetingManageList",method=RequestMethod.GET)
	public String meetingManageList(Model model,HttpServletRequest request) {	
			 
		 return "common/meetingManageList";
	}
	
	@RequestMapping(value="/meetingManageAdd",method=RequestMethod.GET)
	public String meetingManageAdd(Model model,HttpServletRequest request) {	
			 
		 return "common/meetingManageAdd";
	}
	@RequestMapping(value="/meetingManageDetail",method=RequestMethod.GET)
	public String meetingManageDetail(Model model,HttpServletRequest request) {	
			 
		 return "common/meetingManageDetail";
	}
	@RequestMapping(value="/meetingManageEdit",method=RequestMethod.GET)
	public String meetingManageEdit(Model model,HttpServletRequest request) {	
			 
		 return "common/meetingManageEdit";
	}
}
