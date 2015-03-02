package com.infrasofttech.omning.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infrasofttech.dao.basic.JpaDAOImpl;
import com.infrasofttech.domain.entities.CurrencyMst;
import com.infrasofttech.omning.ICurrencyMstDAO;

@Repository("currencyMstDAO")
public class CurrencyMstDAO extends JpaDAOImpl<Long, CurrencyMst> implements
		ICurrencyMstDAO {
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

	private static final Logger logger = Logger.getLogger(CurrencyMstDAO.class);
	private Session session;
	private static SessionFactory sessionFactory;

	public List<CurrencyMst> showInitCurrencyList() {
		List<CurrencyMst> currency = null;
		ThreadLocal<Session> threadSession = new ThreadLocal<Session>();
		session = null;
		threadSession.set(session);
		try {
			String queryString = "from CurrencyMst where isActive=true";
			Query queryObject = session.createQuery(queryString);

			if (queryObject.list().size() != 0) {
				System.out.println("INSIDE ... checking the data...");
				currency = (ArrayList<CurrencyMst>) queryObject.list();
				System.out.println("currency size is:" + currency.size());

			} else {
				System.out
						.println("AbstractDao.showInitCurrencyList()---->else --->currency list is empty");
				return currency;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (session.isOpen()) {
					session.close();
					System.out.println("Session Closed Successfully......");
				}
			} catch (Exception e) {
				logger.error("Exception in fetching Currency list - Session Closing...\n"
						+ e.getMessage());
				System.out
						.println("Exception in fetching Currency list - Session Closing...\n"
								+ e.getMessage());
			}
		}
		return currency;
	}

	public List<CurrencyMst> listUserById(Long[] id) {
		List<CurrencyMst> currencyMsts = new ArrayList<CurrencyMst>();
		CurrencyMst currencyMst;
		System.out.println("Inside listUserById Service....");
		try {
			session = sessionFactory.getCurrentSession();
			Transaction tx = session.beginTransaction();
			for (int i = 0; i < id.length; i++) {
				currencyMst = (CurrencyMst) session.get(CurrencyMst.class,
						new Long(id[i]));
				currencyMsts.add(currencyMst);

			}
			tx.commit();
		} catch (Exception e) {
			logger.error("Exception in retrieving the currency List by Id... \n"
					+ e.getStackTrace());
		} finally {
			// TODO
			try {
				if (session.isOpen()) {
					session.close();
				}
			} catch (Exception e) {
			}
		}

		return currencyMsts;
	}
}
