package com.wonders.frame.cpq.service;

import com.wonders.frame.core.model.vo.FieldProperty;
import com.wonders.frame.core.utils.*;
import com.wonders.frame.cpq.model.bo.CpqMain;
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
	private static String[] cookieNames={"cpq_token","cpq_deptId","cpq_deptName","cpq_userName","cpq_loginName","cpq_deptUsers"};
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
			Properties properties =SpringBeanUtil.getProperties("classpath:cpqConfig.properties");
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

    /**
     * 获取部门信息
     * @param request
     * @param response
     * @return
     */
    public static List<Map<String,String>> getDeptInfoFromCa(HttpServletRequest request,HttpServletResponse response){
        cookies=getCookieValue(request,Arrays.asList(cookieNames));
        List<Map<String,String>> deptInfo=new ArrayList<Map<String,String>>();
        String rootId=request.getParameter("rootId");
        //0 部门 1 单位
        String type= request.getParameter("type")==null ? "0":request.getParameter("type");
        List<FieldProperty> plist = null;
        if("0".equals(type)){
            plist = ReflectUtil.getFieldProperties(CpqMain.class,"beTestDept","true");
        }else{
            plist = ReflectUtil.getFieldProperties(CpqMain.class,"testDept","true");
        }
        Map<String,String> pmap = null;
        if(plist.size()>0){
            pmap = plist.get(0).getOption();
        }else{
            pmap = new LinkedHashMap<String, String>();
        }
        if(rootId!=null && !rootId.equals("")){
            String params="<id>"+rootId+"</id>";
            String deptInfoOptions= getDataFromCa(request,response,"getChildNodes",params);
            logger.debug("the return deptInfo from ca Api:"+deptInfoOptions);
            HashMap<String,Object> hm=JacksonMapper.readValue(deptInfoOptions, HashMap.class);
            if(hm.containsKey("params")){
                try{
                    List<Map<String,String>> list = (List<Map<String,String>>)hm.get("params");
                    for(Map<String,String> map : list){
                        Map<String,String> deptMap = new HashMap<String,String>();
                        if(pmap.containsKey(map.get("id"))) {
                            deptMap.put("id", map.get("id"));
                            deptMap.put("name", map.get("name"));
                            deptInfo.add(deptMap);
                        }
                    }
                }catch(Exception e){
                    e.printStackTrace();
                }

            }
        }

        return deptInfo;
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
						hmCookies.put(cookie.getName().replace("cpq_", ""), java.net.URLDecoder.decode(cookie.getValue(),"utf-8"));
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


