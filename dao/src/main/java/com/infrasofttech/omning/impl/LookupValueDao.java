package com.infrasofttech.omning.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infrasofttech.dao.basic.JpaDAOImpl;
import com.infrasofttech.domain.entities.LookupValue;
import com.infrasofttech.omning.ILookupValueDAO;

@Repository("lookupValueDao")
public class LookupValueDao extends JpaDAOImpl<Long, LookupValue> implements
ILookupValueDAO {
@Autowired
EntityManagerFactory entityManagerFactory;

@PersistenceContext(unitName = "OMNI_NG")
private EntityManager entityManager;
private Session session;
private Transaction tx;
private static SessionFactory sessionFactory;
private static final ThreadLocal<Session> threadSession = new ThreadLocal<Session>();


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
	
	

	public LookupValueDao() {
		super();
	}

	

	public List<LookupValue> getLookupValueListOnId(Long id) throws Exception {
		System.out.println("LookupValueDao.getLookupValueListOnId()");
		List<LookupValue> lookupValues = new ArrayList<LookupValue>();
		try {

			ThreadLocal<Session> threadSession = new ThreadLocal<Session>();
			LookupCodeDao absDao = new LookupCodeDao();

			Session session = null;//getSessionFactory().openSession();

			threadSession.set(session);

			String queryString = "from LookupValue where fkLookupCodePk=?";

			System.out.println("Inside TryBlock");
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, id);

			if (queryObject != null) {
				lookupValues = (ArrayList<LookupValue>) queryObject.list();
				System.out.println("value of session: " + session.isOpen());
				session.close();
			} else {
				// TODO Throw exception related to no record found and exit

			}
		} catch (Exception e) {
//			logger.error("Exception in fetching LookupValue list...\n"
//					+ e.getMessage());
			System.out.println("Exception in fetching LookupValue list...\n"
					+ e.getMessage());
		} finally {
			try {
				/*
				 * if (session.isOpen() || session != null) { session.close(); }
				 */
			} catch (Exception e) {
//				logger.error("Exception in fetching LookupValue list - Session Closing...\n"
//						+ e.getMessage());
				System.out
						.println("Exception in fetching LookupValue list - Session Closing...\n"
								+ e.getMessage());
			}
		}
		return lookupValues;
	}

	public Session getSession() {
		return session;
	}

	public void setSession(Session session) {
		this.session = session;
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

}
