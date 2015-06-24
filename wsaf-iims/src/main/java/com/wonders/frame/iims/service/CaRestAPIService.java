package com.wonders.frame.iims.service;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wonders.frame.core.utils.EncryptUtil;
import com.wonders.frame.core.utils.JacksonMapper;
import com.wonders.frame.core.utils.RestAPIUtil;
import com.wonders.frame.core.utils.SpringBeanUtil;
import com.wonders.frame.iims.model.vo.CurrentLogin;

public class CaRestAPIService {
	private static Logger logger=LoggerFactory.getLogger(CaRestAPIService.class);
	private static HashMap<String,String> cookies=new HashMap<String,String>();
	private static String[] cookieNames={"iims_token","iims_deptId","iims_deptName","iims_userName","iims_loginName"};
	private static void init() {
		
	}
	
	static {
		init();
	}		

	
	
	public static String getDataFromCa(HttpServletRequest request,HttpServletResponse response,String method,String paramsXml) {
		
		String apiUrl="";
		HashMap<String,String> hm=new HashMap<String,String>();
		hm.put("method", method);
		hm.put("dataType", "json");

		try {
			Properties properties =SpringBeanUtil.getProperties("classpath:iimsConfig.properties");
			String token=cookies.get("token");	
			String sign=EncryptUtil.getMD5(properties.getProperty("appName")+token+method+properties.getProperty("secret"));
			hm.put("appName", properties.getProperty("appName"));
			hm.put("sign", sign);
			hm.put("token", token);
			hm.put("dataParams", "<?xml version=\"1.0\" encoding=\"utf-8\"?><params>"+paramsXml+"</params>");
			apiUrl=properties.getProperty("urlCa")+properties.getProperty("serverPath")+"/"+properties.getProperty("apiName");

		}catch (Exception e) {
			logger.error("Exception Throwable", e);
		}

		return RestAPIUtil.getData(apiUrl, hm);
	
	}
	
	
	
	public static HashMap<String,String> getDeptsInfoFromCa(HttpServletRequest request,HttpServletResponse response){		
		cookies=getCookieValue(request,Arrays.asList(cookieNames));
		HashMap<String,String> depts=new HashMap<String,String>();
		String deptId=request.getParameter("deptId");
		String deptOptions="";
		if(deptId!=null && !deptId.equals("")){
			String params="<id>"+deptId+"</id>";	//
			deptOptions= getDataFromCa(request,response,"getNodesInfo",params);	
			HashMap<String,Object> hm3=JacksonMapper.readValue(deptOptions, HashMap.class);
			if(hm3.containsKey("params")){				
				try{
					List<HashMap<String,String>> paramList=(List<HashMap<String,String>>)hm3.get("params");			
					for(HashMap<String,String> hmParam:paramList){						
						depts.put(hmParam.get("id").toString(), hmParam.get("description").toString());//levels						
					}
				}catch(Exception e){
					HashMap<String,HashMap<String,String>> hmParams=(HashMap<String,HashMap<String,String>>)hm3.get("params");
					HashMap<String,String> hmParam=hmParams.get("param");						
					depts.put(hmParam.get("id").toString(), hmParam.get("description").toString());
					
				}
				
			}
		}
			
		return depts;
	}
	
	public static HashMap<String,String> getMatchedDeptsFromCa(HttpServletRequest request,HttpServletResponse response){		
		cookies=getCookieValue(request,Arrays.asList(cookieNames));
		HashMap<String,String> depts=new HashMap<String,String>();
		String deptName=request.getParameter("deptName");
		String deptOptions="";
		if(deptName!=null && !deptName.equals("")){
			String params="<deptName>"+deptName+"</deptName><typeId>0,1</typeId>";	//
			deptOptions= getDataFromCa(request,response,"getMatchedDepts",params);	
			HashMap<String,Object> hm3=JacksonMapper.readValue(deptOptions, HashMap.class);
			if(hm3.containsKey("params")){				
				try{
					List<HashMap<String,String>> paramList=(List<HashMap<String,String>>)hm3.get("params");			
					for(HashMap<String,String> hmParam:paramList){
						if(hmParam.get("levels").equals("1") && hmParam.get("pid").equals("2500") && !hmParam.get("id").equals("2740")){
							depts.put(hmParam.get("id").toString(), hmParam.get("description").toString());//levels
						}
					}
				}catch(Exception e){
					HashMap<String,HashMap<String,String>> hmParams=(HashMap<String,HashMap<String,String>>)hm3.get("params");
					HashMap<String,String> hmParam=hmParams.get("param");	
					if(hmParam.get("levels").equals("1") && hmParam.get("pid").equals("2500") && !hmParam.get("id").equals("2740")){
						depts.put(hmParam.get("id").toString(), hmParam.get("description").toString());
					}
				}
				
			}
		}
			
		return depts;
	}
	
