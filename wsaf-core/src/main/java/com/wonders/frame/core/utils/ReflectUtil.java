/** 
* @Title: ReflectUtil.java 
* @Package com.wonders.frame.core.utils 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.core.utils;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import com.wonders.frame.core.model.bo.Ccate;
import com.wonders.frame.core.model.bo.Codes;
import com.wonders.frame.core.model.vo.EntityProperty;
import com.wonders.frame.core.model.vo.FieldProperty;
import com.wonders.frame.core.service.CcateService;
import com.wonders.frame.core.tags.ShowInView;
import com.wonders.frame.core.tags.ShowInView.OperateType;


/** 
 * @ClassName: ReflectUtil 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 */
public class ReflectUtil {
	private final static Logger logger=LoggerFactory.getLogger(ReflectUtil.class);
	
	public static Class<?> getFieldType(Class<?> clazz,String fieldName) {
		Class<?> fieldClass=null;
		try{
			Field field=clazz.getDeclaredField(fieldName);		
			fieldClass=field.getType();
		}catch(Exception e){
			logger.error("Exception Throwable", e);
			//e.printStackTrace();
			return null;
		} 
		
		return fieldClass;
	}
	public static Object setUpdateValue2Object(Class<?> clazz,Object oldObject,Object newObject,Set<String> updateParams) { 
		try{
			Field[] fields=clazz.getDeclaredFields();		
			 for (Field field : fields) {
				 if(field.getName().equalsIgnoreCase("serialVersionUID")||field.getName().equalsIgnoreCase("id")){
					 continue;
				 }
				 
				 if(updateParams.contains(field.getName())){
						Object fieldValue=invokeGet(newObject,field.getName());						
						invokeSet(oldObject,field.getName(), fieldValue);
						
				 }else{
					 continue;
					 
				 }

				
			}
		}catch(Exception e){
			e.printStackTrace();
			return oldObject;
		} 
		 return oldObject;
	}
	
