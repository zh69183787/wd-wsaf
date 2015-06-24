package com.wonders.frame.iims.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wonders.frame.core.utils.JacksonMapper;
import com.wonders.frame.iims.service.CaRestAPIService;

@Controller
@RequestMapping("/jeecms")
public class JeecmsController {
	@RequestMapping(value="/getJeecmsInfo",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody 
	public String getJeecmsInfo(HttpServletRequest request,HttpServletResponse response) {		
		String s=CaRestAPIService.getJeecmsInfoFromCa(request,response);
		//System.out.println(s);
		//HashMap<String,Object> obj=JacksonMapper.readValue(s,HashMap.class);
		//System.out.println(obj);
		return s;
	}
	
	@RequestMapping(value="/xxindex",method=RequestMethod.GET)
	public String xx_index(Model model,HttpServletRequest request) {	
					 
		return "common/xxindex";
	}
}
