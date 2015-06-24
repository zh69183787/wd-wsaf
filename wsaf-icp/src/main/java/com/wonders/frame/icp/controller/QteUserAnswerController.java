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
import com.wonders.frame.icp.model.bo.QteUserAnswer;
import com.wonders.frame.icp.service.QteUserAnswerService;

/**
 * 
 * @author Administrator
 * 用户所填问卷答案
 */
@Controller
@RequestMapping("/qteUserAnswer")
public class QteUserAnswerController extends AbstractGenericController<QteUserAnswer> {
	
	@Resource
	private QteUserAnswerService qteUserAnswerService;
	
	/**
	 * 获取用户填写的题目答案
	 * @param questId 问题id
	 * @param optionId 选项id
	 * @param loginName 用户工号
	 * @param request
	 * @return
	 */
	@RequestMapping("/findQteUserAnswer")
	@ResponseBody
	public HashMap<String,Object> findQteUserAnswer(Integer questId,Integer optionId, String loginName,HttpServletRequest request){
		HashMap<String,Object> result=new HashMap<String,Object>();
		QteUserAnswer qteUserAnswer=null;
		try {
			if(optionId==null){
				qteUserAnswer=qteUserAnswerService.findByQuestIdAndLoginName(questId, loginName);
			}else{
				qteUserAnswer=qteUserAnswerService.findByQuestIdAndOptionIdAndLoginName(questId, optionId, loginName);
			}
			result.put("success", true);
			result.put("result", qteUserAnswer);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	
	
	@RequestMapping("/findQteUserAnswers")
	@ResponseBody
	public HashMap<String,Object> findQteUserAnswers(Integer questId,Integer optionId, String deptId,HttpServletRequest request){
		HashMap<String,Object> result=new HashMap<String,Object>();
		try {
			List<QteUserAnswer> qteUserAnswers=qteUserAnswerService.findByQuestIdAndOptionIdAndDeptId(questId, optionId, deptId);
			result.put("success", true);
			result.put("result", qteUserAnswers);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}

	
	@RequestMapping(value="/qteUserAnswerList",method=RequestMethod.GET)
    public String qteUserAnswerList(Model model,HttpServletRequest request) {
        return "common/qteUserAnswerList";
    }
	@RequestMapping(value="/qteUserAnswerEdit",method=RequestMethod.GET)
    public String qteUserAnswerEdit(Model model,HttpServletRequest request) {
		String mainId=request.getParameter("mainId");
		request.setAttribute("mainId", mainId);
        return "common/qteUserAnswerEdit";
    }
	@RequestMapping(value="/qteUserAnswerDetail",method=RequestMethod.GET)
    public String qteUserAnswerDetail(Model model,HttpServletRequest request) {
		String mainId=request.getParameter("mainId");
		request.setAttribute("mainId", mainId);
        return "common/qteUserAnswerDetail";
    }


}