	public static HashMap<String,String> getDeptUserFromCa(HttpServletRequest request,HttpServletResponse response){		
		cookies=getCookieValue(request,Arrays.asList(cookieNames));
		HashMap<String,String> deptUsers=new HashMap<String,String>();
		String deptId=request.getParameter("deptId");
		String deptUserOptions="";
		if(deptId!=null && !deptId.equals("")){
			String params="<id>"+deptId+"</id>";	
			deptUserOptions= getDataFromCa(request,response,"getDeptUsers",params);	
			HashMap<String,Object> hm3=JacksonMapper.readValue(deptUserOptions, HashMap.class);
			if(hm3.containsKey("params")){				
				try{
					List<HashMap<String,String>> paramList=(List<HashMap<String,String>>)hm3.get("params");			
					for(HashMap<String,String> hmParam:paramList){
						deptUsers.put(hmParam.get("loginName").toString(), hmParam.get("name").toString());
					}
				}catch(Exception e){
					HashMap<String,HashMap<String,String>> hmParams=(HashMap<String,HashMap<String,String>>)hm3.get("params");
					HashMap<String,String> hmParam=hmParams.get("param");				
					deptUsers.put(hmParam.get("loginName").toString(), hmParam.get("name").toString());
				}
				
			}
		}
			
		return deptUsers;
	}
	
	public static HashMap<String,String> getChildDeptsFromCa(HttpServletRequest request,HttpServletResponse response){		
		cookies=getCookieValue(request,Arrays.asList(cookieNames));
		HashMap<String,String> childDepts=new HashMap<String,String>();
		String deptId=request.getParameter("deptId");
		String childDeptsOptions="";
		if(deptId!=null && !deptId.equals("")){
			String params="<id>"+deptId+"</id>";	
			childDeptsOptions= getDataFromCa(request,response,"getChildNodes",params);	
			HashMap<String,Object> hm3=JacksonMapper.readValue(childDeptsOptions, HashMap.class);
			if(hm3.containsKey("params")){				
				try{
					List<HashMap<String,String>> paramList=(List<HashMap<String,String>>)hm3.get("params");			
					for(HashMap<String,String> hmParam:paramList){
						childDepts.put(hmParam.get("id").toString(), hmParam.get("description").toString());
					}
				}catch(Exception e){
					HashMap<String,HashMap<String,String>> hmParams=(HashMap<String,HashMap<String,String>>)hm3.get("params");
					HashMap<String,String> hmParam=hmParams.get("param");				
					childDepts.put(hmParam.get("id").toString(), hmParam.get("description").toString());
				}
				
			}
		}
			
		return childDepts;
	}
	
