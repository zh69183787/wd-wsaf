package com.wonders.frame.icp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.icp.model.bo.ActTheme;

/**
 * 
 * @author Administrator
 * 征集主题
 */
@Controller
@RequestMapping("/actTheme")
public class ActThemeController extends AbstractGenericController<ActTheme> {

	@RequestMapping(value="/actThemeList",method=RequestMethod.GET)
    public String actThemeList(Model model,HttpServletRequest request) {
        return "common/actThemeList";
    }
	
	@RequestMapping(value="/actThemeEdit",method= RequestMethod.GET)
    public String actThemeEdit(HttpServletRequest request) {
		String id=request.getParameter("id");
		request.setAttribute("id", id);
		String add=request.getParameter("add");
		request.setAttribute("add", add);
        return "common/actThemeEdit";
    }
	@RequestMapping(value="/actThemeView",method=RequestMethod.GET)
    public String actThemeView(Model model,HttpServletRequest request) {
		String ctId=request.getParameter("ctId");
		request.setAttribute("ctId", ctId);
        return "common/actThemeView";
    }
	@RequestMapping(value="/actThemeBack",method=RequestMethod.GET)
    public String actThemeBack(Model model,HttpServletRequest request) {
		String id=request.getParameter("id");
		request.setAttribute("id", id);
        return "common/actThemeBack";
    }
	
}
