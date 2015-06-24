/** 
* @Title: BasicCOntroller.java 
* @Package com.wonders.frame.core.controller 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.ias.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wonders.frame.core.controller.AbstractSimpleCrudController;
import com.wonders.frame.core.utils.JacksonMapper;

/** 
 * @ClassName: BasicCrudController 
 * @Description: 提供基本的增删改查的controller 
 */
@Controller
@RequestMapping("/basicCrud")
public class BasicCrudController extends AbstractSimpleCrudController{
	
	@Override
	public String convertExcelExportData(String type,String fieldName,String cellValue,HashMap<String, LinkedHashMap<String, String>> hmFieldOption,HashMap<String, HashMap<String,LinkedHashMap<String,String>>> hmFieldCodes){
		LinkedHashMap<String,String> hmOption=hmFieldOption.get(fieldName);
		//取出hmCodes
		HashMap<String,LinkedHashMap<String,String>> hmCodes=hmFieldCodes.get(fieldName);
		
		StringBuffer newValue=new StringBuffer("");
		
		if(hmOption!=null && !cellValue.equals("")){
			cellValue = hmOption.get(cellValue);
		}else if(hmCodes!=null && !cellValue.equals("")){//二级选择菜单
			//HashMap<String,LinkedHashMap<String,String>> hmCodes=hmFieldCodes.get(fieldName);
			boolean flag=false;//标志位
			for(String string:hmCodes.keySet()){
				for(String str:hmCodes.get(string).keySet()){
					if(cellValue.equals(str)){
						cellValue=hmCodes.get(string).get(str);
						flag=true;
						break;
					}
				}
				if(flag){
					break;
				}
			}
		}
		return cellValue;
	}

	@Override
	public String getExcelExportField(String type) {
		return null;
	}

	public String convertExcelImportData(String type,String fieldName ,String fieldValue,LinkedHashMap<String,String> option,HashMap<String,LinkedHashMap<String,String>> code){
		fieldValue=fieldValue.trim();

		if(option!=null && option.size()>0){
			fieldValue=getOptionKey(fieldValue,option);
		}else if(code!=null && code.size()>0){
			fieldValue=getCodeKey(fieldValue,code);
		}
		
		return fieldValue;
	}
	
	/**
	 * 根据传入的值，获取对应option中的key
	 * @param fieldValue
	 * @param option
	 * @return
	 */
	public String getOptionKey(String fieldValue,LinkedHashMap<String,String> option){
		for (String key : option.keySet()) {
			if (fieldValue.equals(option.get(key))) {
				fieldValue = key;
				break;
			}
		}
		return fieldValue;
	}
	
	/**
	 * 根据传入的值，获取对应code中的key
	 * @param fieldValue
	 * @param code
	 * @return
	 */
	public String getCodeKey(String fieldValue,HashMap<String,LinkedHashMap<String,String>> code){
		for(String key:code.keySet()){
			LinkedHashMap<String,String> lhMap=code.get(key);
			for(String key1:lhMap.keySet()){
				if(fieldValue.equalsIgnoreCase(lhMap.get(key1))){
					fieldValue=key1;
					break;
				}
			}
		}
		return fieldValue;
	}
	

	
}
	
