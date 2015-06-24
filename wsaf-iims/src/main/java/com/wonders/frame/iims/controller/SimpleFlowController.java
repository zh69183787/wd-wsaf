package com.wonders.frame.iims.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.core.model.vo.SimplePage;
import com.wonders.frame.core.utils.ReflectUtil;
import com.wonders.frame.iims.model.bo.ProjectPlanTarget;
import com.wonders.frame.iims.model.bo.SimpleFlowLog;
import com.wonders.frame.iims.model.bo.SimpleFlowMain;
import com.wonders.frame.iims.model.vo.CurrentLogin;
import com.wonders.frame.iims.service.CaRestAPIService;
import com.wonders.frame.iims.service.SimpleFlowService;

@Controller
@RequestMapping("/simpleFlow")
public class SimpleFlowController extends AbstractGenericController<SimpleFlowMain>{

	@SuppressWarnings("unused")
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Resource
	SimpleFlowService simpleFlowService;
	
	// 发起人提交审批
	@RequestMapping(value = "/dealFlow", method = { RequestMethod.POST,RequestMethod.GET })
	@ResponseBody
	public HashMap<String, Object> startFlow( HttpServletRequest request,SimpleFlowLog log) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		simpleFlowService.firstStartFlow(log, request);
		
		
		result.put("success", true);
		return result;
	}
	
	
	// 查询当前对象  所有的审批记录
	@RequestMapping(value = "/loadFlow", method = { RequestMethod.POST,RequestMethod.GET })
	@ResponseBody
	public HashMap<String, Object> loadFlowLogs( HttpServletRequest request,HttpServletResponse response,String objId,String simpleClassName,String type) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		String flowCode = simpleClassName+":"+type+":"+objId;
		// status 2 已完成的记录 
		List<SimpleFlowLog> logs = simpleFlowService.findLogsByFlowCodeStatus(flowCode,"2");
		
		CurrentLogin currentLogin=CaRestAPIService.getLoginInfoAndDeptFromCa(request, response);
		String userLoginName = currentLogin.getCookies().get("loginName");
		//Object userLoginName = request.getSession().getAttribute("loginName"); // 获取当前人信息
		SimpleFlowLog userLog =null;
		if(userLoginName!=null){
			List<SimpleFlowLog> userLogs = simpleFlowService.findLogsByLoginName(flowCode,"1",userLoginName.toString());
			if(userLogs!=null&&userLogs.size()>0){
				userLog = userLogs.get(0);
				userLog.setNextLog(simpleFlowService.findByOrderIndex(userLog.getMainId(),userLog.getOrderIndexNext()));
			}
		}
		
		SimpleFlowMain main = simpleFlowService.findMainByFlowCode(flowCode);
		
		
		result.put("success", true);
		result.put("logs", logs);
		result.put("userLog", userLog);
		result.put("main", main);
		return result;
	}
	
	// 按条件查询（分页，排序）
	@RequestMapping(value = "/pageflow", method = { RequestMethod.POST,RequestMethod.GET })
	@ResponseBody
	public HashMap<String, Object> findByPageFlow( HttpServletRequest request) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		
//		m.flow_code = 'ProjectPlanImposed:simple:'||i.id
		CurrentLogin currentLogin=CaRestAPIService.getLoginInfoAndDeptFromCa(request, null);
		String loginname = currentLogin.getCookies().get("loginName");
		
		String sql = " from SimpleFlowMain o,SimpleFlowLog g where o.removed=:removed "
				+ " and o.id=g.mainId and o.status ='1' and g.status=:status "
				+ " ";
		if(request.getParameter("flowName_l")!=null&&!"".equals(request.getParameter("flowName_l"))){
			sql+=" and o.flowName like:flowName_l ";
		}
		if(loginname!=null&&!"".equals(loginname)){
			sql+=" and g.dealUserLoginname='"+loginname+"' ";
		}else{
			sql+=" and 1=0 ";
		}
			//+ " and o.projectName like :projectName_l  ";
		//UserInfo userInfo=(UserInfo)req.getSession().getAttribute("user");
		int pz = request.getParameter("pageSize")==null?16:Integer.parseInt(request.getParameter("pageSize").toString());
		int pn = request.getParameter("pageNum")==null?1:Integer.parseInt(request.getParameter("pageNum").toString());
		
		SimplePage<SimpleFlowMain>  pages = simpleFlowService.findByPageWithHql(sql, ReflectUtil.formatQueryParam(request,SimpleFlowMain.class), pz,pn);
		
	
	/*	Class<?> crudObjClazz = objInfoService.getEntityClassByType(crudObj);
		Object qr = queryData("findByPage", crudObjClazz, request); +":"+*/

		if (pages == null) {
			result.put("success", false);
		} else {
			result.put("success", true);
			result.put("result", pages);
		}
		return result;
	}
	
	
		
	
}