	public static HashMap<String,Object> formatQueryParam(HttpServletRequest request, Class<?> clazz) { 
		Map<String,String> paramMap=request.getParameterMap();
		HashMap<String,String> hmParam=new HashMap<String,String>();
		HashMap<String,String> hmParamEnd=new HashMap<String,String>();
		List<String> rangeQueryFields=new ArrayList<String>();
		List<String> likeQueryFields=new ArrayList<String>();
		HashMap<String,String[]> inQueryCondition=new HashMap<String,String[]>();
		//把查询参数存入2个hashmap，hmParam存每个查询属性的起始条件，hmParamEnd存结束条件，同时把是范围查询的属性名存入队列rangeQueryFields
		for(String key:paramMap.keySet()){
			if(key.endsWith("_s")){//范围查询开始条件
				String objPropertyName=key.substring(0, key.length()-2);
				rangeQueryFields.add(key);
				hmParam.put(objPropertyName, request.getParameter(key));
			}else if(key.endsWith("_e")){//范围查询结束条件
				String objPropertyName=key.substring(0, key.length()-2);
				rangeQueryFields.add(key);
				hmParamEnd.put(objPropertyName, request.getParameter(key));
			}else if(key.endsWith("_in")){//in查询条件,按逗号划分为数组之后与查询属性建立映射关系
				String inCondition=request.getParameter(key);
				if(inCondition!=null && !inCondition.equals("")){
					inQueryCondition.put(key, inCondition.split(","));
				}
			
			}else if(key.endsWith("_sl")||key.endsWith("_el")||key.endsWith("_l")){//like查询条件
				String objPropertyName="";
				if(key.endsWith("_l")){
					objPropertyName=key.substring(0, key.length()-2);
				}else{
					objPropertyName=key.substring(0, key.length()-3);
				}
				likeQueryFields.add(key);
				hmParam.put(objPropertyName, request.getParameter(key));
			
			}else{
				hmParam.put(key, request.getParameter(key));
			}
			
		}
		//把存储起始和结束条件值的hashmap变为实体对象queryObj和queryObjEnd
		Object queryObj=JacksonMapper.convert(hmParam, clazz);
		Object queryObjEnd=JacksonMapper.convert(hmParamEnd, clazz);
		
		/*遍历当前实体对象，根据rangeQueryFields判断属性是否需要进行范围查询，
		 *将查询值从queryObj和queryObjEnd里面取出来放到一个存储查询条件的hashmap，
		 *达到完成对查询条件进行类型转换的目的
		*/
		HashMap<String,Object> queryParam=new HashMap<String,Object>();
		try{
			Field[] fields=clazz.getDeclaredFields();		
			 for (Field field : fields) {
				 if(field.getName().equalsIgnoreCase("serialVersionUID")){
					 continue;
				 }

				Method getMethod = getGetMethod(clazz,field.getName());//获得get方法
				
				if(rangeQueryFields.contains(field.getName()+"_s")){
					Object o = getMethod.invoke(queryObj);
					if(o!=null && !o.toString().equals("")){
						queryParam.put(field.getName()+"_s", o);
						
					}
				}
				if(rangeQueryFields.contains(field.getName()+"_e")){
					Object o = getMethod.invoke(queryObjEnd);
					if(o!=null && !o.toString().equals("")){
						queryParam.put(field.getName()+"_e", o);
						
					}
				}
				
				if(inQueryCondition.containsKey(field.getName()+"_in")){
					String[] inConditions=inQueryCondition.get(field.getName()+"_in");
					if(field.getType().equals(Integer.class)){
						List<Integer> conditionObj=new ArrayList<Integer>();
						for(String inCondition:inConditions){
							conditionObj.add(Integer.valueOf(inCondition));
						}
						
						queryParam.put(field.getName()+"_in", conditionObj);
					}else{
						queryParam.put(field.getName()+"_in", Arrays.asList(inConditions));
					}
	
				}
				
				if(likeQueryFields.contains(field.getName()+"_l")){
					Object o = getMethod.invoke(queryObj);
					if(o!=null && !o.toString().equals("")){
						queryParam.put(field.getName()+"_l", o);
						
					}
				}else if(likeQueryFields.contains(field.getName()+"_el")){
					Object o = getMethod.invoke(queryObj);
					if(o!=null && !o.toString().equals("")){
						queryParam.put(field.getName()+"_el", o);
						
					}
				}else if(likeQueryFields.contains(field.getName()+"_sl")){
					Object o = getMethod.invoke(queryObj);
					if(o!=null && !o.toString().equals("")){
						queryParam.put(field.getName()+"_sl", o);
						
					}
				}
				if(!rangeQueryFields.contains(field.getName()+"_e")
						&&!rangeQueryFields.contains(field.getName()+"_s")
						&&!inQueryCondition.containsKey(field.getName()+"_in")
						&&!likeQueryFields.contains(field.getName()+"_el")
						&&!likeQueryFields.contains(field.getName()+"_sl")
						&&!likeQueryFields.contains(field.getName()+"_l")){
					Object o = getMethod.invoke(queryObj);
					if(o!=null && !o.toString().equals("")){
						queryParam.put(field.getName(), o);
						
					}
				}
				
				
			}
			
		}catch(Exception e){
			logger.error("Exception Throwable", e);
			return queryParam;
		} 
		
		return queryParam;
	}

	
	/*获取对象属性（包括其字段属性列表）*/
	public static EntityProperty getEntityProperty(Class<?> clazz,String fieldFilter,String needed){
		String name=StringUtils.uncapitalize(clazz.getSimpleName());
		String cnName="";
		ShowInView clazzShow=clazz.getAnnotation(ShowInView.class);
		if(clazzShow!=null){
			cnName=clazzShow.name();
		}
		EntityProperty entityProperty=new EntityProperty(name,cnName);

		entityProperty.setFieldProperties(getFieldProperties(clazz,fieldFilter,needed));
		
		
		return entityProperty;
	}
	
	


