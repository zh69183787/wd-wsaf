/** 
* @Title: UserEditController.java 
* @Package com.wonders.frame.core.controller 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.core.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.model.bo.Relation;

@Controller
@RequestMapping("/relation")
public class RelationController extends AbstractGenericController<Relation>{
	
	@RequestMapping(value="/bindRelation",method={RequestMethod.POST,RequestMethod.GET})
	public String bindRelation(String type,String ptype,HttpServletRequest request){
		 request.setAttribute("type", type);
		 request.setAttribute("ptype", ptype);
		 return "common/bind"; 
	}
	
	@RequestMapping(value="/removeBind",method={RequestMethod.POST,RequestMethod.GET})
	public String removeBind(String type,String ptype,HttpServletRequest request){
		request.setAttribute("type", type);
		request.setAttribute("ptype", ptype);
		return "common/bindRemove"; 
	}
	
	@RequestMapping(value="/index",method={RequestMethod.POST,RequestMethod.GET})
	public String bindRelation(HttpServletRequest request){
		return "common/index"; 
	}

}
