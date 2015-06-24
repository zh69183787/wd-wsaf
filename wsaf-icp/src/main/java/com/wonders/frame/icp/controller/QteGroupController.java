package com.wonders.frame.icp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.icp.model.bo.QteGroup;

/**
 * 
 * @author Administrator
 * 分组
 */
@Controller
@RequestMapping("/qteGroup")
public class QteGroupController extends AbstractGenericController<QteGroup> {
	@RequestMapping(value="/qteGroupList",method=RequestMethod.GET)
    public String qteMainList(Model model,HttpServletRequest request) {
		String id=request.getParameter("id");
		request.setAttribute("mainId", id);
        return "common/qteGroupList";
    }
	@RequestMapping(value="/qteGroupEdit",method=RequestMethod.GET)
    public String qteGroupEdit(Model model,HttpServletRequest request) {
		String id=request.getParameter("id");
		request.setAttribute("mainId", id);
        return "common/qteGroupEdit";
    }
}
