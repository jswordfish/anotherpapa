package com.infrasofttech.omning.impl;

import java.util.ArrayList;
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
import com.infrasofttech.domain.entities.TenantMst;
import com.infrasofttech.omning.ITenantMstDAO;

@Repository("tenantMstDAO")
public class TenantMstDAO extends JpaDAOImpl<Long, TenantMst> implements
		ITenantMstDAO {
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
	
	private static final Logger logger = Logger.getLogger(TenantMstDAO.class);
	private Session session;
	private static final ThreadLocal<Session> threadSession = new ThreadLocal<Session>();
	
	public void create(TenantMst tenantMst) throws Exception {
		logger.info("Saving Tenant ...");
		//super.save(tenantMst);
	}	
	
	/*public List<TenantMst> showInitTenantList(){

		List<TenantMst> tenants = new ArrayList<TenantMst>();
		tenants = super.showInitTenantList();
		return tenants;
	}*/

	@SuppressWarnings("unchecked")
	public List<TenantMst> showInitTenantList() {
		List<TenantMst> tenants = new ArrayList<TenantMst>();
		

		return tenants;
	}
	
	public TenantMst find( String tenantCode ){
		TenantMst tenantMst = new TenantMst();
		
		return tenantMst;
	}

}
