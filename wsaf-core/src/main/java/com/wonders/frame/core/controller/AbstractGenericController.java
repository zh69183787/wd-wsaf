/** 
* @Title: GenericController.java 
* @Package com.wonders.frame.core.controller 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.core.controller;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wonders.frame.core.model.vo.EntityProperty;
import com.wonders.frame.core.model.vo.SimplePage;
import com.wonders.frame.core.service.GenericService;
import com.wonders.frame.core.utils.ReflectUtil;
import com.wonders.frame.exception.BusinessException;
/** 
 * @ClassName: GenericController 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 */

public abstract class AbstractGenericController<T>{
	@Resource
	GenericService genericService;
	
	private Class<T> entityClass;
	
	private String entityName;

	public AbstractGenericController() {
		Type t = getClass().getGenericSuperclass();
        this.entityClass = (Class<T>)((ParameterizedType)t).getActualTypeArguments()[0];    
		this.entityName=StringUtils.uncapitalize(this.entityClass.getSimpleName());
	}
	
	@InitBinder   
    public void initBinder(WebDataBinder binder) {   
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));      
    }  
	private T findEntity(){
		 T entity=null;
		 try{
			 entity=this.entityClass.newInstance();
		 } catch (InstantiationException e) {
				e.printStackTrace();
				return null;
			 } catch (IllegalAccessException e) {
				e.printStackTrace();
				return null;
			 }
		return entity;
	}
//	新增get
	@RequestMapping(value="/new",method=RequestMethod.GET)
	public String newObject(Model model,HttpServletRequest request) {	
		EntityProperty entityProperty=ReflectUtil.getEntityProperty(this.entityClass,
				request.getParameter("fieldFilter"),request.getParameter("isNeeded"));

		model.addAttribute("entity", entityProperty);	 
		 model.addAttribute(entityName, findEntity());
			 
		 return "common/edit";
	}


//	修改
	@RequestMapping(value="/edit/{id}",method=RequestMethod.GET)
	public String editObject(@PathVariable("id") Integer id,Model model,HttpServletRequest request) {
		 T obj=findById(id);		
		 if(obj==null){
			 obj=findEntity();
		 }
			EntityProperty entityProperty=ReflectUtil.getEntityProperty(this.entityClass,
					request.getParameter("fieldFilter"),request.getParameter("isNeeded"));

		model.addAttribute("entity", entityProperty);
		model.addAttribute(entityName, obj);
		model.addAttribute("crudObj", entityName);
		model.addAttribute("crudObjId", id);
		
		return "common/edit";
	}
	
