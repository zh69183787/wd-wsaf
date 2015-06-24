package com.wonders.frame.iims.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.core.model.vo.SimplePage;
import com.wonders.frame.core.utils.ReflectUtil;
import com.wonders.frame.iims.dao.ProjectPlanDao;
import com.wonders.frame.iims.model.bo.ProjectPlan;
import com.wonders.frame.iims.model.bo.ProjectPlanImposed;
import com.wonders.frame.iims.model.bo.ProjectPlanTarget;


@Controller
@RequestMapping("/projectPlan")
public class ProjectPlanController extends AbstractGenericController<ProjectPlan>{
	
	@Resource
	ProjectPlanDao projectPlanDao;
	
	
	@RequestMapping(value="/projectApplicationList",method=RequestMethod.GET)
	public String projectApplicationList(Model model,HttpServletRequest request) {	
			 
		 return "common/projectApplicationList";
	}
	@RequestMapping(value="/projectApplicationDetail",method=RequestMethod.GET)
	public String projectApplicationDetail(Model model,HttpServletRequest request) {	
			 
		 return "common/projectApplicationDetail";
	}
	@RequestMapping(value="/projectApplicationTotal",method=RequestMethod.GET)
	public String projectApplicationTotal(Model model,HttpServletRequest request) {	
			 
		 return "common/projectApplicationTotal";
	}
	@RequestMapping(value="/projectApplicationEdit",method=RequestMethod.GET)
	public String projectApplicationEdit(Model model,HttpServletRequest request) {	
			 
		 return "common/projectApplicationEdit";
	}
	@RequestMapping(value="/projectApplicationTotalEdit",method=RequestMethod.GET)
	public String projectApplicationTotalEdit(Model model,HttpServletRequest request) {	
			 
		 return "common/projectApplicationTotalEdit";
	}
	@RequestMapping(value="/resourceManageList",method=RequestMethod.GET)
	public String resourceManageList(Model model,HttpServletRequest request) {	
			 
		 return "common/resourceManageList";
	}
	@RequestMapping(value="/resourceManageDetail",method=RequestMethod.GET)
	public String resourceManageDetail(Model model,HttpServletRequest request) {	
			 
		 return "common/resourceManageDetail";
	}
	
	@RequestMapping(value="/projectReviewList",method=RequestMethod.GET)
	public String projectReviewList(Model model,HttpServletRequest request) {	
			 
		 return "common/projectReviewList";
	}
	@RequestMapping(value="/projectReviewEdit",method=RequestMethod.GET)
	public String projectReviewEdit(Model model,HttpServletRequest request) {	
			 
		 return "common/projectReviewEdit";
	}
	@RequestMapping(value="/projectReviewDetail",method=RequestMethod.GET)
	public String projectReviewDetail(Model model,HttpServletRequest request) {	
			 
		 return "common/projectReviewDetail";
	}
	@RequestMapping(value="/projectMeetingList",method=RequestMethod.GET)
	public String projectMeetingList(Model model,HttpServletRequest request) {	
			 
		 return "common/projectMeetingList";
	}
	
	
	@RequestMapping(value = "/completeData", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public HashMap<String, Object> completeData(HttpServletRequest request,String param,Integer pageNum,Integer pageSize	
			) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		try {
			//meetingReview  status
			//List<ProjectPlan> list = projectPlanDao.findAll();
			String sql = " from ProjectPlan o "
					+ " where  o.removed=:s_removed "
					+ " and  ( o.projectName like:s_param  or o.applyer like:s_param  or o.year like:s_param  ) "
					+ "  ";
				//+ " and o.projectName like :projectName_l  ";
			//UserInfo userInfo=(UserInfo)req.getSession().getAttribute("user");
			int pz = request.getParameter("pageSize")==null?10:Integer.parseInt(request.getParameter("pageSize").toString());
			int pn = request.getParameter("pageNum")==null?1:Integer.parseInt(request.getParameter("pageNum").toString());

			//projectPlanDao.findByPageWithHql
			
			//String pn2 = request.getParameter("status_in");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("s_param", "%"+param.trim()+"%");
			map.put("s_removed", 0);
			map.put("isQueryParams", false);
			param =request.getParameter("param")==null?"":request.getParameter("param").toString();
			
			SimplePage<ProjectPlan>  pages = projectPlanDao.findByPageWithHql(sql,map, pz,pn);
			
		
			result.put("success", true);
			result.put("list", pages.getContent());
		} catch (Exception e) {
			// e.printStackTrace();
			result.put("success", false);
		}

		return result;
	}
}
