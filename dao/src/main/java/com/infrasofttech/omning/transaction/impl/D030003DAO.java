package com.infrasofttech.omning.transaction.impl;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infrasofttech.dao.basic.JpaDAOImpl;
import com.infrasofttech.domain.entities.transaction.runtime.D030003;
import com.infrasofttech.omning.transaction.ID030003DAO;
@Repository("d030003DAO")
public class D030003DAO extends JpaDAOImpl<Long, D030003>
implements ID030003DAO {
private static final Logger logger = Logger.getLogger(D030003DAO.class);	
	
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