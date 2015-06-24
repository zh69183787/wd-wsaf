/** 
* @Title: CaInfoController.java 
* @Package com.wonders.frame.core.controller 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.iims.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wonders.frame.core.model.vo.EntityProperty;
import com.wonders.frame.core.utils.ReflectUtil;
import com.wonders.frame.iims.model.vo.CurrentLogin;
import com.wonders.frame.iims.service.CaRestAPIService;

/** 
 * @ClassName: CaInfoController 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 */
@Controller
@RequestMapping("/ca")
public class CaInfoController {	
	@RequestMapping(value="/getCurrentLoginInfo",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody 
	public CurrentLogin getCurrentLoginInfo(HttpServletRequest request,HttpServletResponse response) {	

		CurrentLogin currentLogin=CaRestAPIService.getCurrentLoginInfoFromCa(request, response);
			 
		return currentLogin;
	}
	
	/**
	 * 
	 * 仅包含登录信息  和部门信息
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/getLoginInfoAndDept",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody 
	public CurrentLogin getLoginInfoAndDeptFromCa(HttpServletRequest request,HttpServletResponse response) {	

		CurrentLogin currentLogin=CaRestAPIService.getLoginInfoAndDeptFromCa(request, response);
			 
		return currentLogin;
	}
	
	@RequestMapping(value="/getDeptUser",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody 
	public HashMap<String,String> getDeptUser(HttpServletRequest request,HttpServletResponse response) {	

		HashMap<String,String> deptUsers=CaRestAPIService.getDeptUserFromCa(request, response);
			 
		return deptUsers;
	}
	
	@RequestMapping(value="/getDepts",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody 
	public HashMap<String,String> getDepts(HttpServletRequest request,HttpServletResponse response) {	

		HashMap<String,String> depts=CaRestAPIService.getMatchedDeptsFromCa(request, response);
			 
		return depts;
	}
	
	@RequestMapping(value="/getChildDepts",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody 
	public HashMap<String,String> getChildDepts(HttpServletRequest request,HttpServletResponse response) {	

		HashMap<String,String> depts=CaRestAPIService.getChildDeptsFromCa(request, response);
			 
		return depts;
	}
	
	@RequestMapping(value="/getDeptLeaders",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody 
	public HashMap<String,String> getDeptLeaders(HttpServletRequest request,HttpServletResponse response) {	

		HashMap<String,String> deptLeaders=CaRestAPIService.getDeptLeadersFromCa(request, response);
			 
		return deptLeaders;
	}
	
	@RequestMapping(value="/getDeptsInfo",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody 
	public HashMap<String,String> getDeptsInfo(HttpServletRequest request,HttpServletResponse response) {	

		HashMap<String,String> depts=CaRestAPIService.getDeptsInfoFromCa(request, response);
			 
		return depts;
	}
	
	
	@RequestMapping(value="/getOrganTree",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody 
	public List<Map<String,String>> getOrganTree(HttpServletRequest request,HttpServletResponse response) {	

		List<Map<String,String>> treeNodes=CaRestAPIService.getOrganTreeFromCa(request, response);
			 
		return treeNodes;
	}
	
}
