/** 
* @Title: BasicCOntroller.java 
* @Package com.wonders.frame.core.controller 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.console.controller;

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
		
		if(fieldName.equalsIgnoreCase("line") && !cellValue.equals("")){				
			
			String[] values=cellValue.split(",");
			for(String value:values){
				newValue.append(hmOption.get(value)).append("/");
			}
			
			cellValue=newValue.toString().substring(0,newValue.length()-1);
			
		}else if(fieldName.equalsIgnoreCase("resourceRequirement") && !cellValue.equals("")){

			HashMap<String,String> cellValueMap  = (HashMap<String,String>)JacksonMapper.readValue(cellValue, HashMap.class);
			
			Set<String> keySet = cellValueMap.keySet();
			
			for(Iterator iterator = keySet.iterator();iterator.hasNext();){
			
				String key = (String)iterator.next();
				String value = (String) cellValueMap.get(key);
				
				HashMap<String,String> subValueMap  = (HashMap<String,String>)JacksonMapper.readValue(value, HashMap.class);
				
				Set<String> subValuekeySet = subValueMap.keySet();
				for(Iterator subValueIterator = subValuekeySet.iterator();subValueIterator.hasNext();){
					String subKey = (String)subValueIterator.next();
					String subValue = (String) subValueMap.get(subKey);
					
					newValue.append(hmOption.get(key)).append(":").append(subKey).append("[").append(subValue).append("]").append("/");
				}
			}
			cellValue=newValue.toString().substring(0,newValue.length()-1);
		}else if(hmOption!=null && !cellValue.equals("")){
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
			return "year,projectName,mainContent,yearTarget,totalInvestEstimate,projectType,resourceRequirement,securityLevel,planStartDate,planEndDate,remarks";
		
	}

	@Override
	public String convertExcelImportData(String arg0, String arg1, String arg2,
			LinkedHashMap<String, String> arg3,
			HashMap<String, LinkedHashMap<String, String>> arg4) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
	