	/*获取对象的字段属性列表*/
	public static List<FieldProperty> getFieldProperties(Class<?> clazz,String fieldFilter,String needed) { 
		CcateService ccateService=(CcateService)SpringBeanUtil.getBean("ccateService");
		List<String> filterFieldList=null;
		if(fieldFilter!=null){
			String[] filterFields=fieldFilter.split(",");
			filterFieldList=Arrays.asList(filterFields);
		}
		Boolean isNeeded=null;
		if(needed!=null){
			isNeeded=Boolean.valueOf(needed);
		}
		List<FieldProperty> fieldProperties=new ArrayList<FieldProperty>();	
		
		Field[] fields=clazz.getDeclaredFields();		
		for(int i=0;i<fields.length;i++){	

				if((fieldFilter!=null && filterFieldList!=null) && 
						(
								(isNeeded && !filterFieldList.contains(fields[i].getName()))||
								(!isNeeded && filterFieldList.contains(fields[i].getName())))
						){
					
					continue;
				}	
			
			
			boolean noUse =  false;
			OperateType operateType =  null;
			String ccateType="";
			String cnName= "";
			boolean allowOptionNull=false;
			 
			ShowInView meta = fields[i].getAnnotation(ShowInView.class); 
	
			if(meta!=null){  	
				noUse=meta.noUse();
				operateType =  meta.operateType();
				ccateType= meta.ccateType();
				cnName = meta.name();
				allowOptionNull=meta.allowOptionNull();
			}
			 
			if(noUse){
				continue;
			}
			 
			FieldProperty fieldProperty=new FieldProperty(fields[i].getName(),cnName);
			
			if(fields[i].getType().isEnum()){
				fieldProperty.setOperate(OperateType.SELECT.toString().toLowerCase());
				fieldProperty.setOption(getEnumStringAndDescriptionMap(fields[i].getType()));				 				 
			}else if(operateType==null){
				fieldProperty.setOperate(OperateType.INPUT.toString().toLowerCase());
			}else{
				fieldProperty.setOperate(operateType.toString().toLowerCase());
				if(!ccateType.equals("")){
					String[] ccateTypes=ccateType.split(",");
					for(String singleCcateType:ccateTypes){
							HashMap<String,LinkedHashMap<String,String>> multiOption=new HashMap<String,LinkedHashMap<String,String>>();
							
							Ccate ccate=ccateService.findByType(singleCcateType);		
							if (ccate!=null){
								List<Codes> codeses=ccate.getCodes();
								for(Codes codes:codeses){
									String pCode=codes.getPcode();
									if(pCode==null||pCode.equals("")){
										pCode="0";
									}
									String code=codes.getCode();
									String description=codes.getDisplay();
									if(description==null||description.equals("")){
										description=codes.getDescription();							
									}
									
									if(multiOption.containsKey(pCode)){
										LinkedHashMap<String,String> singleOption=multiOption.get(pCode);
										singleOption.put(code, description);
									}else{
										LinkedHashMap<String,String> singleOption=new LinkedHashMap<String,String>();
										if(allowOptionNull){
											singleOption.put("", "请选择");
										}								
										singleOption.put(code, description);
										multiOption.put(pCode, singleOption);
									}
								}
								if(multiOption.keySet()!=null){
									if(multiOption.keySet().size()>1){
										fieldProperty.setCodes(multiOption);
									}if(multiOption.keySet().size()==1){
										if(multiOption.containsKey("0")){
											fieldProperty.setOption(multiOption.get("0"));
										}else{
											fieldProperty.setCodes(multiOption);
										}
									}
									
								}
							}
							
						}
				}
			}
				 
			fieldProperties.add(fieldProperty);		 
			 
		 }
		 return fieldProperties;
	}

	
	
