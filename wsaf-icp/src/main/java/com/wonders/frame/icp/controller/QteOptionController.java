package com.wonders.frame.icp.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.icp.model.bo.QteOption;
import com.wonders.frame.icp.service.QteOptionService;

/**
 * 
 * @author Administrator
 * 问卷问题选项
 */

@Controller
@RequestMapping("/qteOption")
public class QteOptionController extends AbstractGenericController<QteOption> {
	
	@Resource
	private QteOptionService qteOptionService;
	 

	@RequestMapping("/findByQuesId")
	@ResponseBody
	public HashMap<String,Object> findByQuesId(Integer quesId){
		HashMap<String,Object> result=new HashMap<String,Object>();
		try {
			List<QteOption> qteOptions=qteOptionService.findByQuesId(quesId);
			result.put("success", true);
			result.put("result",qteOptions);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
}
