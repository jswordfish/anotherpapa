package com.infrasofttech.omning.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.MappingException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infrasofttech.dao.basic.JpaDAOImpl;
import com.infrasofttech.domain.entities.TxnCCDtls;
import com.infrasofttech.domain.entities.TxnCCMain;
import com.infrasofttech.domain.entities.TxnFldMetaData;
import com.infrasofttech.omning.ITxnCCDetailDAO;

@Repository("txnCCDetailDao")
public class TxnCCDetailDAO extends JpaDAOImpl<Long, TxnCCDtls> implements
     ITxnCCDetailDAO {
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

	private static final Logger logger = null;

	private Session session;
	private static final ThreadLocal<Session> threadSession = new ThreadLocal<Session>();

	public List<TxnCCDtls> getTxnDtls(TxnCCMain txnCCMain) {
		List<TxnCCDtls> ccDtls = new ArrayList<TxnCCDtls>();

		try {

			/** Get session **/
			/** Get session **/
			ThreadLocal<Session> threadSession = new ThreadLocal<Session>();
			//AbstractDao absDao = new TxnCCDetailDAO();
			session = null;//absDao.getSessionFactory().openSession();
			threadSession.set(session);

			Transaction tx = null;
			tx = session.beginTransaction();
			System.out.println("dao1");
			System.out.println("dao1");
			Criteria crit = session
					.createCriteria(TxnCCDtls.class, "txnCCDtls").createAlias(
							"txnCCMain", "txnCCMain");
			System.out.println("dao2");

			// Create alias for branches
			ccDtls = crit.add(Restrictions.eq("txnCCMain", txnCCMain)).list();

			tx.commit();

		} catch (MappingException e) {
			System.out.println("inside catch of gettenatid");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (null != session && session.isOpen()) {
					System.out.println("Trying to close open session...");
					session.close();
				}

			} catch (Exception e) {
				logger.error("Exception in session.close - Session Closing...\n"
						+ e.getMessage());
				System.out
						.println("Exception in session.close - Session Closing...\n"
								+ e.getMessage());
			}
		}
		return ccDtls;
	}

	public String getColValue(String colCode) {
		String colValue = null;
		TxnFldMetaData txnFldMetaData = new TxnFldMetaData();

		try {

			/** Get session **/
			/** Get session **/
			ThreadLocal<Session> threadSession = new ThreadLocal<Session>();
			//AbstractDao absDao = new TxnCCDetailDAO();
			session = null;//absDao.getSessionFactory().openSession();
			threadSession.set(session);

			Transaction tx = null;
			tx = session.beginTransaction();
			System.out.println("dao1");
			System.out.println("dao1");
			Criteria crit = session.createCriteria(TxnFldMetaData.class,
					"fldMetaData");
			System.out.println("dao2");

			// Create alias for branches
			crit.add(Restrictions.eq("fldMetaData.dataFldCode", colCode));
			txnFldMetaData = (TxnFldMetaData) crit.list().get(0);
			colValue = txnFldMetaData.getDataFldName();

			tx.commit();

		} catch (MappingException e) {
			System.out.println("inside catch of gettenatid");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (null != session && session.isOpen()) {
					System.out.println("Trying to close open session...");
					session.close();
				}

			} catch (Exception e) {
				logger.error("Exception in session.close - Session Closing...\n"
						+ e.getMessage());
				System.out
						.println("Exception in session.close - Session Closing...\n"
								+ e.getMessage());
			}
		}
		return colValue;
	}
}
