package com.wonders.frame.iims.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.iims.dao.ProjectPlanDao;
import com.wonders.frame.iims.dao.ProjectPlanTargetDao;
import com.wonders.frame.iims.model.bo.ProjectPlan;
import com.wonders.frame.iims.model.bo.ProjectPlanTarget;
@Controller
@RequestMapping("/projectPlanTarget")
public class ProjectPlanTargetController extends AbstractGenericController<ProjectPlanTarget>{
	@Resource
	ProjectPlanTargetDao projectPlanTargetDao;
	@Resource
	ProjectPlanDao projectPlanDao;
	
	
	@RequestMapping(value="/projectPlanTargetList",method=RequestMethod.GET)
	public String projectPlanTargetList(Model model,HttpServletRequest request) {	
			 String id = (request.getParameter("id")==null||"".equals(request.getParameter("id")))?"-1":request.getParameter("id").toString();
			 request.setAttribute("id",id);
			 return "common/projectPlanTargetList";
	}
	
	@RequestMapping(value="/projectPlanTargetDetail",method=RequestMethod.GET)
	public String projectPlanTargetDetail(Model model,HttpServletRequest request) {	
			 String id = (request.getParameter("id")==null||"".equals(request.getParameter("id")))?"-1":request.getParameter("id").toString();
			 
			 ProjectPlanTarget projectPlanTarget = projectPlanTargetDao.findById(Integer.parseInt(id));
			 request.setAttribute("ppt",projectPlanTarget);
			 return "common/projectPlanTargetDetail";
	}
	
	
	@RequestMapping(value = "/{crudObj}/findById", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public HashMap<String, Object> findById(
			@PathVariable("crudObj") String crudObj, HttpServletRequest request) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		try {

			Object obj = projectPlanTargetDao.findById(Integer.parseInt(request.getParameter("id")));
			result.put("success", true);
			result.put("result", obj);
		} catch (Exception e) {
			// e.printStackTrace();
			result.put("success", false);
		}

		return result;
	}
	@RequestMapping(value="/incEdit",method=RequestMethod.GET)
	public String incEdit(Model model,HttpServletRequest request,
			String id,Boolean isEdit,Boolean isShowBut) {	
			 
		if(isEdit==null||"".equals(isEdit)){
			isEdit=false;
		}
		if(isShowBut==null||"".equals(isShowBut)){
			isShowBut=true;
		}
		
		String isDisabled = "disabled='disabled'";
		if(isEdit){
			isDisabled="";
		}
		
		request.setAttribute("isDisabled", isDisabled);
			 ProjectPlanTarget projectPlanTarget = projectPlanTargetDao.findById(Integer.parseInt(id));
			 String projectId = projectPlanTarget.getProjectPlanID();
			 ProjectPlan projectPlan =null;
			 if(projectId!=null&&!"".equals(projectId)){
				 projectPlan = projectPlanDao.findById(Integer.parseInt(projectId));
				 if(projectPlan==null){projectPlan = new ProjectPlan();}
			 }else{
				 projectPlan = new ProjectPlan();
			 }
		     
			 request.setAttribute("isEdit",isEdit);
			 request.setAttribute("isShowBut",isShowBut);
		     request.setAttribute("pp",projectPlan);
			 request.setAttribute("ppt",projectPlanTarget);
			 
			 
			 return "common/projectTargetIncMdify";
	}
	
/*	@RequestMapping(value = "/findById", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public HashMap<String, Object> findMax(
			@PathVariable("crudObj") String crudObj, HttpServletRequest request) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		try {

			Object obj = projectPlanTargetDao.findById(Integer.parseInt(request.getParameter("id")));
			result.put("success", true);
			result.put("result", obj);
		} catch (Exception e) {
			 e.printStackTrace();
			result.put("success", false);
		}

		return result;
	}
	*/
	
	//projectPlanTarget/projectApplicationDetail?id=267
}