	/**
	 * 获取部门领导信息
	 * @param request
	 * @param response
	 * @return
	 */
	public static HashMap<String,String> getDeptLeadersFromCa(HttpServletRequest request,HttpServletResponse response){		
		cookies=getCookieValue(request,Arrays.asList(cookieNames));
		String deptId=request.getParameter("deptId");
		HashMap<String,String> deptLeaders=new HashMap<String,String>();
		
		String deptLeadersOptions="";
		if(deptId!=null && !deptId.equals("")){
			String params="<id>"+deptId+"</id>";	
			deptLeadersOptions= getDataFromCa(request,response,"getDeptLeaders",params);	
			logger.debug("the return deptLeaderOptions from ca Api:"+deptLeadersOptions);
			HashMap<String,Object> hm=JacksonMapper.readValue(deptLeadersOptions, HashMap.class);
			
			if(hm.containsKey("params")){	
				
				try{
					List<HashMap<String,String>> paramList=(List<HashMap<String,String>>)hm.get("params");
					for(HashMap<String,String> hmParam:paramList){
						deptLeaders.put(hmParam.get("loginName").toString(), hmParam.get("name").toString());
					}
				}catch(Exception e){

					HashMap<String,HashMap<String,String>> hmParams=(HashMap<String,HashMap<String,String>>)hm.get("params");
					HashMap<String,String> hmParam=hmParams.get("param");				
					deptLeaders.put(hmParam.get("loginName").toString(), hmParam.get("name").toString());				
				}
			}
			
		}
		return deptLeaders;
	}
	
	/**
	 *  当前登录人的登录信息及部门信息
	 * @param request
	 * @param response
	 * @return
	 */
	public static CurrentLogin getLoginInfoAndDeptFromCa(HttpServletRequest request,HttpServletResponse response){
		cookies=getCookieValue(request,Arrays.asList(cookieNames));
		
		CurrentLogin currentLogin=new CurrentLogin();
		currentLogin.setCookies(cookies);
		String params="<id>"+cookies.get("deptId")+"</id>";
		//get company id
				String deptOptions= getDataFromCa(request,response,"getRelatedNodes",params);
				logger.debug("the return deptOptions from ca Api:"+ deptOptions);
				HashMap<String,Object> hm1=JacksonMapper.readValue(deptOptions, HashMap.class);
				
				if(hm1.containsKey("params")){
					try{
						List<HashMap<String,String>> paramList=(List<HashMap<String,String>>)hm1.get("params");
						for(HashMap<String,String> hmParam:paramList){
							if(hmParam.get("pid")!=null &&hmParam.get("pid").toString().equals("2500")){
								currentLogin.setCompanyId(hmParam.get("id").toString());
								currentLogin.setCompanyName(hmParam.get("description").toString());
								break;
							}else{
								continue;
							}
						}
					}catch(Exception e){
						HashMap<String,HashMap<String,String>> hmParams=(HashMap<String,HashMap<String,String>>)hm1.get("params");
						HashMap<String,String> hmParam=hmParams.get("param");
						if(hmParam.get("pid")!=null &&hmParam.get("pid").toString().equals("2500")){
							currentLogin.setCompanyId(hmParam.get("id").toString());
							currentLogin.setCompanyName(hmParam.get("description").toString());
						}
					}
								
				}
		
		return currentLogin;
	}
	
