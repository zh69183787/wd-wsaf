package com.wonders.frame.core.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;

import com.wonders.frame.core.dao.RelationDao;
import com.wonders.frame.core.model.bo.Relation;


import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;

@ContextConfiguration({"classpath:spring-jpa.xml", "classpath:spring-beans.xml"})
public class TestRelationDao extends AbstractTransactionalJUnit4SpringContextTests {
	@Resource
	public RelationDao dao;
	@Test
	//@Rollback(false)
	public void addRecords() {
		dao.deleteAll();
		
		Relation relation =new Relation("U",1,"R",2,0);
		relation=dao.save(relation);
		Integer id=relation.getId();
		System.out.println("new Id:"+id);
		Relation r2=dao.findOne(id);
		List<Relation> relations =dao.findByPIdAndPType(1, "U");
		for(int i=0;i<relations.size();i++){
			
			System.out.println(relations.get(i).getPtype()+","+relations.get(i).getPid());
		}
	}
	
}
