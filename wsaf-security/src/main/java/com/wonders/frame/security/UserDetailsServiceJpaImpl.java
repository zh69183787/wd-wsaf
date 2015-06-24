package com.wonders.frame.security;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.orm.jpa.EntityManagerFactoryUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public class UserDetailsServiceJpaImpl implements
		UserDetailsService {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	private EntityManagerFactory entityManagerFactory;

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		final String ql = "from AfUser as u join fetch u.roles where u.username = :username";
		EntityManager em = EntityManagerFactoryUtils.getTransactionalEntityManager(entityManagerFactory);
		Query query = em.createQuery(ql).setParameter("username", username);

		UserDetails result = null;
		try {
			result = (UserDetails) query.getSingleResult();
		} catch (NoResultException e) {
			logger.debug("username {} not found.", username);
			throw new UsernameNotFoundException(e.getMessage(), e);
		}

		return result;
	}
	/*@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public UserDetails loadUserByUsername(String name)
			throws UsernameNotFoundException {
		// final String ql =
		// "from User as u join fetch u.roles where u.username = :username";
		final String ql = "SELECT DISTINCT u.id,role.id AS roleId,u.password,u.name,role.name "
				+ "FROM AfUser as u,AfRole as role, AfObjRelation as obj "
				+ "where u.id = obj.PId and obj.PType='U' and role.name='ROLE_ADMIN' and "
				+ "u.name=:name";
		EntityManager em = EntityManagerFactoryUtils
				.getTransactionalEntityManager(entityManagerFactory);
		Query query = em.createQuery(ql).setParameter("name", name);

		UserDetails result = null;
		try {
			result = (UserDetails) query.getSingleResult();
		} catch (NoResultException e) {
			logger.debug("username {} not found.", name);
			throw new UsernameNotFoundException(e.getMessage(), e);
		}

		return result;
	}*/

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	public void setEntityManagerFactory(
			EntityManagerFactory entityManagerFactory) {
		this.entityManagerFactory = entityManagerFactory;
	}

}