//	保存
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public String saveObject(@Valid @ModelAttribute T obj,BindingResult bindingResult,ModelMap model,HttpServletRequest request) throws BusinessException {
		
		EntityProperty entityProperty=ReflectUtil.getEntityProperty(this.entityClass,
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
			 
			 return "common/edit";
		 }		 
		
		obj= (T)genericService.executeMethod(this.entityName,
				"save", new Class[] {Object.class}, new Object[] {obj});
		Integer id = (Integer) ReflectUtil.invokeGet(obj, "id");
				
		return "redirect:/"+entityName+"/list";
	}
	
	//保存--测试ajax验证
	@RequestMapping(value="/saveObj",method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object>  saveObj(@Valid @ModelAttribute T obj,BindingResult bindingResult,ModelMap model,HttpServletRequest request) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		EntityProperty entityProperty=ReflectUtil.getEntityProperty(this.entityClass,
				request.getParameter("fieldFilter"),request.getParameter("isNeeded"));
		model.addAttribute("entity", entityProperty);
		String errorInfo = "";
		String name = request.getParameter("name");
		Map<String, String> paramMap = request.getParameterMap();
		HashMap<String, String> hmParam = new HashMap<String, String>();
		for (String key : paramMap.keySet()) {
			hmParam.put(key, request.getParameter(key));
		}
		try {
			HashMap<String, String> mapErrors = new LinkedHashMap<String, String>();
			if (bindingResult.hasErrors()) {
				for(FieldError error:bindingResult.getFieldErrors()){
					System.out.println("===========error============code:"+error.getCode()+","+error.getDefaultMessage());
					errorInfo += error.getDefaultMessage()+"\n";
					mapErrors.put(error.getField(), error.getDefaultMessage());
				}
				model.addAttribute("hasErrors", true);
				result.put("errors", mapErrors);
				result.put("errorInfo", errorInfo);
				result.put("success", false);
			    return result;
			}		 
			obj= (T)genericService.executeMethod(this.entityName,
					"save", new Class[] {Object.class}, new Object[] {obj});
			result.put("success", true);
			result.put("result", obj);
		} catch (Exception e) {
			// e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	
//	逻辑删除
	@RequestMapping(value="/del/{id}",method={RequestMethod.GET})
	public String delObject(@PathVariable("id") Integer id,Model model) {

		Integer successNum= (Integer)genericService.executeMethod(this.entityName,
				"removeById", new Class[] {Integer.class}, new Object[] {id});
		
		return "redirect:/"+entityName+"/list";
	}
	
	
//	查询单个记录
	@RequestMapping(value="/get/{id}",method={RequestMethod.POST,RequestMethod.GET})
	public String findById(@PathVariable("id") Integer id,Model model,HttpServletRequest request){
		 T obj=findById(id);

			EntityProperty entityProperty=ReflectUtil.getEntityProperty(this.entityClass,
					request.getParameter("fieldFilter"),request.getParameter("isNeeded"));

		 model.addAttribute("entity", entityProperty);
		 model.addAttribute(entityName, obj);
					
		 return "common/edit";
	}
	
	
	private T findById(Integer id ){

		T obj = (T)genericService.executeMethod(this.entityName,
				"findById", new Class[] {Integer.class}, new Object[] {id});
		return obj;
	}
	
//	按条件查询（分页，排序）
	@RequestMapping(value="/list",method={RequestMethod.POST,RequestMethod.GET}) 
	public String list(@ModelAttribute T obj,Model model,HttpServletRequest request) {
		int pageNum=0,pageSize=0;
        String pId=request.getParameter("pId");
        if(pId==null){
        	pId="";
        }
        String pType=request.getParameter("pType");
        if(pType==null){
        	pType=entityName;
        }
        
        //配置规则类型
        String ruleType=request.getParameter("ruleType");
        model.addAttribute("ruleType", ruleType);
        
		model.addAttribute("pId", pId);
		model.addAttribute("pType", pType); 
		
		EntityProperty entityProperty=ReflectUtil.getEntityProperty(this.entityClass,
				request.getParameter("fieldFilter"),request.getParameter("isNeeded"));

		model.addAttribute("entity", entityProperty);
		
		
        String sPageSize=request.getParameter("pageSize");
        if(sPageSize!=null &&sPageSize.matches("[0-9]+")){
        	pageSize=Integer.valueOf(sPageSize);
        }
        String sPageNum=request.getParameter("pageNum");
        if(sPageNum!=null &&sPageNum.matches("[0-9]+")){
        	pageNum=Integer.valueOf(sPageNum);
        }
        String sort=request.getParameter("sort");
        LinkedHashMap<String,String> hmSort=new LinkedHashMap<String,String>();
        if(sort!=null){
	        String[] sorts=sort.split(",");        
	
	        for(int i=0;i<sorts.length;i++){
	        	String[] order=sorts[i].split(" ");
	        	hmSort.put(order[0], order[1]);
	        }
        }
		
		SimplePage<T> qr = (SimplePage<T>)genericService.executeMethod(this.entityName, "findByPage", 
				new Class[] {HashMap.class,LinkedHashMap.class,Integer.class,Integer.class}, 
				new Object[] {ReflectUtil.formatQueryParam(request,obj.getClass()),hmSort,pageSize,pageNum});
		
		model.addAttribute("page", qr);
		
		return "common/list";
	}
	
}
