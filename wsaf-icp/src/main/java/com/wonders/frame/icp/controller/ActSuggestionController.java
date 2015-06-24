package com.wonders.frame.icp.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.icp.model.bo.ActSuggestion;
import com.wonders.frame.icp.service.ActSuggestionService;

/**
 * 
 * @author Administrator
 * 提出意见
 */
@Controller
@RequestMapping("/actSuggestion")
public class ActSuggestionController extends AbstractGenericController<ActSuggestion> {
	
	@Resource
	private ActSuggestionService actSuggestionService;
	
	@RequestMapping(value="/actSuggestionList",method=RequestMethod.GET)
    public String actSuggestionList(Model model,HttpServletRequest request) {
        return "common/actSuggestionList";
    }
	@RequestMapping(value="/actSuggestionEdit",method= RequestMethod.GET)
    public String actSuggestionEdit(HttpServletRequest request) {
		String ctId=request.getParameter("ctId");
		request.setAttribute("ctId", ctId);
		String id=request.getParameter("id");
		request.setAttribute("id", id);
        return "common/actSuggestionEdit";
    }
	@RequestMapping(value="/actSuggestionView",method=RequestMethod.GET)
    public String actSuggestionView(HttpServletRequest request) {
		String ctId=request.getParameter("ctId");
		request.setAttribute("ctId", ctId);
		String fbcheck=request.getParameter("fbcheck");
		request.setAttribute("fbcheck", fbcheck);
        return "common/actSuggestionView";
    }
	
	@RequestMapping("/findByCtIdAndLoginName")
	@ResponseBody
	public HashMap<String,Object> findByCtIdAndLoginName(Integer ctId,String loginName){
		HashMap<String,Object> result=new HashMap<String,Object>();
		try {
			ActSuggestion actSuggestion=actSuggestionService.findByCtIdAndLoginName(ctId, loginName);
			result.put("success", true);
			result.put("result", actSuggestion);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}

}
