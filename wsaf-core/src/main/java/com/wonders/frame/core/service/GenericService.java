package com.wonders.frame.core.service;

import java.util.HashMap;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public interface GenericService  {
	public Object executeMethod(String crudObjName,String methodName,Class[] inputParamTypes,Object[] inputParams);
	

	
	 
}

