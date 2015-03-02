package com.infrasofttech.omning.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.infrasofttech.dao.basic.JpaDAOImpl;
import com.infrasofttech.domain.entities.TxnCCMain;
import com.infrasofttech.domain.entities.TxnFldMetaData;
import com.infrasofttech.omning.ITxnCCMainDAO;

@Repository("txnCCMainDAO")
public class TxnCCMainDAO extends JpaDAOImpl<Long, TxnCCMain> implements
		ITxnCCMainDAO {
	private static final Logger logger = Logger.getLogger(TxnCCMainDAO.class);

	@SessionTarget
	Session session;

	@TransactionTarget
	Transaction transaction;
	private static final ThreadLocal<Session> threadSession = new ThreadLocal<Session>();

	@Autowired
	EntityManagerFactory entityManagerFactory;

	@PersistenceContext(unitName = "OMNI_NG")
	private EntityManager entityManager;

	public TxnCCMainDAO() {
		// super();
	}

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

//	private static final ThreadLocal<Session> threadSession = new ThreadLocal<Session>();

	public List<TxnCCMain> getTxnCCMainList(String tenantCode) {

		List<TxnCCMain> txnCCMain = new ArrayList<TxnCCMain>();

		
		return txnCCMain;

	}

	public List<TxnFldMetaData> showInitTxnFldMetaDataList() {

		List<TxnFldMetaData> txnFldMetaData = new ArrayList<TxnFldMetaData>();

		
		return txnFldMetaData;
	}

	public void create(TxnCCMain txnCCMain) throws Exception {
		System.out.println("DAO Module Code ::: " + txnCCMain.getModuleCode());
		System.out.println("value of activities in dao::"
				+ txnCCMain.getActivities());
		System.out.println("value of branches in dao::"
				+ txnCCMain.getBranches());
		System.out.println("value of dtls(ser)::"
				+ txnCCMain.getDtls().toString());
		System.out.println("This is in DAO");
		//super.save(txnCCMain);
	}
}