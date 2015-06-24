package com.wonders.frame.iims.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.core.model.vo.EntityProperty;
import com.wonders.frame.core.model.vo.SimplePage;
import com.wonders.frame.core.service.GenericService;
import com.wonders.frame.core.service.ObjInfoService;
import com.wonders.frame.core.utils.ReflectUtil;
import com.wonders.frame.exception.BusinessException;
import com.wonders.frame.iims.dao.ProjectPlanDao;
import com.wonders.frame.iims.dao.ProjectPlanImposedDao;
import com.wonders.frame.iims.dao.ProjectPlanTargetDao;
import com.wonders.frame.iims.dao.SimpleFlowMainDao;
import com.wonders.frame.iims.dao.TargetVersionDao;
import com.wonders.frame.iims.model.bo.ProjectPlan;
import com.wonders.frame.iims.model.bo.ProjectPlanImposed;
import com.wonders.frame.iims.model.bo.ProjectPlanTarget;
import com.wonders.frame.iims.model.bo.SimpleFlowMain;
import com.wonders.frame.iims.model.bo.SimpleFlowNode;
import com.wonders.frame.iims.model.bo.TargetVersion;
import com.wonders.frame.iims.model.vo.CurrentLogin;
import com.wonders.frame.iims.service.CaRestAPIService;
import com.wonders.frame.iims.service.ProjectPlanTargetService;
import com.wonders.frame.iims.service.SimpleFlowService;

@Controller
@RequestMapping("/projectplanimposed")
public class ProjectPlanImposedController extends AbstractGenericController<ProjectPlanImposed>{

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Resource
	GenericService genericService;
	@Resource
	TargetVersionDao targetVersionDao;
	@Resource
	ProjectPlanImposedDao projectPlanImposedDao;
	@Resource
	ProjectPlanDao projectPlanDao;
	
	@Resource
	ProjectPlanTargetDao projectPlanTargetDao;
	@Resource
	ProjectPlanTargetService projectPlanTagrgetService;
	
	@Resource
	ObjInfoService objInfoService;
	
	@Resource
	SimpleFlowService simpleFlowService;
	@Resource
	SimpleFlowMainDao simpleFlowMainDao;
	
	
	
	@RequestMapping(value = "/{crudObj}/details", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public HashMap<String, Object> Details(
			@PathVariable("crudObj") String crudObj, HttpServletRequest request) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		try {
			
			ProjectPlanTarget ppt =  (ProjectPlanTarget) projectPlanTargetDao.findById(Integer.parseInt(request.getParameter("id")));
			
			ProjectPlanImposed ppi = (ProjectPlanImposed)projectPlanImposedDao.findByProjectId(ppt.getId());
			
			ProjectPlan pp =  (ProjectPlan) projectPlanDao.findById(Integer.parseInt(ppt.getProjectPlanID()));
			result.put("success", true);
			result.put("result1", ppi);
			result.put("result2", ppt);
			result.put("result3", pp);
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("Exception Throwable", e);
			result.put("success", false);
		}

		return result;
	}
	
	
	
	@RequestMapping(value="/projectImposedTargetList",method=RequestMethod.GET)
	public String projectPlanTargetList(Model model,HttpServletRequest request) {	
			 String id = (request.getParameter("id")==null||"".equals(request.getParameter("id")))?"-1":request.getParameter("id").toString();
			 request.setAttribute("id",id);
			 
			/*	Object obj1 = request.getSession().getAttribute("deptName");
				Object obj2 = request.getSession().getAttribute("loginName");
				Object obj3 = request.getSession().getAttribute("deptId");
				Object obj4 = request.getSession().getAttribute("userName");*/
			 
			 return "common/projectImposedTargetList";
	}
	
	@RequestMapping(value="/projectImposedTargetFlow",method=RequestMethod.GET)
	public String projectImposedTargetFlow(Model model,HttpServletRequest request,HttpServletResponse response) {	
		CurrentLogin currentLogin=CaRestAPIService.getLoginInfoAndDeptFromCa(request, response);
		String loginname = currentLogin.getCookies().get("loginName");
		request.setAttribute("loginname", loginname);
		return "common/projectImposedTargetFlow";
	}
	
