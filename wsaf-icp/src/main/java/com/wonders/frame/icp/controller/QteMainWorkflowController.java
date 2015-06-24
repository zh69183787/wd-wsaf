package com.wonders.frame.icp.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.icp.model.bo.QteMainWorkflow;
import com.wonders.frame.icp.model.vo.QteMainDetail;
import com.wonders.frame.icp.service.QteMainWorkflowService;

/**
 * 
 * @author Administrator
 * 问卷审核工作流转情况表
 *
 */
@Controller
@RequestMapping("/qteMainWorkflow")
public class QteMainWorkflowController extends AbstractGenericController<QteMainWorkflow> {
	
	@Resource
	private QteMainWorkflowService qteMainWorkflowService;
	
	@RequestMapping("/findByQteId/{id}")
	@ResponseBody
	public HashMap<String,Object> findByQteId(@PathVariable("id")Integer qteId){
		HashMap<String,Object> result=new HashMap<String,Object>();
		try {
			QteMainWorkflow qteMainWorkflow=qteMainWorkflowService.findByQteId(qteId);
			result.put("success",true);
			result.put("result",qteMainWorkflow);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
}
