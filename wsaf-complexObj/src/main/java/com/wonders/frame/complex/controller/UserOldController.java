/** 
* @Title: UserEditController.java 
* @Package com.wonders.frame.core.controller 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.complex.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wonders.frame.complex.model.bo.UserOld;
import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.core.model.vo.EntityProperty;
import com.wonders.frame.core.service.GenericService;
import com.wonders.frame.core.utils.ReflectUtil;

@Controller
@RequestMapping("/userOld")
public class UserOldController extends AbstractGenericController<UserOld>{
	@Resource
	GenericService genericService;
	
	@RequestMapping(value="/userOldAdd",method=RequestMethod.GET)
	public String meetingManageAdd(ModelMap model,HttpServletRequest request) {	
			 
		 return "common/userOldAdd";
	}
	
	
//	保存--测试ajax验证
//	@RequestMapping(value="/saveObj",method=RequestMethod.POST)
//	@ResponseBody
//	public HashMap<String, Object>  saveObj( @Valid @ModelAttribute UserOld userOld, BindingResult bindingResult,ModelMap model,HttpServletRequest request) {
//		HashMap<String, Object> result = new HashMap<String, Object>();
//		EntityProperty entityProperty=ReflectUtil.getEntityProperty(UserOld.class,
//				request.getParameter("fieldFilter"),request.getParameter("isNeeded"));
//		model.addAttribute("entity", entityProperty);
//		String errorInfo = "";
//		String name = request.getParameter("name");
//		Map<String, String> paramMap = request.getParameterMap();
//		HashMap<String, String> hmParam = new HashMap<String, String>();
//		for (String key : paramMap.keySet()) {
//			hmParam.put(key, request.getParameter(key));
//		}
//		try {
//			HashMap<String, String> mapErrors = new LinkedHashMap<String, String>();
//			if (bindingResult.hasErrors()) {
//				for(FieldError error:bindingResult.getFieldErrors()){
//					System.out.println("===========error============code:"+error.getCode()+","+error.getDefaultMessage());
//					errorInfo += error.getDefaultMessage()+"\n";
//					mapErrors.put(error.getField(), error.getDefaultMessage());
//				}
//				model.addAttribute("hasErrors", true);
//				result.put("errors", mapErrors);
//				result.put("errorInfo", errorInfo);
//				result.put("success", false);
//			    return result;
//			}		 
//			userOld= (UserOld)genericService.executeMethod("userOld",
//					"save", new Class[] {Object.class}, new Object[] {userOld});
//			result.put("success", true);
//			result.put("result", userOld);
//		} catch (Exception e) {
//			// e.printStackTrace();
//			result.put("success", false);
//		}
//		return result;
//	}
}
