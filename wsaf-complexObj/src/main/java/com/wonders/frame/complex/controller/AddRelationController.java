/** 
* @Title: UserEditController.java 
* @Package com.wonders.frame.core.controller 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.complex.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.complex.form.AddRelationForm;
import com.wonders.frame.core.controller.AbstractComplexRelationController;
import com.wonders.frame.core.controller.AbstractGenericController;


@Controller
@RequestMapping("/addRelation")
public class AddRelationController extends AbstractComplexRelationController<AddRelationForm>{

//	@RequestMapping(value = "/add", method = {RequestMethod.GET})
//	public String add(ModelMap modelMap) {
//		AddRelationForm addRelationForm = new AddRelationForm();
//		modelMap.addAttribute("addRelationForm", addRelationForm);
//		
//		return "common/complexRelationAdd";
//	}
}
