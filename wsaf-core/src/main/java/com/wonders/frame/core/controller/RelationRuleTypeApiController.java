package com.wonders.frame.core.controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wonders.frame.core.model.bo.RelationRuleType;
import com.wonders.frame.core.service.RelationObjectService;
import com.wonders.frame.core.service.RelationRuleTypeService;
import com.wonders.frame.core.service.RelationService;
import com.wonders.frame.core.utils.ReflectUtil;

@Controller
@RequestMapping("/relationRuleType/api")
public class RelationRuleTypeApiController extends AbstractGenericApiController<RelationRuleType>{
	
	@Resource
	RelationRuleTypeService relationRuleTypeService;
	   
	@Resource
	private RelationService relationService;
	
	@Resource
	private RelationObjectService relationObjectService;
	
	@RequestMapping("/isExistsRelationRuleType")
	@ResponseBody
	public HashMap<String,Object> isExistsRelationRuleType(String name){
		HashMap<String,Object> result=new HashMap<String,Object>();
		try {
			RelationRuleType relationRuleType=relationRuleTypeService.findByName(name);
			result.put("success", true);
			result.put("result", relationRuleType);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	
}
