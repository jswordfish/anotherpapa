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
import com.infrasofttech.domain.entities.LookupCode;
import com.infrasofttech.omning.ILookupCodeDAO;
@Repository("lookupCodeDao")
public class LookupCodeDao extends JpaDAOImpl<Long, LookupCode> implements
ILookupCodeDAO {
@Autowired
EntityManagerFactory entityManagerFactory;

@PersistenceContext(unitName = "OMNI_NG")
private EntityManager entityManager;
private Session session;
private Transaction tx;
private static SessionFactory sessionFactory;
private static final ThreadLocal<Session> threadSession = new ThreadLocal<Session>();
private static final Logger logger = Logger.getLogger(LookupCodeDao.class);

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
	
	

	public Transaction getTx() {
		return tx;
	}

	public void setTx(Transaction tx) {
		this.tx = tx;
	}

	public static ThreadLocal<Session> getThreadsession() {
		return threadSession;
	}

	public Session getSession() {
		return session;
	}

	public void setSession(Session session) {
		this.session = session;
	}

	public static Logger getLogger() {
		return logger;
	}

	public LookupCodeDao() {
		super();
	}

	

	public List<LookupCode> getLookupCodeList() {
		List<LookupCode> lookUpCodes = new ArrayList<LookupCode>();
		String queryString = " from LookupCode where lookupTypeCode='USER'";

		session = null;//getSessionFactory().openSession();
		threadSession.set(session);
		try {
			System.out.println("in try of lookupCode : session " + session);
			Query queryObject = session.createQuery(queryString);
			System.out
					.println("LookupCodeDao.getLookupCodeList()--->queryObject.list().size() :"
							+ queryObject.list().size());
			if (queryObject.list().size() != 0) {
				lookUpCodes = (ArrayList<LookupCode>) queryObject.list();
			} else {
				// TODO Throw exception related to no record found and exit
				lookUpCodes = null;
			}
		} catch (Exception e) {
			logger.error("Exception in fetching LookupCode list...\n"
					+ e.getMessage());
			System.out.println("Exception in fetching LookupCode list...\n"
					+ e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if (session.isOpen()) {
					session.close();
				}
			} catch (Exception e) {
				logger.error("Exception in fetching LookupCode list - Session Closing...\n"
						+ e.getMessage());
				System.out
						.println("Exception in fetching LookupCode list - Session Closing...\n"
								+ e.getMessage());
			}
		}

		return lookUpCodes;
	}

	public LookupCode getLookupCodeListOnId(Long id) throws Exception {
		System.out.println("LookupCodeDao.getCodeTypeOnLookUpCode()");
		LookupCode lookupCode = new LookupCode();
		try {

			ThreadLocal<Session> threadSession = new ThreadLocal<Session>();
			LookupCodeDao absDao = new LookupCodeDao();

			Session session = null;//getSessionFactory().openSession();

			threadSession.set(session);

			String queryString = "from LookupCode where id=?";

			System.out.println("Inside TryBlock");
			// Query queryObject = session.createSQLQuery(queryString);
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, id);

			if (queryObject != null) {
				lookupCode = (LookupCode) queryObject.uniqueResult();
				System.out.println("value of session: " + session.isOpen());
				session.close();
			} else {
				// TODO Throw exception related to no record found and exit

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				/*
				 * if (session != null || session.isOpen()) session.close();
				 */
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
				logger.error("Exception in fetching UserMst list - Session Closing...\n"
						+ e.getMessage());
				System.out
						.println("Exception in fetching UserMst list - Session Closing...\n"
								+ e.getMessage());
			}
		}
		return lookupCode;
	}

}
