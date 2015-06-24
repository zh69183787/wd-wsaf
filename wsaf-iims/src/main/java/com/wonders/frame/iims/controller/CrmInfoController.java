package com.wonders.frame.iims.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.core.model.vo.SimplePage;
import com.wonders.frame.iims.crmmodel.bo.DepFaci;
import com.wonders.frame.iims.crmmodel.bo.PcNList;
import com.wonders.frame.iims.crmmodel.vo.CrmInfo;
import com.wonders.frame.iims.service.CrmInfoService;

//@Controller
//@RequestMapping("/crmInfo")
public class CrmInfoController extends AbstractGenericController<PcNList> {
	
	@Resource
	private CrmInfoService crmInfoService;
    
	@RequestMapping("/findBySerialNO")
	public String findBySerialNo(String serialNo,HttpServletRequest request){
		return null;
	}
	
	@RequestMapping(value="/findByPage")
	@ResponseBody
	public HashMap<String,Object> findByPage(HttpServletRequest request){
		HashMap<String,Object> result=new HashMap<String,Object>();
		String dept=request.getParameter("dept")==null?"":request.getParameter("dept");
		String sortItem=request.getParameter("sortItem")==null?"":request.getParameter("sortItem");
		String sortStyle=request.getParameter("sortStyle")==null?"":request.getParameter("sortStyle");
		Integer pageSize=Integer.valueOf(request.getParameter("pageSize")==null?"10":request.getParameter("pageSize"));
		Integer pageNum=Integer.valueOf(request.getParameter("pageNum")==null?"1":request.getParameter("pageNum"));		
		HashMap<String,String> paramMap=new HashMap<String,String>();
		if(!"".equals(dept)){
			paramMap.put("department", dept);	
		}
		
		LinkedHashMap<String,String> orderBy=new LinkedHashMap<String,String>();
		if(!"".equals(sortItem)){
			orderBy.put(sortItem, sortStyle);
		}
		
		try {
			SimplePage<CrmInfo> simplePage=crmInfoService.findPageBySql(paramMap, orderBy,pageSize,pageNum);
			result.put("success", true);
			result.put("result", simplePage);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	
	@RequestMapping("/toCrmList")
	public String toCrmList(){
		return "common/crmList";
	}
	
	@RequestMapping("/toCrmDetail")
	public String toCrmDetail(String serialNo,Model model){
		model.addAttribute("serialNo", serialNo);
		return "common/crmDetail";
	}
	
	@RequestMapping("/showDetail")
	@ResponseBody
	public HashMap<String,Object> showDetail(String serialNo){
		HashMap<String,Object> result=new HashMap<String,Object>();
		try {
			//查询出指定设备编码的记录
			CrmInfo crmInfo=this.crmInfoService.findBySerialNo(serialNo);
			List<CrmInfo> crmInfoHises=this.crmInfoService.findAllHistoryBySerialNo(serialNo);
			result.put("crmInfo", crmInfo);
			result.put("crmInfoHises", crmInfoHises);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	
	@RequestMapping("/findAllDepartment")
	@ResponseBody
	public HashMap<String,Object> getAllDepartment(){
		HashMap<String,Object> result=new HashMap<String,Object>();
		try {
			List<DepFaci> depFacies=crmInfoService.findAllDepartment();
			result.put("depFacies", depFacies);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
		
	}
}
