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
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wonders.frame.core.utils.JacksonMapper;
import com.wonders.frame.core.utils.RestAPIUtil;
import com.wonders.frame.iims.model.vo.CurrentLogin;

public class TodoItemAPIService {
	private static Logger logger=LoggerFactory.getLogger(TodoItemAPIService.class);
	private static HashMap<String,String> cookies=new HashMap<String,String>();
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
		
		Properties properties = new Properties();
		String configPath = Thread.currentThread().getContextClassLoader().getResource("iimsConfig.properties").getPath();
		
		try {
			String token=cookies.get("token");
			FileInputStream fis = new FileInputStream(configPath);
			properties.load(fis);		
			String sign=getMD5(properties.getProperty("appName")+token+method+properties.getProperty("secret"));
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
	
	public static CurrentLogin getCurrentLoginInfoFromCa(HttpServletRequest request,HttpServletResponse response){
		String[] cookieNames={"token","deptId","deptName","userName","loginName"};
		cookies=getCookieValue(request,Arrays.asList(cookieNames));
		CurrentLogin currentLogin=new CurrentLogin();
		currentLogin.setCookies(cookies);

		String params="<id>"+cookies.get("deptId")+"</id>";
		String deptOptions= getDataFromCa(request,response,"getRelatedNodes",params);
		logger.debug(deptOptions);
		HashMap<String,Object> hm=JacksonMapper.readValue(deptOptions, HashMap.class);
		
		if(hm.containsKey("params")){
			List<HashMap<String,String>> paramList=(List<HashMap<String,String>>)hm.get("params");
			for(HashMap<String,String> hmParam:paramList){
				if(hmParam.get("pid")!=null &&hmParam.get("pid").toString().equals("2500")){
					currentLogin.setCompanyId(hmParam.get("id").toString());
					currentLogin.setCompanyName(hmParam.get("description").toString());
					break;
				}else{
					continue;
				}
			}
		}
		params="<id>"+currentLogin.getCompanyId()+"</id>";
		String leaderOptions= getDataFromCa(request,response,"getDeptLeaders",params);
		logger.debug(leaderOptions);
		HashMap<String,Object> hm2=JacksonMapper.readValue(leaderOptions, HashMap.class);
		if(hm2.containsKey("params")){
			List<HashMap<String,String>> paramList=(List<HashMap<String,String>>)hm2.get("params");
			HashMap<String,String> leaders=new HashMap<String,String>();
			for(HashMap<String,String> hmParam:paramList){
				leaders.put(hmParam.get("loginName").toString(), hmParam.get("name").toString());
			}
			
			currentLogin.setLeaders(leaders);
		}
		return currentLogin;
	}
	
	
	
	private static String getMD5(String value) {  
        String result = null;  
        try{  
            byte[] valueByte = value.getBytes();  
            MessageDigest md = MessageDigest.getInstance("MD5");  
            md.update(valueByte);  
            result = toHex(md.digest());  
        }catch(NoSuchAlgorithmException e1){  
            e1.printStackTrace();  
        }  
        return result;  
    } 
    private static String toHex(byte[] buffer){  
        StringBuffer sb = new StringBuffer(buffer.length * 2);  
        for (int i = 0; i < buffer.length; i++){  
            sb.append(Character.forDigit((buffer[i] & 0xf0) >> 4, 16));  
            sb.append(Character.forDigit(buffer[i] & 0x0f, 16));  
        }  
        return sb.toString();  
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
						hmCookies.put(cookie.getName(), java.net.URLDecoder.decode(cookie.getValue(),"utf-8"));
					} catch (UnsupportedEncodingException e) {
						logger.error("Exception Throwable", e);
					}
					
					
				}						
			}
		}
		
		return hmCookies;
	}
	
}


