package com.wonders.frame.core.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.aspectj.weaver.patterns.ThisOrTargetAnnotationPointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wonders.frame.core.dao.ObjInfoDao;
import com.wonders.frame.core.dao.RelationDao;
import com.wonders.frame.core.model.bo.ObjInfo;
import com.wonders.frame.core.model.bo.Relation;
import com.wonders.frame.core.service.ObjInfoService;
import com.wonders.frame.core.service.RelationService;
import com.wonders.frame.core.utils.JacksonMapper;


@Service("objInfoService")
public class ObjInfoServiceImpl implements ObjInfoService {
	private final Logger logger=LoggerFactory.getLogger(this.getClass());
	@Resource
	private ObjInfoDao objInfoDao;
	
	
	@Transactional(readOnly = true)
	public ObjInfo findByType(String type) {
		ObjInfo entity = objInfoDao.findByType(type);
		return entity;
	}
	
	@Transactional(readOnly = true)
	public List<ObjInfo> findByIdIn(Integer[] ids){
		List<ObjInfo> objs = objInfoDao.findByIdIn(ids);
		return objs;
	}

	public HashMap<String, String> getParamByType(String type){
		HashMap<String, String> hm=null;
		try {
			ObjInfo objInfo = findByType(type);
			if(objInfo==null){
				return null;
			}

			hm = JacksonMapper.readValue(objInfo.getParams(),HashMap.class);
		}catch(Exception e){
			//e.printStackTrace();
			logger.error("Exception Throwable", e);
			return null;
		}
			return hm;
		
	}
	
	public Class<?> getEntityClassByType(String type){
		Class<?> clazz =null;
		try{
			String entityPath="";
			HashMap<String, String> hm=getParamByType(type);
	
			if(hm!=null){
				entityPath=hm.get("entity");
			}
			if(entityPath.equals("")){
				return null;
			}
			clazz=Class.forName(entityPath);
		}catch(Exception e){
			logger.error("Exception Throwable", e);
			return null;
		}
		return clazz;
	}
	
	public Object getEntityObjectByType(String type){
		Object obj=null;
		try{
			Class<?> clazz=getEntityClassByType(type);
			if(clazz==null){
				return null;
			}
			obj=clazz.newInstance();
		}catch(Exception e){
			logger.error("Exception Throwable", e);
			return null;
		}
		return obj;
	}
	public HashMap<String, String> getFieldNameMappingByType(String type){
		HashMap<String, String> hmFieldName=new HashMap<String,String>();
		try{
			HashMap<String, String> hmParam=getParamByType(type);
			String sFieldName=hmParam.get("field");
			hmFieldName = JacksonMapper.readValue(sFieldName,HashMap.class);
		}catch(Exception e){
			logger.error("Exception Throwable", e);
			return null;
		}
		return hmFieldName;
	}

}