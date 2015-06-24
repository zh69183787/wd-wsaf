/** 
* @Title: BasicCOntroller.java 
* @Package com.wonders.frame.core.controller 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.iims.controller;

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
				newValue.append(hmOption.get(key)).append(":");
				String reason = subValueMap.get("reason");
				if(subValueMap.containsKey("num")){
					newValue.append(subValueMap.get("num"));
					newValue.append("[").append(reason).append("]").append("/");
				}else{
					newValue.append(reason).append("/");
				}
			}
			cellValue=newValue.toString().substring(0,newValue.length()-1);
		}else if(fieldName.equalsIgnoreCase("equipmentNum") && !cellValue.equals("")){
			return cellValue;
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
		if(type!=null && !type.equals("")){
			if(type.equals("beforeMeeting")){
				return "businessType,businessLevel,projectNum,projectName,mainContent,implementContent,startTime,buildcycle,totalInvestEstimate,fundPlanAll,suggestImplementDept,suggestCostProperty,remarks,id";
			}else if(type.equals("afterMeeting")){
				return "businessType,projectNum,projectName,mainContent,yearTarget,securityLevel,planEndDate,totalInvestEstimate,suggestImplementDept,status,projectStatus";
			}else if(type.equals("equipment")){
				return "equipmentNum,equipmentName,modelNumber,assetCategory,importance,mainStatus,subStatus,equipmentManager,equipmentUser,barCode,assetLevel,assetNum,physicalLocation,ipAddress,macAddress,hostName,seriesNumber,purchaseTime,useDescriptionW,cpu,memory,hardDisk,warranty,dimension,remarks";
			}else if(type.equals("netResource")){
				return "userName,usePlace,applyType,applyBusinessType,applyUseTime,contactPhone,applyReason,applyDept,applyer,applyTime,handler,implementEngineer,implementTime,implementPlace,remarks";
			}else if(type.equals("accountResource")){
				return "userName,requirement,applyType,applyBusinessType,applyUseTime,contactPhone,applyReason,applyDept,applyer,applyTime,handler,implementEngineer,implementTime,accountName,remarks";
			}else if(type.equals("internetResource")){
				return "userName,usePlace,applyType,applyBusinessType,applyUseTime,contactPhone,applyReason,applyDept,applyer,applyTime,handler,implementEngineer,implementTime,implementPlace,remarks";
			}else if(type.equals("vpnResource")){
				return "userName,usePlace,applyType,applyBusinessType,applyUseTime,contactPhone,applyReason,applyDept,applyer,applyTime,handler,implementEngineer,implementTime,accountName,remarks";
			}else if(type.equals("wirelessResource")){
				return "userName,usePlace,applyType,applyBusinessType,applyUseTime,contactPhone,usePosition,userPost,macAddress,sysName,applyReason,applyDept,applyer,applyTime,handler,implementEngineer,implementTime,equipmentType";
			}else if(type.equals("appCount")){
				return"id,dept,deviceNum,authorizeOpsys,opsys,authorizeOa,oa,authorizeApp,app";
			}else if(type.equals("appVersion")){
				return "id,dept,deviceNum,appType,appLevel,appName,appVersion,authorize";
			}
		}else{
			return "year,projectName,mainContent,yearTarget,totalInvestEstimate,projectType,resourceRequirement,securityLevel,planStartDate,planEndDate,fundPlan1,fundPlan2,fundPlan3,fundPlan4,remarks";
		}
		return null;
	}

	public String convertExcelImportData(String type,String fieldName ,String fieldValue,LinkedHashMap<String,String> option,HashMap<String,LinkedHashMap<String,String>> code){
		fieldValue=fieldValue.trim();
		if(type.equals("appVersion_title_1")){
			if(option!=null && option.size()>0){//从option中取
				fieldValue=getOptionKey(fieldValue,option);
			}else if(code!=null && code.size()>0){//从code中取
				boolean flag=false;
				for(String key:code.keySet()){
					LinkedHashMap<String,String> lhMap=code.get(key);
					for(String key1:lhMap.keySet()){
						if(fieldValue.equalsIgnoreCase(lhMap.get(key1))){
							fieldValue=key1;
							flag=true;
							break;//跳出当前循环
						}
					}
					if(flag==true){
						break;//跳出最外层循环
					}
				}
				if(!flag){
					fieldValue="";
				}
			}
		}else{
			if(option!=null && option.size()>0){
				fieldValue=getOptionKey(fieldValue,option);
			}else if(code!=null && code.size()>0){
				fieldValue=getCodeKey(fieldValue,code);
			}
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
	
