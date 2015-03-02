package com.infrasofttech.omning.impl;

import java.util.Iterator;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infrasofttech.dao.basic.JpaDAOImpl;
import com.infrasofttech.domain.entities.AppConfig;
import com.infrasofttech.omning.IAppConfigDAO;


@Repository("appConfigDAO")
public class AppConfigDAO extends JpaDAOImpl<Long, AppConfig> implements
		IAppConfigDAO {
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
	private static final Logger logger = Logger.getLogger(AppConfigDAO.class);
	private Session session;
	private static final ThreadLocal<Session> threadSession = new ThreadLocal<Session>();

	public void create(List<AppConfig> appConfigz) throws Exception {
		try{
				Iterator<AppConfig> itrAppConfgiz = appConfigz.iterator();
				while(itrAppConfgiz.hasNext()) {
					logger.info("saving app config information...");
//					//super.save(itrAppConfgiz.next());
					logger.info("Abstract Dao save method called");
				}
		}
		catch(Exception e)
		{
			logger.error("Exception in Dao"+e.getMessage());
			e.printStackTrace();
		}
	}


	public List<AppConfig> getAllAppConfigList() {
		// TODO Auto-generated method stub
		return null;
	}
				
		
		
		
}
