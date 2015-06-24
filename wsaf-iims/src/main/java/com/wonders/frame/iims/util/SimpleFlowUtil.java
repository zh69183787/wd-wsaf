package com.wonders.frame.iims.util;

public class SimpleFlowUtil {

	public static String getDealUrl(String code){
		
		if(code.equals("ProjectPlanImposed:simple")){
			return "/projectplanimposed/dealFlowByObjId?id=";
		}
		
		return null;
	}
}
