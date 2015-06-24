/** 
* @Title: CurrentLogin.java 
* @Package com.wonders.frame.iims.model.vo 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.iims.model.vo;

import java.util.HashMap;

/** 
 * @ClassName: CurrentLogin 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 */
public class CurrentLogin {
	private HashMap<String,String> cookies;
	private String companyId;
	private String companyName;
	private HashMap<String,String> leaders;
	private HashMap<String,String> deptLeaders;
	private HashMap<String,String> deptUsers;	
	
	public HashMap<String, String> getDeptUsers() {
		return deptUsers;
	}
	public void setDeptUsers(HashMap<String, String> deptUsers) {
		this.deptUsers = deptUsers;
	}
	
	public HashMap<String, String> getDeptLeaders() {
		return deptLeaders;
	}
	public void setDeptLeaders(HashMap<String, String> deptLeaders) {
		this.deptLeaders = deptLeaders;
	}
	
	public HashMap<String, String> getLeaders() {
		return leaders;
	}
	public void setLeaders(HashMap<String, String> leaders) {
		this.leaders = leaders;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public HashMap<String, String> getCookies() {
		return cookies;
	}
	public void setCookies(HashMap<String, String> cookies) {
		this.cookies = cookies;
	}
}
