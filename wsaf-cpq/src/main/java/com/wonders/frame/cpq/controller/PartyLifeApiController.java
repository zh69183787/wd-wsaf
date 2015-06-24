package com.wonders.frame.cpq.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.core.utils.JacksonMapper;
import com.wonders.frame.cpq.model.bo.CpqPartyLife;
import com.wonders.frame.cpq.service.CalculatePartyLifeService;


@Controller
@RequestMapping("/partyLifeApi")
public class PartyLifeApiController{
	
	@Resource
	private CalculatePartyLifeService calculatePartyLifeService;
	
	@RequestMapping(value="/getCnt/{year}",method=RequestMethod.GET)
	//@ResponseBody 
	public void getCnt(@PathVariable("year") String year,HttpServletRequest request,HttpServletResponse response) {	
    	//String jsonp=request.getParameter("callback");
    	
		String cnt=calculatePartyLifeService.getCountNum(year);	 
		//return jsonp+"("+cnt+")";
		try {  
	        response.setContentType("text/plain");  
	        response.setHeader("Pragma", "No-cache");  
	        response.setHeader("Cache-Control", "no-cache");  
	        response.setDateHeader("Expires", 0);  
	        PrintWriter out = response.getWriter();       
	        Map<String,String> map = new HashMap<String,String>();   
	        map.put("result", cnt);  
	        String jsonpCallback = request.getParameter("callback");//客户端请求参数  
	        out.println(jsonpCallback+"("+JacksonMapper.toJson(map)+")");//返回jsonp格式数据  
	        out.flush();  
	        out.close();  
	      } catch (IOException e) {  
	       e.printStackTrace();  
	      }  
	}

}
