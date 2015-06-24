package com.wonders.frame.icp.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.icp.model.bo.QteQuestion;
import com.wonders.frame.icp.service.QteQuestionService;
/**
 * 
 * @author Administrator
 * 问卷问题
 */
@Controller
@RequestMapping("/qteQuestion")
public class QteQuestionController extends AbstractGenericController<QteQuestion> {
   
	@Resource
	private QteQuestionService qteQuestionService;
	
	@RequestMapping("/findByMainIdAndGroupId")
	@ResponseBody
	public HashMap<String,Object> findByMainIdAndGroupId(Integer mainId,Integer groupId){
		HashMap<String,Object> result=new HashMap<String,Object>();
		try {
			List<QteQuestion> qteQuestions=qteQuestionService.findByMainIdAndGroupId(mainId, groupId);
			result.put("success", true);
			result.put("result",qteQuestions );
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	
	@RequestMapping(value="/qteQuestionList",method=RequestMethod.GET)
    public String qteQuestionList(Model model,HttpServletRequest request) {
		String id=request.getParameter("id");
		request.setAttribute("mainId", id);
        return "common/qteQuestionList";
    }
	@RequestMapping(value="/qteQuestionAdd",method=RequestMethod.GET)
    public String qteQuestionAdd(Model model,HttpServletRequest request) {
		String mainId=request.getParameter("mainId");
		request.setAttribute("mainId", mainId);
        return "common/qteQuestionAdd";
    }
	@RequestMapping(value="/qteQuestionEdit",method=RequestMethod.GET)
    public String qteQuestionEdit(Model model,HttpServletRequest request) {
		String mainId=request.getParameter("mainId");
		request.setAttribute("mainId", mainId);
		String quId=request.getParameter("quId");
		request.setAttribute("quId", quId);
        return "common/qteQuestionEdit";
    }
	@RequestMapping(value="/qteQuestionDetail",method=RequestMethod.GET)
    public String qteQuestionDetail(Model model,HttpServletRequest request) {
		String mainId=request.getParameter("mainId");
		request.setAttribute("mainId", mainId);
		String quId=request.getParameter("quId");
		request.setAttribute("quId", quId);
        return "common/qteQuestionDetail";
    }
}
