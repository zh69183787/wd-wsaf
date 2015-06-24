/** 
* @Title: UserEditController.java 
* @Package com.wonders.frame.core.controller 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.console.controller.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wonders.frame.console.model.bo.User;
import com.wonders.frame.core.controller.AbstractGenericApiController;

@Controller
@RequestMapping("/user/api")
public class UserApiController extends AbstractGenericApiController<User>{
	@RequestMapping("/toListApi")
	public String toList(){
		return "common/listApi";	
	}
	
	@RequestMapping("/toEditApi")
	public String toEditApi(){
		return "common/editApi";
	}
}
