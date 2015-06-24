package com.wonders.frame.cpq.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.cpq.model.bo.CpqQuestion;


@Controller
@RequestMapping("/cpqQuestion")
public class CpqQuestionController extends AbstractGenericController<CpqQuestion>{
	@RequestMapping("/toCpqQuestionEidt")
	public String toCpqQuestion(){
		return "common/cpqQuestionEidt";
	}
	@RequestMapping("/toQuestionList")
	public String toCpqQuestionList(){
		return "common/cpqQuestionList";
	}
	
	@RequestMapping("/stat")
	public String stat(){
		return "common/cpqQuestionStat";
	}
}
