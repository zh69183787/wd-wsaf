/** 
* @Title: JacksonTool.java 
* @Package com.wonders.frame.utils 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.core.utils;

import com.wonders.frame.core.model.bo.ObjInfo;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.SerializationConfig;
import org.codehaus.jackson.type.JavaType;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/** 
 * @ClassName: JacksonTool 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 */
public class JacksonMapper {
	private static final ObjectMapper mapper = new ObjectMapper();
	static{
		mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES,false);
		
		mapper.configure(SerializationConfig.Feature.FAIL_ON_EMPTY_BEANS, false);
	}
 
	
	public static ObjectMapper getInstance(){
		return mapper;
	}
	
	public static <T> T readValue(String content, Class<T> valueType) {
        try {
            return mapper.readValue(content, valueType);
        } catch (Exception e) {
            e.printStackTrace();
        }
 
        return null;
    }
	
	public static Object readValue(String content, JavaType javaType) {
        try {
            return mapper.readValue(content, javaType);
        } catch (Exception e) {
            e.printStackTrace();
        }
 
        return null;
    }
	
	public static JavaType getCollectionType(Class<?> collectionClass, Class<?>... elementClasses) {   
		return mapper.getTypeFactory().constructParametricType(collectionClass, elementClasses);   
     }
	
	public static String toJson(Object object) {
        try {
            return mapper.writeValueAsString(object);
        } catch (Exception e) {
            e.printStackTrace();
        }
 
        return null;
    }
	
	public static <T> T convert(Object fromValue,Class<T> toValueType) {
        try {
            return mapper.convertValue(fromValue, toValueType);
        } catch (Exception e) {
            e.printStackTrace();
        }
 
        return null;
    }
	
	public static Object convert(Object fromValue, JavaType javaType) {
        try {
            return mapper.convertValue(fromValue, javaType);
        } catch (Exception e) {
            e.printStackTrace();
        }
 
        return null;
    }

    public static void main(String[] args){
        String src = "[{\"type\" : \"zs\"},{\"name\" : \"zs2\"}]";
        List<ObjInfo> result = null;
        try {
            result = mapper.readValue(src, getCollectionType(ArrayList.class, ObjInfo.class));
        } catch (IOException e) {
            e.printStackTrace();
        }
        for(;;);
    }
}
