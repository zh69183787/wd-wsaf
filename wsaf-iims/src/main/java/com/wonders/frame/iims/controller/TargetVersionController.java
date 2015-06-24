package com.wonders.frame.iims.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.core.model.vo.EntityProperty;
import com.wonders.frame.core.service.GenericService;
import com.wonders.frame.core.service.ObjInfoService;
import com.wonders.frame.core.utils.ReflectUtil;
import com.wonders.frame.exception.BusinessException;
import com.wonders.frame.iims.dao.ProjectPlanDao;
import com.wonders.frame.iims.dao.ProjectPlanTargetDao;
import com.wonders.frame.iims.dao.TargetVersionDao;
import com.wonders.frame.iims.model.bo.ProjectPlanTarget;
import com.wonders.frame.iims.model.bo.TargetVersion;

@Controller
@RequestMapping("/targetVersion")
public class TargetVersionController extends AbstractGenericController<TargetVersion>{

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Resource
	GenericService genericService;
	@Resource
	TargetVersionDao targetVersionDao;
	@Resource
	ProjectPlanTargetDao projectPlanTagrgetDao;
	@Resource
	ObjInfoService objInfoService;
	
	
	//跳转至targetPlanList页面
	@RequestMapping(value="/targetPlanList",method=RequestMethod.GET)
	public String EquipmentmanagementList(Model model,HttpServletRequest request) {	
			 
		 return "common/targetPlanList";
	}
	
	
	//第一次保存
	@RequestMapping(value="/saveFirst",method={RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public HashMap<String, Object> saveFirst(@Valid @ModelAttribute TargetVersion targetVersion,BindingResult bindingResult,ModelMap model,HttpServletRequest request) throws BusinessException {
		HashMap<String, Object> result = new HashMap<String, Object>();
		EntityProperty entityProperty=ReflectUtil.getEntityProperty(TargetVersion.class,
				request.getParameter("fieldFilter"),request.getParameter("isNeeded"));

			model.addAttribute("entity", entityProperty);
		 String errorInfo = "";
		 if (bindingResult.hasErrors()) {
			 for(FieldError error:bindingResult.getFieldErrors()){
				 System.out.println("===========error============code:"+error.getCode()+","+error.getDefaultMessage());
				 errorInfo += error.getDefaultMessage()+"\n";
			 }
			 model.addAttribute("hasErrors", true);
//			 throw new BusinessException(errorInfo);
			 //此行不能删，否则前台不能显示验证错误
			 result.put("success", false);
			 return result;
		 }		 
		 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		// System.out.println(df.format(new Date())+"&&&&&&&&&&&&&&&&&&&&&");// new Date()为获取当前系统时间
		 
		 targetVersion.setGroupCode(UUID.randomUUID().toString());
		 targetVersion.setTargetState("waitfill");
		 targetVersion.setShowCode("1");
		 targetVersion.setCreateTime(new Date());
		 targetVersion= (TargetVersion)genericService.executeMethod("targetVersion",
				"save", new Class[] {Object.class}, new Object[] {targetVersion});
		//Integer id = (Integer) ReflectUtil.invokeGet(obj, "id");
		 result.put("success", true);
		return result;
	}
	
	//执行最大值查询
	@RequestMapping(value = "/{crudObj}/findMax", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public HashMap<String, Object> findMax(
			@PathVariable("crudObj") String crudObj, HttpServletRequest request) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		try {

			Object obj = genericService.executeMethod(crudObj, "findMaxVersion",
					new Class[] {}, new Object[] { });
			result.put("success", true);
			result.put("result", obj);
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("Exception Throwable", e);
			result.put("success", false);
		}

		return result;
	}
	
	
	@RequestMapping(value = "/{crudObj}/findById", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public HashMap<String, Object> findById(
			@PathVariable("crudObj") String crudObj, HttpServletRequest request) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		try {

			Object obj = genericService.executeMethod(crudObj, "findById",
					new Class[] {}, new Object[] {request.getParameter("id")});
			result.put("success", true);
			result.put("result", obj);
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("Exception Throwable", e);
			result.put("success", false);
		}

		return result;
	}
	
	@RequestMapping(value = "/{crudObj}/Release", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public HashMap<String, Object> Release(
			@PathVariable("crudObj") String crudObj, HttpServletRequest request) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		List<Object> obj = new ArrayList<Object>();
		try {
		TargetVersion tv = targetVersionDao.findById(Integer.parseInt(request.getParameter("id")));
		List<ProjectPlanTarget> ptls = projectPlanTagrgetDao.findByVersionId(request.getParameter("id"));
		tv.setShowCode("0");
		targetVersionDao.save(tv);
		TargetVersion tvv =new TargetVersion();
		BeanUtils.copyProperties(tv, tvv);
		tvv.setId(null);
		tvv.setTargetState("final");
		tvv.setShowCode("1");
		tvv.setVersionId((Integer.parseInt(tv.getVersionId())/10*10+10)+"");
		tv= (TargetVersion)genericService.executeMethod("targetVersion",
				"save", new Class[] {Object.class}, new Object[] {tvv});
	
		for (ProjectPlanTarget ptl : ptls) {
			ProjectPlanTarget ppt =new ProjectPlanTarget();
			BeanUtils.copyProperties(ptl, ppt);
			ppt.setId(null);
			ppt.setVersionId(tv.getId()+"");
			ppt.setTianbaoState("0");
			ProjectPlanTarget ppt2 =  (ProjectPlanTarget) genericService.executeMethod("projectPlanTarget",
					"save", new Class[] {Object.class}, new Object[] {ppt});
			obj.add(ppt2);
		}
			result.put("success", true);
			result.put("result",obj);
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("Exception Throwable", e);
			result.put("success", false);
		}

		return result;
	}
	
}
