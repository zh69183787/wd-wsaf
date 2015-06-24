package com.wonders.frame.icp.controller;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.icp.model.bo.QteUserMain;
import com.wonders.frame.icp.service.QteUserMainService;

/**
 * 
 * @author Administrator
 * 用户填写问卷关系
 */
@Controller
@RequestMapping("/qteUserMain")
public class QteUserMainController extends AbstractGenericController<QteUserMain>{

	@Resource
	private QteUserMainService qteUserMainService;
	
	@RequestMapping("/findByMainIdAndLoginName")
	@ResponseBody
	public HashMap<String,Object> findByMainIdAndLoginName(Integer mainId,String loginName){
		HashMap<String,Object> result=new HashMap<String,Object>();
		try {
			QteUserMain qteUserMain=qteUserMainService.findByMainIdAndLoginName(mainId, loginName);
			result.put("success", true);
			result.put("result", qteUserMain);
		} catch (Exception e) {
           e.printStackTrace();
           result.put("success", false);
		}
		return result;
	}
}
