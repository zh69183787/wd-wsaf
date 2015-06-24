package com.wonders.frame.icp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wonders.frame.icp.model.bo.QteGroup;
import com.wonders.frame.icp.model.vo.QteMainDetail;
import com.wonders.frame.icp.model.vo.QteStatistics;
import com.wonders.frame.icp.service.QteComplexInfoService;

@Controller
@RequestMapping("/qteComplexInfo")
public class QteComplexInfoController {
	
	
	@Resource
	private QteComplexInfoService qteComplexInfoService;
	
	
	
	@RequestMapping(value="/interaction",method=RequestMethod.GET)
    public String interaction(Model model,HttpServletRequest request) {
        return "common/interaction";
    }
	
	/**
	 * 部门领导审核页面
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/deptAudit")
	 public String deptAudit(Model model,HttpServletRequest request) {
		String mainId=request.getParameter("mainId");
		model.addAttribute("mainId", mainId);
        return "common/deptAudit";
    }
	
	/**
	 * 部门领导审核入口界面
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/qteDeptAudit")
	 public String qteDeptAudit(Model model,HttpServletRequest request) {
		String mainId=request.getParameter("mainId");
		model.addAttribute("mainId", mainId);
       return "common/qteDeptAudit";
   }
	
	/**
	 * 条线领导审核入口界面
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/qteLineAudit")
	 public String qteLineAudit(Model model,HttpServletRequest request) {
	   String mainId=request.getParameter("mainId");
	   model.addAttribute("mainId", mainId);
       return "common/qteLineAudit";
   }
	
	/**
	 * 条线领导审核界面
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/lineAudit")
	 public String lineAudit(Model model,HttpServletRequest request) {
	   String mainId=request.getParameter("mainId");
	   model.addAttribute("mainId", mainId);
      return "common/lineAudit";
   }
	
	/**
	 * 获取问卷全部信息
	 * @param mainId
	 * @return
	 */
	
	
	@RequestMapping("/findMainDetailByMainId/{id}")
	@ResponseBody
	public HashMap<String,Object> findMainDetailByMainId(@PathVariable("id")Integer mainId){
		HashMap<String,Object> result=new HashMap<String,Object>();
		try {
			List<QteMainDetail> qteMainDetails=qteComplexInfoService.findMainDetailByMainId(mainId);
			result.put("success",true);
			result.put("result",qteMainDetails);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	
	/**
	 * 获取当前问卷下题目数
	 * @param mainId 问卷id
	 * @return
	 */
	@RequestMapping("/findCountByMainId/{id}")
	@ResponseBody
	public HashMap<String,Object> findCountByMainId(@PathVariable("id")Integer mainId){
		HashMap<String,Object> result=new HashMap<String,Object>();
		try {
			Integer count =qteComplexInfoService.findCountByMainId(mainId);
			result.put("success", true);
			result.put("result",count);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}	
	
	/**
	 * 查询问卷下所有分组
	 * @param mainId 问卷id
	 * @return
	 */
	@RequestMapping("/findByMainId/{id}")
	@ResponseBody
	public HashMap<String,Object> findByMainId(@PathVariable("id")Integer mainId){
		HashMap<String,Object> result=new HashMap<String,Object>();
		try {
	     	List<QteGroup> qteGroups=qteComplexInfoService.findByMainId(mainId);   	
	        result.put("success",true);
	        result.put("result", qteGroups);
		} catch (Exception e) {
		   e.printStackTrace();
		   result.put("success", false);
		}
		return result;
	}
	
	
	/**
	 * 获取填写问卷总人数
	 * @param mainId
	 * @return
	 */
	@RequestMapping("/findUserCountByMainId/{id}")
	@ResponseBody
	public HashMap<String,Object> findUserCountByMainId(@PathVariable("id")Integer mainId){
		HashMap<String,Object> result=new HashMap<String,Object>();
		try {
			Integer count=qteComplexInfoService.findUserCountByMainId(mainId);
	        result.put("success",true);
	        result.put("count", count);//问卷参与总人数
		} catch (Exception e) {
		   e.printStackTrace();
		   result.put("success", false);
		}
		return result;
	}
	
	/**
	 * 获取问卷下所有问题选项
	 * @param mainId
	 * @return
	 */
	@RequestMapping("/getQteMainByMainId/{id}")
	@ResponseBody
	public HashMap<String,Object> getQteMainByMainId(@PathVariable("id")Integer mainId){
		HashMap<String,Object> result=new HashMap<String,Object>();
		try {
			List<QteStatistics> q=qteComplexInfoService.getQteMainByMainId(mainId);
	        result.put("success",true);
	        result.put("result", q);//问卷参与总人数
		} catch (Exception e) {
		   e.printStackTrace();
		   result.put("success", false);
		}
		return result;
	}
	
	
	/**
	 * 获取饼状图中各部门参与人数数据
	 * @param mainId
	 * @return
	 */
	@RequestMapping("/getPieDataOfDept/{id}")
	@ResponseBody
	public HashMap<String,Object> getPieDataOfDept(@PathVariable("id")Integer mainId){
		HashMap<String,Object> result=new HashMap<String,Object>();
		try {
            Map<String,Integer> data=qteComplexInfoService.getPieDataOfDeptByMainId(mainId);
	        result.put("success",true);
	        result.put("result", data);//统计数据
		} catch (Exception e) {
		   e.printStackTrace();
		   result.put("success", false);
		}
		return result;
	}
	

	
	@RequestMapping("/getDeptsByMainId/{id}")
	@ResponseBody
	public HashMap<String,Object> getDeptsByMainId(@PathVariable("id")Integer mainId){
		HashMap<String,Object> result=new HashMap<String,Object>();
		try {
            List<Object> qList=qteComplexInfoService.getDeptsByMainId(mainId);
	        result.put("success",true);
	        result.put("result", qList);//统计数据
		} catch (Exception e) {
		   e.printStackTrace();
		   result.put("success", false);
		}
		return result;
	}	
}