	public static CurrentLogin getCurrentLoginInfoFromCa(HttpServletRequest request,HttpServletResponse response){
		cookies=getCookieValue(request,Arrays.asList(cookieNames));
		
		CurrentLogin currentLogin=new CurrentLogin();
		currentLogin.setCookies(cookies);
		String params="<id>"+cookies.get("deptId")+"</id>";

		//get dept leaders
		String deptLeaderOptions= getDataFromCa(request,response,"getDeptLeaders",params);
		logger.debug("the return deptLeaderOptions from ca Api:"+deptLeaderOptions);
		HashMap<String,Object> hm=JacksonMapper.readValue(deptLeaderOptions, HashMap.class);
		if(hm.containsKey("params")){
			HashMap<String,String> deptLeaders=new HashMap<String,String>();
			try{
				List<HashMap<String,String>> paramList=(List<HashMap<String,String>>)hm.get("params");
				for(HashMap<String,String> hmParam:paramList){
					deptLeaders.put(hmParam.get("loginName").toString(), hmParam.get("name").toString());
				}
			}catch(Exception e){

				HashMap<String,HashMap<String,String>> hmParams=(HashMap<String,HashMap<String,String>>)hm.get("params");
				HashMap<String,String> hmParam=hmParams.get("param");				
				deptLeaders.put(hmParam.get("loginName").toString(), hmParam.get("name").toString());				
			}
			currentLogin.setDeptLeaders(deptLeaders);
		}
		
		String deptUserOptions= getDataFromCa(request,response,"getDeptUsers",params);
		logger.debug("the return deptLeaderOptions from ca Api:"+deptLeaderOptions);
		HashMap<String,Object> hm3=JacksonMapper.readValue(deptUserOptions, HashMap.class);
		if(hm3.containsKey("params")){
			HashMap<String,String> deptUsers=new HashMap<String,String>();
			try{
				List<HashMap<String,String>> paramList=(List<HashMap<String,String>>)hm3.get("params");			
				for(HashMap<String,String> hmParam:paramList){
					deptUsers.put(hmParam.get("loginName").toString(), hmParam.get("name").toString());
				}
			}catch(Exception e){
				HashMap<String,HashMap<String,String>> hmParams=(HashMap<String,HashMap<String,String>>)hm3.get("params");
				HashMap<String,String> hmParam=hmParams.get("param");				
				deptUsers.put(hmParam.get("loginName").toString(), hmParam.get("name").toString());
			}
			currentLogin.setDeptUsers(deptUsers);
		}
		
		//get company id
		String deptOptions= getDataFromCa(request,response,"getRelatedNodes",params);
		logger.debug("the return deptOptions from ca Api:"+ deptOptions);
		HashMap<String,Object> hm1=JacksonMapper.readValue(deptOptions, HashMap.class);
		
		if(hm1.containsKey("params")){
			try{
				List<HashMap<String,String>> paramList=(List<HashMap<String,String>>)hm1.get("params");
				for(HashMap<String,String> hmParam:paramList){
					if(hmParam.get("pid")!=null &&hmParam.get("pid").toString().equals("2500")){
						currentLogin.setCompanyId(hmParam.get("id").toString());
						currentLogin.setCompanyName(hmParam.get("description").toString());
						break;
					}else{
						continue;
					}
				}
			}catch(Exception e){
				HashMap<String,HashMap<String,String>> hmParams=(HashMap<String,HashMap<String,String>>)hm1.get("params");
				HashMap<String,String> hmParam=hmParams.get("param");
				if(hmParam.get("pid")!=null &&hmParam.get("pid").toString().equals("2500")){
					currentLogin.setCompanyId(hmParam.get("id").toString());
					currentLogin.setCompanyName(hmParam.get("description").toString());
				}
			}
						
		}
		//get company leaders
		params="<id>"+currentLogin.getCompanyId()+"</id>";
		String leaderOptions= getDataFromCa(request,response,"getDeptLeaders",params);
		logger.debug("the return leaderOptions from ca Api:"+leaderOptions);
		HashMap<String,Object> hm2=JacksonMapper.readValue(leaderOptions, HashMap.class);
		if(hm2.containsKey("params")){
			HashMap<String,String> leaders=new HashMap<String,String>();
			try{
				List<HashMap<String,String>> paramList=(List<HashMap<String,String>>)hm2.get("params");			
				for(HashMap<String,String> hmParam:paramList){
					leaders.put(hmParam.get("loginName").toString(), hmParam.get("name").toString());
				}
			}catch(Exception e){
				HashMap<String,HashMap<String,String>> hmParams=(HashMap<String,HashMap<String,String>>)hm2.get("params");
				HashMap<String,String> hmParam=hmParams.get("param");				
				leaders.put(hmParam.get("loginName").toString(), hmParam.get("name").toString());
			}
			currentLogin.setLeaders(leaders);
		}
		return currentLogin;
	}
	
	
	public static List<Map<String,String>> getOrganTreeFromCa(HttpServletRequest request,HttpServletResponse response){		
		cookies=getCookieValue(request,Arrays.asList(cookieNames));
		List<Map<String,String>> treeNodes=new ArrayList<Map<String,String>>();
		String deptId=request.getParameter("deptId");
		String treeOptions="";
		if(deptId!=null && !deptId.equals("")){
			String params="<id>"+deptId+"</id>";	
			treeOptions= getDataFromCa(request,response,"getOrganTree",params);	
			HashMap<String,Object> hm3=JacksonMapper.readValue(treeOptions, HashMap.class);
			if(hm3.containsKey("params")){				
				try{
					List<HashMap<String,String>> paramList=(List<HashMap<String,String>>)hm3.get("params");			
					for(HashMap<String,String> hmParam:paramList){
						Map<String,String> treeNode = new HashMap<String,String>();
						treeNode.put("pkey",hmParam.get("pkey"));
						treeNode.put("key",hmParam.get("key"));
						treeNode.put("title",hmParam.get("title"));
						treeNodes.add(treeNode);
					}
				}catch(Exception e){
					HashMap<String,HashMap<String,String>> hmParams=(HashMap<String,HashMap<String,String>>)hm3.get("params");
					HashMap<String,String> hmParam=hmParams.get("param");				
					Map<String,String> treeNode = new HashMap<String,String>();
					treeNode.put("pkey",hmParam.get("pkey"));
					treeNode.put("key",hmParam.get("key"));
					treeNode.put("title",hmParam.get("title"));
					treeNodes.add(treeNode);
				}
				
			}
		}
			
		return treeNodes;
	}


