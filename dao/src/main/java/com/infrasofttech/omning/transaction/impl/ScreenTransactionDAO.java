package com.infrasofttech.omning.transaction.impl;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infrasofttech.dao.basic.JpaDAOImpl;
import com.infrasofttech.domain.entities.transaction.runtime.ScreenTransaction;
import com.infrasofttech.omning.transaction.IScreenTransactionDAO;
@Repository("screenTransactionDAO")
public class ScreenTransactionDAO extends JpaDAOImpl<Long, ScreenTransaction>
implements IScreenTransactionDAO {
private static final Logger logger = Logger.getLogger(ScreenDAO.class);	
	
@Autowired
EntityManagerFactory entityManagerFactory;

@PersistenceContext(unitName = "OMNI_NG")
private EntityManager entityManager;

	public void setEntityManager(EntityManager em) {
	this.entityManager = em;
	super.setEntityManager(entityManager);
	}

	@PostConstruct
	public void init() {
	super.setEntityManagerFactory(entityManagerFactory);
	super.setEntityManager(entityManager);
	}
	
	public EntityManagerFactory getEntityManagerFactory() {
	return entityManagerFactory;
	}
	
	public void setEntityManagerFactory(
		EntityManagerFactory entityManagerFactory) {
	this.entityManagerFactory = entityManagerFactory;
	}
	
	public EntityManager getEntityManager() {
	return entityManager;
	}



}