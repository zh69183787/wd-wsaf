package com.wonders.frame.core.dao;

import java.io.Serializable;

import javax.persistence.EntityManager;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.data.jpa.repository.support.JpaRepositoryFactory;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.data.querydsl.QueryDslUtils;
import org.springframework.data.repository.core.RepositoryMetadata;
import org.springframework.util.Assert;

import com.wonders.frame.core.dao.impl.GenericRepositoryImpl;

/**
 * @author mengjie
 *
 */
public class DefaultRepositoryFactory extends JpaRepositoryFactory {

	private final EntityManager entityManager;
    
	public DefaultRepositoryFactory(EntityManager entityManager) {
		super(entityManager);
		Assert.notNull(entityManager);
		this.entityManager = entityManager;
		
	}
	
	@Override
	protected <T, ID extends Serializable> JpaRepository<?, ?> getTargetRepository(RepositoryMetadata metadata, EntityManager entityManager) {

		//TODO
		JpaEntityInformation<?, Serializable> entityInformation = getEntityInformation(metadata.getDomainClass());
		return new GenericRepositoryImpl(entityInformation, entityManager); // custom implementation
	}
  
    @Override
    protected Class<?> getRepositoryBaseClass(RepositoryMetadata metadata) {
 
    	return GenericRepositoryImpl.class;
    }
}