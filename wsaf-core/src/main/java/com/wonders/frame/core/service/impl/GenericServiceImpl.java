package com.wonders.frame.core.service.impl;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.wonders.frame.core.dao.ObjInfoDao;
import com.wonders.frame.core.dao.RelationDao;
import com.wonders.frame.core.model.bo.ObjInfo;
import com.wonders.frame.core.model.bo.Relation;
import com.wonders.frame.core.service.GenericService;
import com.wonders.frame.core.utils.SpringBeanUtil;
import com.wonders.frame.core.utils.JacksonMapper;



@Component("genericService")
public class GenericServiceImpl implements GenericService {
	
	public Object executeMethod(String crudObjName,String methodName,Class[] inputParamTypes,Object[] inputParams){
		Object returnObj=null;
		Object dao=SpringBeanUtil.getBean(crudObjName+"Dao");
			
		try {
			Method method = dao.getClass().getMethod(methodName, inputParamTypes);

			returnObj=method.invoke(dao, inputParams);

		} catch (Exception e) {
			
			e.printStackTrace();
		} 
		return returnObj;
	}
		

}