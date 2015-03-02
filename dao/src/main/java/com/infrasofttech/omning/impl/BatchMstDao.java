package com.infrasofttech.omning.impl;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infrasofttech.dao.basic.JpaDAOImpl;
import com.infrasofttech.domain.entities.BatchMst;
import com.infrasofttech.omning.IBatchMstDao;

@Repository("batchMstDAO")
public class BatchMstDao extends JpaDAOImpl<Long, BatchMst> implements IBatchMstDao {

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
	

//	public List<BatchMst> showInitBatchList() {
//		logger.info("inside showInitBatchList method");
//		List<BatchMst> batch = new ArrayList<BatchMst>();
//
//		return batch;
//	}
//
//	public List<BatchMst> initBatchListOnbranchCode(String branchCode,
//			String tenantCode) {
//		logger.info("inside BatchMstDao.initBatchListOnbranchCode()");
//		List<BatchMst> batches = new ArrayList<BatchMst>();
//		return batches;
//	}

}
