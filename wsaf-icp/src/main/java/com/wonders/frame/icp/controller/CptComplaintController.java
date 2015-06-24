package com.wonders.frame.icp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.icp.model.bo.CptComplaint;

/**
 * 
 * @author Administrator
 *监督投诉
 */
@Controller
@RequestMapping("/cptComplaint")
public class CptComplaintController extends AbstractGenericController<CptComplaint>{
    
	
	@RequestMapping(value="/cptComplaintFeedBack",method= RequestMethod.GET)
    public String cptComplaintFeedBack(Model model,HttpServletRequest request) {
		String id=request.getParameter("id");
    	request.setAttribute("ids",id );
        return "common/cptComplaintFeedBack";
    }
	
	
	@RequestMapping(value="/cptComplaintEditV",method= RequestMethod.GET)
    public String cptComplaintEditV(Model model,HttpServletRequest request) {
		String id=request.getParameter("id");
    	request.setAttribute("ids",id );
        return "common/cptComplaintEditV";
    }

	
	
    @RequestMapping(value="/cptComplaintSave",method= RequestMethod.GET)
	    public String cptComplaintSave(Model model,HttpServletRequest request) {
	        return "common/cptComplaintSave";
	    }

    @RequestMapping(value="/cptComplaintDetail",method= RequestMethod.GET)
    public String cptComplaintDetail(Model model,HttpServletRequest request) {
    	String id=request.getParameter("id");
    	request.setAttribute("ids",id );
        return "common/cptComplaintDetail";
    }

	 @RequestMapping(value="/cptComplaintList",method=RequestMethod.GET)
	    public String cptComplaintList(Model model,HttpServletRequest request) {
	        return "common/cptComplaintList";
	    }
	
}
