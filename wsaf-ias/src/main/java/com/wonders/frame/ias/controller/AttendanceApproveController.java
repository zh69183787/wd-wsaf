package com.wonders.frame.ias.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/attendanceApprove")
public class AttendanceApproveController {
	/**
	 * @see 考勤信息审批
	 * @return
	 */
	@RequestMapping(value="/make")
	public String make(Model model,HttpServletRequest request){
		 return "common/attendanceApprove";
	}
}