	@RequestMapping(value="/projectImposedPage",method=RequestMethod.GET)
	public String projectPlanTargetPage(Model model,HttpServletRequest request,HttpServletResponse response) {	
		
		String projectTargetId = (request.getParameter("projectTargetId")==null||"".equals(request.getParameter("projectTargetId")))?"-1":request.getParameter("projectTargetId").toString();
		ProjectPlanImposed ppi =  new ProjectPlanImposed();
		ProjectPlan pp = new ProjectPlan();
		ProjectPlanTarget ppt =  (ProjectPlanTarget) projectPlanTargetDao.findById(Integer.parseInt(projectTargetId));
		
		SimpleFlowMain main = null;
		String loginname =null;// 当前人    用于判断当前人是否可处理
		
		String isedit ="0"; //不可填报
		
		if(ppt!=null&&ppt.getId()!=null){
			
			String istb = ppt.getTianbaoState();
			
			ppi = projectPlanTagrgetService.findImposedByProjectTargetId(ppt.getId());  // 查询不到  就新增一条记录
			pp =  (ProjectPlan) projectPlanDao.findById(Integer.parseInt(ppt.getProjectPlanID()));
			String flowCode = ProjectPlanImposed.class.getSimpleName()+":simple:"+ppi.getId();
			main = simpleFlowService.findByFlowCodeWithNowLog(flowCode);
			
			if(istb!=null&&istb.equals("0")){ //报表已经发布  发布状态  才可以编辑    还需验证当前登录人员信息
				isedit ="1";
				// 验证当前操作人是否为 申请人
				CurrentLogin currentLogin=CaRestAPIService.getLoginInfoAndDeptFromCa(request, response);
				loginname = currentLogin.getCookies().get("loginName");
				//Object loginname = request.getSession().getAttribute("loginName");
				
				if(ppt.getApplyerLoginname()!=null&&loginname!=null&&ppt.getApplyerLoginname().equals(loginname)&&!"".equals(ppt.getApplyerLoginname())){
					isedit ="1";
					//验证流程是否流转
					
					if(main==null||main.getId()==null){ //开启新流程
						String flowName = ppt.getProjectName()+"填报审核流程";
						String userName = currentLogin.getCookies().get("userName");// (String) request.getSession().getAttribute("userName");
						String deptName = currentLogin.getCompanyName();//(String) request.getSession().getAttribute("deptName");
						String deptId = currentLogin.getCompanyId();
						main = simpleFlowService.startFlow(flowCode,flowName,userName,loginname.toString(),deptName,deptId );
					}
					
				}
				
				if(main==null||(main.getStatus()!=null&&!main.getStatus().equals("0"))){
					isedit ="0";
				}else{
					isedit ="1";
				}
			}
		}
		
		String isdisabled = "disabled=disabled";
		if(isedit.equals("1")){
			isdisabled="";
		}
		
		request.setAttribute("ppi", ppi);
		request.setAttribute("pp", pp);
		request.setAttribute("ppt", ppt);
		request.setAttribute("isedit", isedit);
		request.setAttribute("main", main);
		request.setAttribute("isdisabled", isdisabled);
		request.setAttribute("loginname", loginname);
		
		
		return "common/projectPlanImposePage";
	}
	
	
	
	// 按条件查询（分页，排序）
		@RequestMapping(value = "/pageplan", method = { RequestMethod.POST,RequestMethod.GET })
		@ResponseBody
		public HashMap<String, Object> findByPage( HttpServletRequest request) {
			HashMap<String, Object> result = new HashMap<String, Object>();
			
			
			
			String sql = " from ProjectPlanTarget o,ProjectPlan p,TargetVersion v "
					+ " where o.versionId= v.id and o.projectPlanID = p.id and o.removed=:removed "
					+ " and p.applyerLoginname is not null	and v.showCode='1' and v.targetState='final' ";
				//+ " and o.projectName like :projectName_l  ";
			//UserInfo userInfo=(UserInfo)req.getSession().getAttribute("user");
			int pz = request.getParameter("pageSize")==null?16:Integer.parseInt(request.getParameter("pageSize").toString());
			int pn = request.getParameter("pageNum")==null?1:Integer.parseInt(request.getParameter("pageNum").toString());

			
			
			String pn2 = request.getParameter("status_in");
			SimplePage<ProjectPlanTarget>  pages = projectPlanTagrgetService.findByPageWithHql(sql, ReflectUtil.formatQueryParam(request,ProjectPlanTarget.class), pz,pn);
			
		
		/*	Class<?> crudObjClazz = objInfoService.getEntityClassByType(crudObj);
			Object qr = queryData("findByPage", crudObjClazz, request);*/

			if (pages == null) {
				result.put("success", false);
			} else {
				result.put("success", true);
				result.put("result", pages);
			}
			return result;
		}
		
		
		
		//第一次保存
		@RequestMapping(value="/saveFirst",method=RequestMethod.POST)
		@ResponseBody
		public HashMap<String, Object>  saveObjectAjax(@Valid @ModelAttribute ProjectPlanImposed projectPlanImposed,BindingResult bindingResult,ModelMap model,HttpServletRequest request) throws BusinessException {
			String isSubmit = request.getParameter("isSubmit")!=null&&!request.getParameter("isSubmit").equals("")?request.getParameter("isSubmit").toString():"";
			HashMap<String, Object> result = new HashMap<String, Object>();
			if(projectPlanImposed.getProjectTargetId()!=null&&"1".equals(isSubmit)){ // isSubmit 提交审核 并开启流程
				ProjectPlanTarget ppt =  (ProjectPlanTarget) projectPlanTargetDao.findById(projectPlanImposed.getProjectTargetId());
				ppt.setTianbaoState("1");
				projectPlanTargetDao.save(ppt);
				
				SimpleFlowMain main = new SimpleFlowMain();
				main.setFlowCode(ProjectPlanImposed.class.getSimpleName()+":"+projectPlanImposed.getId());
				main.setFlowName(ppt.getProjectName()+"填报审批流程");
			
			}
			
			projectPlanImposed.setRemoved(0);
			System.out.println(projectPlanImposed.getId());
			
			projectPlanImposed = projectPlanImposedDao.save(projectPlanImposed);
			//projectPlanImposed
					
			result.put("success", true);
			result.put("ppi", projectPlanImposed);
			return result;
		}
		
		@RequestMapping(value="/dealFlowByObjId")
		public String dealFlowByObjId(Integer id) throws BusinessException {
			
			ProjectPlanImposed p = projectPlanImposedDao.findById(id);
					
			return "redirect:/projectplanimposed/projectImposedPage?projectTargetId="+p.getProjectTargetId();
		}
	
}
