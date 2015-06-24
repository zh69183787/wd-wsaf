package com.wonders.frame.ias.service;

import com.wonders.frame.core.model.vo.FieldProperty;
import com.wonders.frame.core.utils.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.*;

public class CaRestAPIService {
	private static Logger logger=LoggerFactory.getLogger(CaRestAPIService.class);
	private static HashMap<String,String> cookies=new HashMap<String,String>();
	private static String[] cookieNames={"ias_token","ias_deptId","ias_deptName","ias_userName","ias_loginName","ias_deptUsers"};
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
			Properties properties =SpringBeanUtil.getProperties("classpath:iasConfig.properties");
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
	public static HashMap<String,String> getCookies(HttpServletRequest request,HttpServletResponse response){		
		cookies=getCookieValue(request,Arrays.asList(cookieNames));			
		return cookies;
	}


	public static HashMap<String,String> getDeptUserFromCa(HttpServletRequest request,HttpServletResponse response){		
		cookies=getCookieValue(request,Arrays.asList(cookieNames));
		HashMap<String,String> deptUsers=new HashMap<String,String>();
		String deptId=request.getParameter("deptId");
		if(deptId!=null && !deptId.equals("")){
			String params="<id>"+deptId+"</id>";	
			String deptUserOptions= getDataFromCa(request,response,"getDeptUsers",params);	
			HashMap<String,Object> hm=JacksonMapper.readValue(deptUserOptions, HashMap.class);
			if(hm.containsKey("params")){				
				try{
					List<HashMap<String,String>> paramList=(List<HashMap<String,String>>)hm.get("params");			
					for(HashMap<String,String> hmParam:paramList){
						deptUsers.put(hmParam.get("loginName").toString().substring(0,12), hmParam.get("name").toString());
					}
				}catch(Exception e){
					HashMap<String,HashMap<String,String>> hmParams=(HashMap<String,HashMap<String,String>>)hm.get("params");
					HashMap<String,String> hmParam=hmParams.get("param");				
					deptUsers.put(hmParam.get("loginName").toString().substring(0,12), hmParam.get("name").toString());
				}
				
			}
		}
			
		return deptUsers;
	}
	public static HashMap<String,String> getDeptSingleLeaderFromCa(HttpServletRequest request,HttpServletResponse response){
		cookies=getCookieValue(request,Arrays.asList(cookieNames));		
		HashMap<String,String> deptSingleLeader=new HashMap<String,String>();
		String deptId=request.getParameter("deptId");
		if(deptId!=null && !deptId.equals("")){
			String params="<id>"+deptId+"</id>";	
			String deptSingleLeaderOptions= getDataFromCa(request,response,"getDeptSingleLeader",params);
			logger.debug("the return deptLeaderOptions from ca Api:"+deptSingleLeaderOptions);
			HashMap<String,Object> hm=JacksonMapper.readValue(deptSingleLeaderOptions, HashMap.class);
			if(hm.containsKey("params")){
				try{
					List<HashMap<String,String>> paramList=(List<HashMap<String,String>>)hm.get("params");
					for(HashMap<String,String> hmParam:paramList){
						deptSingleLeader.put(hmParam.get("pid").toString(),
                                hmParam.get("loginName").toString().substring(0,12)+","+hmParam.get("name").toString());
					}
				}catch(Exception e){
	
					HashMap<String,HashMap<String,String>> hmParams=(HashMap<String,HashMap<String,String>>)hm.get("params");
					HashMap<String,String> hmParam=hmParams.get("param");				
					deptSingleLeader.put(hmParam.get("pid").toString(),
                            hmParam.get("loginName").toString().substring(0,12)+","+hmParam.get("name").toString());
				}
	
			}
		}
		
		return deptSingleLeader;
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
						hmCookies.put(cookie.getName().replace("ias_", ""), java.net.URLDecoder.decode(cookie.getValue(),"utf-8"));
					} catch (UnsupportedEncodingException e) {
						logger.error("Exception Throwable", e);
					}
					
					
				}						
			}
		}
		
		return hmCookies;
	}


    /**
     * 获取指定部门最高领导
     * @param deptId
     * @return
     */
    public static Map<String,String> getDeptSingleLeader(String deptId){
        Map<String,String> deptSingleLeader=new HashMap<String,String>();
        if(deptId!=null && !deptId.equals("")){
            String params="<id>"+deptId+"</id>";
            String deptSingleLeaderOptions= getDataFromCa(null,null,"getDeptSingleLeader",params);
//			logger.debug("the return deptLeaderOptions from ca Api:"+deptSingleLeaderOptions);
            HashMap<String,Object> hm=JacksonMapper.readValue(deptSingleLeaderOptions, HashMap.class);
            if(hm.containsKey("params")){
                try{
                    List<HashMap<String,String>> paramList=(List<HashMap<String,String>>)hm.get("params");
                    for(HashMap<String,String> hmParam:paramList){
                        deptSingleLeader.put(hmParam.get("loginName").toString(), hmParam.get("name").toString());
                    }
                }catch(Exception e){

                    HashMap<String,HashMap<String,String>> hmParams=(HashMap<String,HashMap<String,String>>)hm.get("params");
                    HashMap<String,String> hmParam=hmParams.get("param");
                    deptSingleLeader.put(hmParam.get("loginName").toString(), hmParam.get("name").toString());
                }
            }
        }
        return deptSingleLeader;
    }


    /**
     * 获取指定部门用户信息
     * @param deptId
     * @return
     */
    public static Map<String,String> getDeptUsers(String deptId){
        Map<String,String> deptUsers=new HashMap<String,String>();
        if(deptId!=null && !deptId.equals("")){
            String params="<id>"+deptId+"</id>";
            String deptUserOptions= getDataFromCa(null,null,"getDeptUsers",params);
            HashMap<String,Object> hm=JacksonMapper.readValue(deptUserOptions, HashMap.class);
            if(hm.containsKey("params")){
                try{
                    List<HashMap<String,String>> paramList=(List<HashMap<String,String>>)hm.get("params");
                    for(HashMap<String,String> hmParam:paramList){
                        deptUsers.put(hmParam.get("loginName").toString(), hmParam.get("name").toString());
                    }
                }catch(Exception e){
                    HashMap<String,HashMap<String,String>> hmParams=(HashMap<String,HashMap<String,String>>)hm.get("params");
                    HashMap<String,String> hmParam=hmParams.get("param");
                    deptUsers.put(hmParam.get("loginName").toString(), hmParam.get("name").toString());
                }
            }
        }
        return deptUsers;
    }
}


