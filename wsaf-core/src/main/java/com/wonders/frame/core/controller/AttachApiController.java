/** 
* @Title: UserEditController.java 
* @Package com.wonders.frame.core.controller 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.core.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.wonders.frame.core.model.bo.Attach;
import com.wonders.frame.core.service.AttachService;
import com.wonders.frame.core.utils.DateFormatUtil;
import com.wonders.frame.core.utils.FileUtil;
import com.wonders.frame.core.utils.JacksonMapper;
import com.wonders.frame.core.utils.ReflectUtil;

@Controller
@RequestMapping("/attach/api")
public class AttachApiController extends AbstractGenericApiController<Attach>{
	private final Logger logger=LoggerFactory.getLogger(this.getClass());	
	@Resource 
	AttachService attachService;
	/**
	 * 上传文件,支持多附件(未与业务绑定)
	 * @param request.groupName
	 * @param request.uploader
	 * @return list<attach>
	 */
	@RequestMapping(value = "/upload", method ={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public HashMap<String,Object> upload(HttpServletRequest request, HttpServletResponse response) throws InstantiationException, IllegalAccessException{
		HashMap<String,Object> result=new HashMap<String,Object>();
		ArrayList<Attach> attachList=attachService.uploadfy(request);
		if(attachList.size()>0){
			result.put("success", true);		
			result.put("result", attachList);
		}else{
			result.put("success", false);		
		}
	    return result;
	}
	
	/**
	 * 绑定附件至业务(批量)
	 * @param request.modelName
	 * @param request.modelId
	 * @param request.attachIds
	 * @return
	 */
	@RequestMapping(value = "/bind", method ={RequestMethod.POST})
	@ResponseBody
	public HashMap<String,Object> bindAttachs(HttpServletRequest request){
		HashMap<String,Object> result=new HashMap<String,Object>();
		
		boolean success=attachService.saveBind(request);
		if(success){
			result.put("success", true);
		}else{
			result.put("success", false);
		}
		
		return result;
	}
	
	
	/**
	 * 下载附件
	 * @param id
	 * @return
	 */
	
	@RequestMapping(value="/download/{id}", method ={RequestMethod.GET})
	@ResponseBody
	public void downloadById(@PathVariable("id") Integer id,HttpServletResponse response){
		attachService.download(id, response);
	}
	
	/**
	 * 删除一组附件
	 * @param request.modelName		
	 * @param request.modelId
	 * @param request.groupName
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/removeByGroup")
	public HashMap<String,Object> removeByGroup(HttpServletRequest request){
		HashMap<String,Object> result=new HashMap<String,Object>();
		
		boolean success=attachService.removeByGroup(request);
		if(success){
			result.put("success", true);
		}else{
			result.put("success", false);
		}
		return result;
	}
}
