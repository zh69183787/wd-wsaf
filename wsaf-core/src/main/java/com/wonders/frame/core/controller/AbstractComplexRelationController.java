/** 
* @Title: GenericController.java 
* @Package com.wonders.frame.core.controller 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.core.controller;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wonders.frame.core.model.vo.EntityProperty;
import com.wonders.frame.core.model.vo.SimplePage;
import com.wonders.frame.core.service.GenericService;
import com.wonders.frame.core.service.ObjInfoService;
import com.wonders.frame.core.tags.ComplexRelation;
import com.wonders.frame.core.tags.OneToManyCustom;
import com.wonders.frame.core.tags.ShowInView;
import com.wonders.frame.core.tags.ShowInView.OperateType;
import com.wonders.frame.core.utils.ReflectUtil;

/** 
 * @ClassName: AbstractComplexRelationController 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 */
public abstract class AbstractComplexRelationController<T>{
	@Resource
	GenericService genericService;

	@Resource
	ObjInfoService objInfoService;
	private Class<T> entityClass;
	
	private String entityName;

	public AbstractComplexRelationController() {
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

	@RequestMapping(value = "/add", method = {RequestMethod.GET})
	public String add(T addRelationForm,ModelMap modelMap) {
		modelMap.addAttribute("addRelationForm", addRelationForm);
		return "common/complexRelationAdd";
	}
	
	@RequestMapping(value = "/add", method = { RequestMethod.POST })
	public String add(@ModelAttribute @Valid T addRelationForm,
			BindingResult bindingResult, ModelMap modelMap) throws Exception {

		if (bindingResult.hasErrors()) {
			modelMap.addAttribute("hasErrors", true);
			return "common/complexRelationAdd";
		}

		Class voClazz = addRelationForm.getClass();
		Field[] fields = voClazz.getDeclaredFields();
		String oneName = "";
		Integer id = null ;
		Class<?> classType = null;
		for (Field field : fields) {
			boolean noUse =  false;
			OperateType operateType =  null;
			boolean isOne = false;
			boolean isMany = false;
			
			ShowInView meta = field.getAnnotation(ShowInView.class);
			if(meta!=null){  	
				noUse=meta.noUse();
				operateType =  meta.operateType();
			}
			 
			if(noUse){
				continue;
			}
			OneToManyCustom oneToManyCustom = field.getAnnotation(OneToManyCustom.class);
			if(oneToManyCustom!=null){
				isOne = oneToManyCustom.isOne();
				isMany = oneToManyCustom.isMany();
			}
			
			if(isOne){
				String entityName = field.getType().getSimpleName();
				oneName = entityName;
				Object oneResult = ReflectUtil.invokeGet(addRelationForm, oneName);
				oneResult = genericService.executeMethod(StringUtils.uncapitalize(oneName), "save",
						new Class[] { Object.class },new Object[] { oneResult });
				//获取oneResult中getid方法
				id = (Integer) ReflectUtil.invokeGet(oneResult, "id");
			}
			if(isMany){
				
				String manyName = oneToManyCustom.name();
				Object manyClazz=objInfoService.getEntityClassByType(manyName);
				
				// 获取标注有多方的方法
				Map<String, ?> manyResultsMap = (Map<String, ?>) ReflectUtil.invokeGet(addRelationForm, field.getName());
				
				Set<String> keySet = manyResultsMap.keySet();
				for(Iterator iterator = keySet.iterator();iterator.hasNext();){
					String key = (String)iterator.next();
					Object value = manyResultsMap.get(key);
					ReflectUtil.invokeSet(value, StringUtils.uncapitalize(oneName)+"ID", id);
					Object setResult  = genericService.executeMethod(manyName,"save",
							new Class[] { Object.class },new Object[] {value});
				}
			}
		}
		return "redirect:/" + "complexRelation" + "/add";
	}
	
	
//	按条件查询（分页，排序）
	@ResponseBody
	@RequestMapping(value="/list",method={RequestMethod.POST,RequestMethod.GET}) 
	public HashMap<String, Object> list(@ModelAttribute T obj,Model model,HttpServletRequest request) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		HashMap<String,Object> complexParam=new HashMap<String,Object>();
		HashSet<String> queryEntitySet = new HashSet();
		List queryEntityList = new ArrayList();
		Class voClazz = obj.getClass();
		Field[] fields = voClazz.getDeclaredFields();
		Method[] methods = voClazz.getMethods();
		for (Method method : methods) {
			ComplexRelation complexRelation = method.getAnnotation(ComplexRelation.class);
			if(complexRelation!=null){
				String sign = complexRelation.sign();
				String conditions = complexRelation.condition();
				String showEntity = complexRelation.showEntity();
				if(sign.equals("=")){
					String[] conds = conditions.split(",");//获取关联符之前的多个对象
					String buildSql = "";
					for(String condition:conds){
						String[] condsParts = condition.split("&");//获取关联符之前的多个对象
						String[] beginObjs = condsParts[0].split("_");
						String[] endObjs = condsParts[1].split("_");
						buildSql += StringUtils.uncapitalize(beginObjs[0])+"."+beginObjs[1]+"="+StringUtils.uncapitalize(endObjs[0])+"."+endObjs[1]+" and ";
						queryEntitySet.add(beginObjs[0]);
						queryEntitySet.add(endObjs[0]);
					}
					String appendSql = buildSql.substring(0, buildSql.lastIndexOf("and"));
					complexParam.put("sign", sign);
					complexParam.put("showEntity", showEntity);
					complexParam.put("appendSql", appendSql);
				}else if(sign.equals("in")){
					complexParam.put("sign", sign);
					complexParam.put("showEntity", showEntity);
					complexParam.put("appendSql", conditions);
				}
			}
		}
		
		queryEntityList.addAll(queryEntitySet);
		complexParam.put("queryEntity", queryEntityList);
    	
		Class crudObjClazz = objInfoService.getEntityClassByType("userOld");
		int pageNum=0,pageSize=0;
		EntityProperty entityProperty=ReflectUtil.getEntityProperty(crudObjClazz,
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
     
		SimplePage<T> qr = (SimplePage<T>)genericService.executeMethod("userOld", "findComplexByPage", 
				new Class[] {HashMap.class,HashMap.class,LinkedHashMap.class,Integer.class,Integer.class}, 
				new Object[] {ReflectUtil.formatQueryParam(request,obj.getClass()),complexParam,hmSort,pageSize,pageNum});
		
		model.addAttribute("page", qr);
		
		if (qr == null) {
			result.put("success", false);
		} else {
			result.put("success", true);
			result.put("result", qr);
		}
		return result;
	}
	@RequestMapping(value = "/add1", method = { RequestMethod.POST })
	public String add1(@ModelAttribute @Valid T addRelationForm,
			BindingResult bindingResult, ModelMap modelMap) throws Exception {
		
		if (bindingResult.hasErrors()) {
			modelMap.addAttribute("hasErrors", true);
			return "common/complexRelationAdd";
		}
		
		Class VoClazz = addRelationForm.getClass();
		Field[] fields = VoClazz.getDeclaredFields();
		String one = "";
		Class<?> classType = null;
		for (Field field : fields) {
			ShowInView meta = field.getAnnotation(ShowInView.class);
			
			boolean noUse =  false;
			OperateType operateType =  null;
			
			if(meta!=null){  	
				noUse=meta.noUse();
				operateType =  meta.operateType();
			}
			
			if(noUse){
				continue;
			}
			
			if(operateType!=OperateType.HIDDEN){
				String entityName = field.getType().getSimpleName();
				if (!entityName.equals("Map")) {
					classType = field.getType();
					one = entityName;
				}
			}
		}
		Method[] methods = VoClazz.getMethods();
		boolean isOneMethod = false;
		boolean isManyMethod = false;
		for (Method method : methods) {
			
			// 判断该方法是否包含OneToManyCustom注解
			if (method.isAnnotationPresent(OneToManyCustom.class)) {
				// 获取需要处理的方法Method实例
				OneToManyCustom metaMethod = method
						.getAnnotation(OneToManyCustom.class);
				if (metaMethod != null) {
					isOneMethod = metaMethod.isOne();
					isManyMethod = metaMethod.isMany();
				}
				if (isManyMethod) {
					System.out.println(method);
					Method getOneMethod = VoClazz.getMethod("get" + one);
					Object oneResult = getOneMethod.invoke(addRelationForm);
					oneResult = genericService.executeMethod(StringUtils.uncapitalize(one), "save",
							new Class[] { Object.class },new Object[] { oneResult });
					
					
					//获取oneResult中getid方法
//					Method[] methodOneResults = oneResult.getClass().getMethods();
					Method methodOneResult = ReflectUtil.getGetMethod(oneResult.getClass(), "id");
					Integer id = (Integer) methodOneResult.invoke(oneResult);
					// 获取标注有多方的方法
					Method manyMethod = VoClazz.getMethod(method.getName());
//					List<Class<?>> manyResults = (List<Class<?>>) manyMethod.invoke(addForm);
					List<Class> manyResults = (List) manyMethod.invoke(addRelationForm);
					
					// 获取方法返回值
					Type returnType = method.getGenericReturnType();
					// 获取方法返回值中参数
					if (returnType instanceof ParameterizedType)/* 如果是泛型类型 */{
						Type[] typeArguments = ((ParameterizedType) returnType)
								.getActualTypeArguments();// 泛型类型列表
						for (Type typeArgument : typeArguments) {
							Class<?> typeArgClass = (Class<?>) typeArgument;
							
							// 给typeArgClass赋值,UserOld
							for(int i=0; i<manyResults.size();i++){
								Method geTypeArgClassSetMethod = typeArgClass.getMethod("set"+ classType.getSimpleName()+"ID",Integer.class);
//								Method geTypeArgClassSetMethod = ReflectUtil.getSetMethod(typeArgClass, classType.getSimpleName()+"ID");
								
								geTypeArgClassSetMethod.invoke(manyResults.get(i),id);
								Object setResult  = genericService.executeMethod(StringUtils.uncapitalize(typeArgClass.getSimpleName()),"save",
										new Class[] { Object.class },new Object[] { manyResults.get(i) });
							}
						}
					}
				}
			}
		}
		return "redirect:/" + entityName + "/list";
	}
}
