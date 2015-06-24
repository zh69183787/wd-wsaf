package com.wonders.frame.icp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.icp.model.bo.QteMain;

/**
 * 
 * @author Administrator
 * 问卷
 */

@Controller
@RequestMapping("/qteMain")
public class QteMainController extends AbstractGenericController<QteMain> {

	@RequestMapping(value="/qteMainList",method=RequestMethod.GET)
    public String qteMainList(Model model,HttpServletRequest request) {
        return "common/qteMainList";
    }
	
	@RequestMapping(value="/qteMainEdit",method=RequestMethod.GET)
    public String qteMainEdit(Model model,HttpServletRequest request) {
		String id=request.getParameter("id");
		request.setAttribute("id", id);
        return "common/qteMainEdit";
    }
	@RequestMapping(value="/qteMainStatistics",method=RequestMethod.GET)
    public String qteMainStatistics(Model model,HttpServletRequest request) {
		String id=request.getParameter("id");
		request.setAttribute("id", id);
        return "common/qteMainStatistics";
    }


}
