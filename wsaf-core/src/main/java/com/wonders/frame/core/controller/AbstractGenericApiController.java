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
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.ui.Model;
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
import com.wonders.frame.core.model.vo.FieldProperty;
import com.wonders.frame.core.model.vo.SimplePage;
import com.wonders.frame.core.service.GenericService;
import com.wonders.frame.core.utils.ReflectUtil;
/** 
 * @ClassName: GenericController 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 */

public abstract class AbstractGenericApiController<T>{
	@Resource
	GenericService genericService;
	
	private Class<T> entityClass;
	
	private String entityName;

	public AbstractGenericApiController() {
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
	@RequestMapping(method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody 
	public HashMap<String,Object> findEntity(){
		 HashMap<String,Object> result=new HashMap<String,Object>();	
		 try{
			 T entity=this.entityClass.newInstance();
			 result.put("success", true);
			 result.put("result", entity);
		 } catch (InstantiationException e) {
			e.printStackTrace();
			result.put("success", false);
		 } catch (IllegalAccessException e) {
			e.printStackTrace();
			result.put("success", false);
		 }
		return result;
	}
	
//	获取对象名
	@RequestMapping(value="/getEntityName",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody 
	public HashMap<String,Object> getEntityName() {	
		HashMap<String,Object> result=new HashMap<String,Object>();
		result.put("success", true);
		result.put("result", this.entityName);
		return result;
	}
	
//	获取字段定义
	@RequestMapping(value="/findFieldProperties",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody 
	public HashMap<String,Object> findFieldProperties(HttpServletRequest request) {	
		HashMap<String,Object> result=new HashMap<String,Object>();
		try{
			List<FieldProperty> pageFields=ReflectUtil.getFieldProperties(this.entityClass,
					request.getParameter("fieldFilter"),request.getParameter("isNeeded"));
			
			result.put("success", true);
			result.put("result", pageFields);
		}catch(Exception e){
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	
//	获取实体定义（包含字段定义）
	@RequestMapping(value="/getEntityProperty",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody 
	public HashMap<String,Object> getEntityProperty(HttpServletRequest request) {	
		HashMap<String,Object> result=new HashMap<String,Object>();
		try{
			EntityProperty entityProperty=ReflectUtil.getEntityProperty(this.entityClass,
					request.getParameter("fieldFilter"),request.getParameter("isNeeded"));
			
			result.put("success", true);
			result.put("result", entityProperty);
		}catch(Exception e){
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	
//	保存
	@RequestMapping(value="/save",method=RequestMethod.POST)
	@ResponseBody 
	public HashMap<String,Object> saveObject(@Valid @ModelAttribute T obj,BindingResult bindingResult ) {
		HashMap<String,Object> result=new HashMap<String,Object>();
		try{
			if(bindingResult.hasErrors()){
				 for(FieldError error:bindingResult.getFieldErrors()){
					 System.out.println("===========error============code:"+error.getCode()+","+error.getDefaultMessage());
				 }
				 //此行不能删，否则前台不能显示验证错误
				 result.put("suceess", false);
				 result.put("result",bindingResult.getFieldErrors());
			}else{
				obj= (T)genericService.executeMethod(this.entityName,"save", new Class[] {Object.class}, new Object[] {obj});
		        result.put("success", true);
		        result.put("result", obj);
			}
		}catch(Exception e){
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	
	
	
	
//	逻辑删除接口
	@RequestMapping(value="/del/{id}",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public HashMap<String,Object> delObject(@PathVariable("id") Integer id,Model model) {
		HashMap<String,Object> result=new HashMap<String,Object>();
		try{
			
			Integer successNum= (Integer)genericService.executeMethod(this.entityName,
					"removeById", new Class[] {Integer.class}, new Object[] {id});
			if(successNum>0){
				result.put("success", true);			
			}else{
				result.put("success", false);
			}
		}catch(Exception e){
			e.printStackTrace();
			result.put("success", false);
		}
		
		return result;
	}
	
//	查询单个记录
	@RequestMapping(value="/get/{id}",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody 
	public HashMap<String,Object> findById(@PathVariable("id") Integer id ){
		HashMap<String,Object> result=new HashMap<String,Object>();
		try{
			
			T obj = (T)genericService.executeMethod(this.entityName,
					"findById", new Class[] {Integer.class}, new Object[] {id});
			result.put("success", true);
			result.put("result", obj);
		}catch(Exception e){
			e.printStackTrace();
			result.put("success", false);
		}
		
		return result;
	}
	
	@RequestMapping(value="/all",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody 
	public HashMap<String,Object> listAll(@ModelAttribute T obj,HttpServletRequest request) {
		HashMap<String,Object> result=new HashMap<String,Object>();
		try{
			String sort=request.getParameter("sort");
	        LinkedHashMap<String,String> hmSort=new LinkedHashMap<String,String>();
	        if(sort!=null){
		        String[] sorts=sort.split(",");        
		
		        for(int i=0;i<sorts.length;i++){
		        	String[] order=sorts[i].split(" ");
		        	hmSort.put(order[0], order[1]);
		        }
	        }
			List<T> resultData=(List<T>)genericService.executeMethod(this.entityName, "findAll", 
					new Class[] {HashMap.class,LinkedHashMap.class}, 
					new Object[] {ReflectUtil.formatQueryParam(request,obj.getClass()),hmSort});
			result.put("success", true);
			result.put("result", resultData);
		}catch(Exception e){
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	
//	按条件查询（分页，排序）
	@RequestMapping(value="/page",method={RequestMethod.POST,RequestMethod.GET}) 
	@ResponseBody 
	public HashMap<String,Object> list(@ModelAttribute T obj,HttpServletRequest request) {
		HashMap<String,Object> result=new HashMap<String,Object>();
		try{
			int pageNum=0,pageSize=0;
	
	        String sPageSize=request.getParameter("pageSize");
	        if(sPageSize!=null && sPageSize.matches("[0-9]+")){
	        	pageSize=Integer.valueOf(sPageSize);
	        }
	        String sPageNum=request.getParameter("pageNum");
	        if(sPageNum!=null && sPageNum.matches("[0-9]+")){
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

			result.put("success", true);
			result.put("result", qr);
		}catch(Exception e){
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}

	

	
}
