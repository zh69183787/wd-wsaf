/**
 * @Title: TestJacksonMapper.java
 * @Package com.wonders.frame.core.utils
 * @Description: TODO(用一句话描述该文件做什么)
 * @author lushuaifeng
 * @version V1.0
 */
package com.wonders.frame.core.utils;

import com.wonders.frame.core.model.vo.TestUser;
import org.junit.Test;
import org.springframework.security.core.userdetails.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @ClassName: TestJacksonMapper
 * @Description: TODO(这里用一句话描述这个类的作用)
 */
public class TestUtil {
    private static List<String> msgs = new ArrayList<String>();

    //@Test
    public void testConvert2Object() {
        HashMap<String, Object> hmParams = new HashMap<String, Object>();
//		hmParams.put("id", "11");
//		hmParams.put("name", "张三");
//		hmParams.put("telephone", "");
//		hmParams.put("mobile1", "");
        TestUser test = JacksonMapper.convert(hmParams, TestUser.class);
        //TestUser user=JacksonMapper.getInstance().convertValue(hmParams, TestUser.class);
        //User user=JacksonMapper.readValue("{\"id\":\"1\",\"name\":\"zhangsan\",\"telephone\":\"\"}",User.class);
        //String d=DateFormatUtil.timeFormat(DateFormatUtil.DATETIME_FORMAT, test.getInitiateTime());
        String json = JacksonMapper.toJson(test);

        System.out.println(json);
    }

    @Test
    public void ttt(){
        String src = "[{\"username\" : \"zs\"},{\"username\" : \"zs2\"}]";
        try {
            List<User> result = JacksonMapper.getInstance().readValue(src, JacksonMapper.getCollectionType(ArrayList.class, User.class));
        } catch (IOException e) {
            e.printStackTrace();
        }
        for(;;);
    }

    @Test

    public void testStringUtil() {
        createList(10);
        List<String> msg = new ArrayList<String>();
        msg.addAll(getList());
        int i = 0;
        for (String s : msg) {

            createList(++i);
            System.out.println(s);
            System.out.println("msgsize:" + getList().size());
        }
        msg.clear();
        System.out.println("size:" + msg.size());
//		System.out.println("123".matches("[0-9]+"));
//		System.out.println("".matches("[0-9]+"));
//		System.out.println("0".matches("[0-9]+"));
//		System.out.println("1".matches("[0-9]+"));
//		System.out.println("-1".matches("[0-9]+"));
//		System.out.println("de1".matches("[0-9]+"));
    }

    private void createList(int p) {
        for (int i = 0; i < p; i++) {
            msgs.add("message" + i);
        }
    }

    private List<String> getList() {
        return msgs;
    }
}
