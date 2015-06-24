package com.wonders.frame.login.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.login.dao.LoginAccessDao;
import com.wonders.frame.login.service.LoginAccessService;

@Service("loginAccessService")
@Transactional
public class LoginAccessServiceImpl implements LoginAccessService {

	@Resource
	private LoginAccessDao loginAccessDao;

	@Transactional(readOnly=true)
	public Set<String> findUserInfoByUsername(String username) {
		List<Object[]> objs=loginAccessDao.findUserInfoByUsername(username);
		Set<String> roles=new HashSet<String>();
		if(objs!=null && objs.size()>0){
			for(Object[] obj:objs){
				roles.add(obj[1].toString());
			}
		}
		return roles;
	}

	@Override
	public Map<String, Set<String>> loadPrivilegeAndResource() {
		///加载所有权限
		List<String> privileges=loginAccessDao.findAllPrililegeType();
		
		//应当是资源为key， 权限为value。 资源通常为url， 权限就是那些以ROLE_为前缀的角色。 一个资源可以由多个权限来访问
		Map<String,Set<String>> resourceMap =new HashMap<String,Set<String>>();

		for(String privilege:privileges){
			 List<String> urls =loginAccessDao.findUrlsByPrililege(privilege);
			 for(String url:urls){
				 //判断资源文件和权限的对应关系，如果已经存在相关的资源url，则要通过该url为key提取出权限集合，将权限增加到权限集合中。
				 if(resourceMap.containsKey(url)){//包含该url，则将权限添加到该url为key的map集合
					 Set<String> value= resourceMap.get(url);
					 value.add(privilege.trim());
					resourceMap.put(url, value);
				 }else{
					 Set<String> value=new HashSet<String>();
					 value.add(privilege.trim());
					 resourceMap.put(url, value);
				 }
			 }
		}	
		return resourceMap;
	}

}
