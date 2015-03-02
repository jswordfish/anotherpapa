package com.infrasofttech.omning.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infrasofttech.dao.basic.JpaDAOImpl;
import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.omning.IBranchMstDAO;

@Repository("branchMstDAO")
public class BranchMstDAO extends JpaDAOImpl<Long, BranchMst> implements
		IBranchMstDAO {
	
	@Autowired
	EntityManagerFactory entityManagerFactory;

	@PersistenceContext(unitName = "OMNI_NG")
	private EntityManager entityManager;

	public BranchMstDAO() {
//		super();
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
	
	
	
	
	
	
	
	//------------------------------------------
	
	private static final Logger logger = Logger.getLogger(BranchMstDAO.class);
	private static SessionFactory sessionFactory;
	private static final ThreadLocal<Session> threadSession = new ThreadLocal<Session>();
	
	
	

	public List<BranchMst> showInitBranchList(String tenantCode) {

		List<BranchMst> branches = new ArrayList<BranchMst>();
		
		return branches;
	}

	// @Override
	public void saveOrUpdateBranch(BranchMst branchMst) {
	}

	/** Used to list all the branches **/
	@SuppressWarnings("unchecked")
	// @Override
	public List<BranchMst> listBranches() {
		List<BranchMst> branches = null;
		return branches;
	}

	public String branchCodeVerify(String branchCode, String tenantCode) {
		String retVal = "";

		return retVal;

	}

	public List<BranchMst> getAllBranchList(String tenantCode) {
		
		List<BranchMst> branches = new ArrayList<BranchMst>();
		return branches;
	}
	
	public BranchMst showEditBranchList(Long id) {
		BranchMst branchMst = new BranchMst();
		return branchMst;
	}
}
