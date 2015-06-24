package com.wonders.frame.ias.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/deptStatistics")
public class DeptStatisticsController {
	/**
	 * @see 按部门统计
	 * @return
	 */
	@RequestMapping(value="/make")
	public String make(Model model,HttpServletRequest request){
		 return "common/deptStatistics";
	}
}
