/** 
* @Title: CaInfoController.java 
* @Package com.wonders.frame.core.controller 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.ias.controller;

import com.wonders.frame.ias.service.CaRestAPIService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** 
 * @ClassName: CaInfoController 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 */
@Controller
@RequestMapping("/ca")
public class CaInfoController {	
	
	@RequestMapping(value="/getCookies",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody 
	public HashMap<String,String> getCookies(HttpServletRequest request,HttpServletResponse response) {	

		HashMap<String,String> cookies=CaRestAPIService.getCookies(request, response);
			 
		return cookies;
	}
	
	@RequestMapping(value="/getDeptSingleLeader",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody 
	public HashMap<String,String> getDeptSingleLeader(HttpServletRequest request,HttpServletResponse response) {	

		HashMap<String,String> deptSingleLeader=CaRestAPIService.getDeptSingleLeaderFromCa(request, response);
			 
		return deptSingleLeader;
	}
	
	@RequestMapping(value="/getDeptUser",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody 
	public HashMap<String,String> getDeptUser(HttpServletRequest request,HttpServletResponse response) {	

		HashMap<String,String> deptUsers=CaRestAPIService.getDeptUserFromCa(request, response);
			 
		return deptUsers;
	}

}
