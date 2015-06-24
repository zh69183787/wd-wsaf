/** 
* @Title: UserEditController.java 
* @Package com.wonders.frame.core.controller 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.core.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wonders.frame.core.model.bo.ObjInfo;
import com.wonders.frame.core.service.ObjInfoService;

@Controller
@RequestMapping("/objInfo/api")
public class ObjInfoApiController extends AbstractGenericApiController<ObjInfo>{
	
	@Resource
	private ObjInfoService objInfoService;

	@RequestMapping("/getObjInfos")
	@ResponseBody
	public HashMap<String,Object> getObjInfos(String objTypes){
		HashMap<String,Object> result=new HashMap<String,Object>();
		List<ObjInfo> objInfos=new ArrayList<ObjInfo>();
		try {
			String[] types=objTypes.split(",");
			for(String type:types){
				ObjInfo objinfo=this.objInfoService.findByType(type.trim());
				objInfos.add(objinfo);
			}
			result.put("success",true);
			result.put("result",objInfos );
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success",false);
		}
		return result;
	}
	
	@RequestMapping("/findObjInfosByIds")
	@ResponseBody
	public HashMap<String,Object> findObjInfosByIds(String ids){
		HashMap<String,Object> result=new HashMap<String,Object>();
		String[] temp = ids.split(",");
		Integer[] intIds = new Integer[temp.length];
		for(int i=0;i<temp.length;i++)
		{
			intIds[i] = Integer.parseInt(temp[i]);
		}
		List<ObjInfo> objInfos=new ArrayList<ObjInfo>();
		try {
			objInfos=this.objInfoService.findByIdIn(intIds);
			result.put("success",true);
			result.put("result",objInfos );
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success",false);
		}
		return result;
	}

}