	private static HashMap<String,String> getCookieValue(HttpServletRequest request,List<String> cookieName){
		Cookie[] cookies = request.getCookies();
		HashMap<String,String> hmCookies=new HashMap<String,String>();
		if(cookies !=null){
			int j=0;
			for(int i=0;i<cookies.length;i++){
				if(j>=cookieName.size()){
					break;
				}
				Cookie cookie = cookies[i];				
				if(cookieName.contains(cookie.getName())){
					j++;
					try{
						hmCookies.put(cookie.getName().replace("iims_", ""), java.net.URLDecoder.decode(cookie.getValue(),"utf-8"));
					} catch (UnsupportedEncodingException e) {
						logger.error("Exception Throwable", e);
					}
					
					
				}						
			}
		}
		
		return hmCookies;
	}
	
	
	public static String getJeecmsDataFromCa(HttpServletRequest request,HttpServletResponse response,String method,String paramsXml) {
		
		String apiUrl="";
		HashMap<String,String> hm=new HashMap<String,String>();
		hm.put("method", method);
		hm.put("dataType", "json");

		try {
			Properties properties =SpringBeanUtil.getProperties("classpath:iimsConfig.properties");
			
			String appName=properties.getProperty("jeecmsAppName");
			String secret=properties.getProperty("secret");
			String token= appName+secret;	
			String sign=EncryptUtil.getMD5(appName+token+method+secret);
			hm.put("appName", appName);
			hm.put("sign", sign);
			hm.put("token", token);
			hm.put("dataParams", "<?xml version=\"1.0\" encoding=\"utf-8\"?><params>"+paramsXml+"</params>");
			apiUrl=properties.getProperty("jeecmsCaUrl")+properties.getProperty("serverPath")+"/"+properties.getProperty("apiName");

		}catch (Exception e) {
			logger.error("Exception Throwable", e);
		}

		return RestAPIUtil.getData(apiUrl, hm);
	
	}
	public static String getJeecmsInfoFromCa(HttpServletRequest request,HttpServletResponse response){		
		String method= request.getParameter("method");
		String channelId = request.getParameter("channelId");
		String hasTitleImg = request.getParameter("hasTitleImg");
		String typeId = request.getParameter("typeId");
		String rownum = request.getParameter("rownum");
		
		String params="";
		if(channelId!=null){
			params+="<channelId>"+channelId+"</channelId>";
		}
		if(hasTitleImg!=null){
			params+="<hasTitleImg>"+hasTitleImg+"</hasTitleImg>";
		}
		if(typeId!=null){
			params+="<typeId>"+typeId+"</typeId>";
		}
		if(rownum!=null){
			params+="<rownum>"+rownum+"</rownum>";
		}

		//get dept leaders
		String s= getJeecmsDataFromCa(request,response,method,params);
		return s;
	}
}


