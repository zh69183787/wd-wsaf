/** 
* @Title: CustomObjectMapper.java 
* @Package com.wonders.frame.core.utils 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.core.utils;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.SerializerProvider;
import org.codehaus.jackson.map.ser.CustomSerializerFactory;
import org.springframework.stereotype.Component;

/** 
 * @ClassName: CustomObjectMapper 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 */
@Component("customObjectMapper") 
public class CustomObjectMapper extends ObjectMapper {  
  
    public CustomObjectMapper() {  
        CustomSerializerFactory factory = new CustomSerializerFactory();  
        factory.addGenericMapping(Date.class, new JsonSerializer<Date>() { 
        	@Override
            public void serialize(Date value, JsonGenerator jsonGenerator,  
                    SerializerProvider provider) throws IOException, JsonProcessingException { 
        		
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
                jsonGenerator.writeString(sdf.format(value).replaceAll("00:00:00", ""));  
            }
			
        });  
        this.setSerializerFactory(factory);  
    }  
} 
