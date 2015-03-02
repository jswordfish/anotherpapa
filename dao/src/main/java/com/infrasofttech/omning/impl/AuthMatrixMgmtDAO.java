package com.infrasofttech.omning.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infrasofttech.dao.basic.JpaDAOImpl;
import com.infrasofttech.domain.entities.AuthMatrix;
import com.infrasofttech.omning.IAuthMatrixMgmtDAO;

@Repository("authMatrixMgmtDAO")
public class AuthMatrixMgmtDAO extends JpaDAOImpl<Long, AuthMatrix> implements
		IAuthMatrixMgmtDAO {
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

	private static final Logger logger = Logger.getLogger(UserMstDAO.class);
	private Session session;
	private Transaction tx;
	private static SessionFactory sessionFactory;
	private AuthMatrix authMatrix = new AuthMatrix();
	ThreadLocal<Session> threadSession = new ThreadLocal<Session>();

	public List<AuthMatrix> authMatrixList(String tenantCode) {
		List<AuthMatrix> authMatrixList = new ArrayList<AuthMatrix>();
		session = null;
		threadSession.set(session);
		try {
			Criteria criteria = session.createCriteria(AuthMatrix.class,
					"authMatrix");
			criteria.add(Restrictions.eq("authMatrix.isActive", true)).add(
					Restrictions.eq("authMatrix.tenantCode", tenantCode));

			if (criteria.list().size() != 0) {
				authMatrixList = criteria.list();
				System.out
						.println("checking the data " + authMatrixList.size());

			} else {
				// TODO Throw exception related to no record found and exit
				logger.info("No Record Found");
				authMatrixList = null;

			}
		} catch (Exception e) {
			System.out.println("Inside catch....");
			e.printStackTrace();
		} finally {
			try {
				if (session != null)
					session.close();
			} catch (Exception e) {
				e.printStackTrace();
				logger.error("Exception in fetching authMatrix list - Session Closing...\n"
						+ e.getMessage());
				System.out
						.println("Exception in fetching authMatrix list - Session Closing...\n"
								+ e.getMessage());
			}
		}
		return authMatrixList;
	}

	public AuthMatrix getId() {
		session = sessionFactory.openSession();
		threadSession.set(session);
		AuthMatrix authMatrix = new AuthMatrix();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query query = session
					.createQuery(" from AuthMatrix order by id desc ");
			authMatrix = (AuthMatrix) query.list().get(0);
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return authMatrix;
	}
}
