package com.wonders.frame.core.dao;

import static org.junit.Assert.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;

import com.wonders.frame.core.dao.ObjInfoDao;
import com.wonders.frame.core.model.bo.ObjInfo;
import com.wonders.frame.core.utils.JacksonMapper;


import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.junit.Test;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;

@ContextConfiguration({"classpath:spring-jpa.xml", "classpath:spring-beans.xml"})
public class TestObjInfoDao extends AbstractTransactionalJUnit4SpringContextTests {
	@Resource
	public ObjInfoDao dao;
	@Test
	//@Rollback(false)
	public void addRecords() {
		dao.deleteAll();	
		List<ObjInfo> list=new ArrayList<ObjInfo>();
		list.add(new ObjInfo("用户信息","User","{'entity':'com.wonders.frame.model.vo.User'}"));
		list.add(new ObjInfo("角色信息","Role","{'entity':'com.wonders.frame.model.vo.Role'}"));
		list.add(new ObjInfo("组信息","Group","{'entity':'com.wonders.frame.model.vo.Group'}"));
		list.add(new ObjInfo("组织机构信息","Organ","{'entity':'com.wonders.frame.model.vo.Organ'}"));
		list.add(new ObjInfo("权限信息","Privilege","{'entity':'com.wonders.frame.model.vo.Privilege'}"));
		list.add(new ObjInfo("资源信息","Resource","{'entity':'com.wonders.frame.model.vo.Resource'}"));
		for(int i=0;i<list.size();i++){
			ObjInfo obj=dao.save(list.get(i));
			System.out.println("ID:"+obj.getId()+",params:"+obj.getParams());
		}
		
		ObjInfo obj2 =dao.findByType("User");
			String jsonStr="";
			try {
				jsonStr=JacksonMapper.getInstance().writeValueAsString(obj2);
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(jsonStr);
		
	}
	
}