	public static LinkedHashMap<String, String> getEnumStringAndDescriptionMap(Class clazz) { 
        LinkedHashMap<String,String> map = new LinkedHashMap<String, String>(); 
        map.put("", "请选择");
        try {       
            Method getDescription = clazz.getMethod("description"); 
            //得到enum的所有实例 
            Object[] objs = clazz.getEnumConstants(); 
            for (Object obj : objs) { 
                map.put(obj.toString(),(String)getDescription.invoke(obj)); 
            } 
            
        } catch (NoSuchMethodException e) { 
        	logger.error("Exception Throwable", e);
        } catch (InvocationTargetException e) { 
        	logger.error("Exception Throwable", e); 
        } catch (IllegalAccessException e) { 
        	logger.error("Exception Throwable", e);
        } 
        return map;
    } 
	
	public static LinkedHashMap<String, String> getEnumCodeAndDescriptionMap(Class clazz) { 
        LinkedHashMap<String,String> map = new LinkedHashMap<String, String>(); 
        map.put("", "请选择");
        try { 
            Method getCode = clazz.getMethod("code");           
            Method getDescription = clazz.getMethod("description"); 
            //得到enum的所有实例 
            Object[] objs = clazz.getEnumConstants(); 
            for (Object obj : objs) { 
                map.put((String)getDescription.invoke(obj),(String)getDescription.invoke(obj)); 
            } 
            
        } catch (NoSuchMethodException e) { 
        	logger.error("Exception Throwable", e);
        } catch (InvocationTargetException e) { 
        	logger.error("Exception Throwable", e);
        } catch (IllegalAccessException e) { 
        	logger.error("Exception Throwable", e); 
        } 
        return map;
    } 
	
	/**   

	 * java反射bean的get方法   

	 *    

	 * @param objectClass   

	 * @param fieldName   

	 * @return   

	 */     

	@SuppressWarnings("unchecked")     
	public static Method getGetMethod(Class objectClass, String fieldName) {
		try{
			PropertyDescriptor pd = new PropertyDescriptor(fieldName,objectClass);
	
			Method getMethod = pd.getReadMethod();//获得get方法
			
			return getMethod;
		}catch(Exception e){
			logger.error("Exception Throwable", e); 
		}
//	    StringBuffer sb = new StringBuffer();     
//	    sb.append("get");     
//	    sb.append(fieldName.substring(0, 1).toUpperCase());     
//	    sb.append(fieldName.substring(1));     
//	    try {     
//	        return objectClass.getMethod(sb.toString());     
//	    } catch (Exception e) {     
//	    }   
	    
	    return null;     
	}     

	/**   
	 * java反射bean的set方法   
	 *    
	 * @param objectClass   
	 * @param fieldName   
	 * @return   
	 */     
	@SuppressWarnings("unchecked")     
	public static Method getSetMethod(Class objectClass, String fieldName) {     
	    try {     
	        Field field = objectClass.getDeclaredField(fieldName);     
   
	        StringBuffer sb = new StringBuffer();     
	        sb.append("set");     
	        sb.append(StringUtils.capitalize(fieldName));   
	        
	        Method setMethod = objectClass.getMethod(sb.toString(), new Class[]{field.getType()});     
	        return setMethod;     
	    } catch (Exception e) {     
	    	logger.error("Exception Throwable", e);     
	    }     
	    return null;     

	}     

	/**   
	 * 执行set方法   
	 *    
	 * @param o执行对象   
	 * @param fieldName属性   
	 * @param value值   
	 */     
	public static void invokeSet(Object o, String fieldName, Object value) {
	    Method method = getSetMethod(o.getClass(), fieldName);     
	    try {     
	        method.invoke(o, new Object[] { value });     

	    } catch (Exception e) {     
	    	logger.error("Exception Throwable", e);    
	    }     
	}

	/**   
	 * 执行get方法   
	 *    
	 * @param o执行对象   
	 * @param fieldName属性   
	 */     

	public static Object invokeGet(Object o, String fieldName) {     
	    Method method = getGetMethod(o.getClass(), fieldName);     
	    try {     
	        return method.invoke(o);     
	    } catch (Exception e) {     
	    	logger.error("Exception Throwable", e);     
	    }     

	    return null;     

	}

}
