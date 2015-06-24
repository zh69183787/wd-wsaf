package com.wonders.frame.core.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wonders.frame.core.model.bo.RelationRuleType;
@Controller
@RequestMapping("/relationRuleType")
public class RelationRuleTypeController extends AbstractGenericController<RelationRuleType> {
	/**
	 * 跳转 规则编辑页
	 * @return
	 */
	@RequestMapping(value="/toRelationRuleTypeEdit")
	public String toRelationRuleTypeEdit(Model model){
		return "common/relationRuleTypeEdit";
	}
}
