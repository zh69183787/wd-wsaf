/** 
* @Title: ObjInfoService.java 
* @Package com.wonders.frame.core.service 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.core.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.data.repository.query.Param;

import com.wonders.frame.core.model.bo.ObjInfo;
import com.wonders.frame.core.model.bo.Relation;

/** 
 * @ClassName: ObjInfoService 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 */
public interface ObjInfoService {
	public ObjInfo findByType(String type);
	public HashMap<String, String> getParamByType(String type);
	public Class<?> getEntityClassByType(String type);
	public Object getEntityObjectByType(String type);
	public HashMap<String, String> getFieldNameMappingByType(String type);	
	public List<ObjInfo> findByIdIn(Integer[] ids);
}
