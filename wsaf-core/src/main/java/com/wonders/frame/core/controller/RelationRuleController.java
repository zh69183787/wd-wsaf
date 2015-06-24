package com.wonders.frame.core.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wonders.frame.core.model.bo.RelationRule;
@Controller
@RequestMapping("/relationRule")
public class RelationRuleController extends AbstractGenericController<RelationRule> {

	/**
	 * 跳转 编辑页
	 * @return
	 */
	@RequestMapping(value="/toRelationRuleEdit/{type}")
	public String toRelationRuleEdit(@PathVariable("type")String type,Model model){
		 model.addAttribute("type", type);
		 return "common/relationRuleEdit";
	}
	
	/**
	 * 跳转 规则编辑页
	 * @return
	 */
	@RequestMapping(value="/toRelationRuleTypeEdit")
	public String toRelationRuleTypeEdit(Model model){
		return "common/relationRuleTypeEdit";
	}
}
