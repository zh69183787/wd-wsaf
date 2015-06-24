/** 
* @Title: JacksonTool.java 
* @Package com.wonders.frame.utils 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.utils;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.SerializationConfig;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

/** 
 * @ClassName: JacksonTool 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 */
public class JacksonMapper {
	private static final ObjectMapper mapper = new ObjectMapper();
	
	private JacksonMapper() {  
  
    }  
	
	public static ObjectMapper getInstance(){
		//json转object时，json中有object中没有的属性时，不报错
		mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES,false);
		//当
		mapper.configure(SerializationConfig.Feature.FAIL_ON_EMPTY_BEANS, false);
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
	
	public static void main(String[] args){
		HashMap<String,Object> hmParams=new HashMap<String,Object>();
		hmParams.put("id", "11");
		hmParams.put("name", "张三");
		hmParams.put("telephone", "");
		hmParams.put("mobile1", "");
		hmParams.put("removed", "1");
		User user=JacksonMapper.getInstance().convertValue(hmParams, User.class);
		//User user=JacksonMapper.readValue("{\"id\":\"1\",\"name\":\"zhangsan\",\"telephone\":\"\"}",User.class);
		
		String json=JacksonMapper.toJson(user);
		
		System.out.println(json);
		
		
	}
}
