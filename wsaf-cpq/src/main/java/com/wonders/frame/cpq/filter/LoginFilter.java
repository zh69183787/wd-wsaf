package com.wonders.frame.cpq.filter;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Map;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFilter implements Filter{
	protected final String P_IGNORE_URLS = "ignoreUrls";
	protected final String URL_SPLITER = ",";
	private String[] ignoreUrl = null;
	
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest) servletRequest;    
	    HttpServletResponse response = (HttpServletResponse) servletResponse;  

	    
	    String url = getCurrUrl(request);
	    if (ignoreUrl != null && ignoreUrl.length > 0) {
		    for (int i=0; i<ignoreUrl.length; i++) {
	
			    if (url.equals(ignoreUrl[i].trim())) {
				    chain.doFilter(servletRequest, servletResponse);
				    return ;
			    }
		    }
	    }
		//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/caClient.jsp";
	//System.out.println(basePath);

		String returnUrl=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getRequestURI();
		if(request.getQueryString()!=null){   
			returnUrl+="?"+request.getQueryString();

		}
	//System.out.println(returnUrl); 
		
	    String token=getCookieByName(request,"cpq_token");
	    if(token==null){
	    	response.sendRedirect(request.getContextPath()+"/caClient.jsp?returnUrl="+returnUrl);
	    	return;
	    }else{
	    	chain.doFilter(servletRequest, servletResponse);
	    	return;
	    }
	    
	}

	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub
		String ignoreUrls = config.getInitParameter(P_IGNORE_URLS);
		if (ignoreUrls != null) {
			ignoreUrl = ignoreUrls.split(URL_SPLITER); 
		}
	}
	
	
	private static String getCurrUrl(HttpServletRequest request) {
		String uri = request.getRequestURI();
		String ctxpath = request.getContextPath();
		if (! "".equals(ctxpath)) {
			return uri.substring(ctxpath.length());
		}else{
			return uri;
		}
	}
	
	private static String getCookieByName(HttpServletRequest request, String name) {
		String cookieValue=null;	
		Cookie[] cookies = request.getCookies();
        if (null != cookies) {
            for (int i = 0; i < cookies.length; i++) {
            	Cookie cookie = cookies[i];
        		if(name.equals(cookie.getName())){
        			try{
        				cookieValue = java.net.URLDecoder.decode(cookie.getValue(),"utf-8");
        			} catch (UnsupportedEncodingException e) {
        				// TODO Auto-generated catch block
        				e.printStackTrace();
        			}
        			break;
        		}
            }
        }
        
        return cookieValue;
	}
  
}
