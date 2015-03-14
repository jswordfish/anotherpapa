package com.infrasofttech.omning.impl;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infrasofttech.dao.basic.JpaDAOImpl;
import com.infrasofttech.domain.entities.VoucherMst;
import com.infrasofttech.omning.IVoucherMstDAO;
@Repository("voucherMstDAO")
public class VoucherMstDAO extends JpaDAOImpl<Long, VoucherMst> implements
IVoucherMstDAO {
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

	public VoucherMst getUniqueVoucherMstNormal(String tenantId, String branchCode,
			String entryDate, String batchCode, Long setNo, Long scrollNo) {
		// TODO Auto-generated method stub
		Query query = getEntityManager().createQuery("SELECT v FROM VoucherMst v WHERE v.tenantId=:tenantId AND v.branchCode=:branchCode AND v.entryDate=:entryDate AND v.batchCode=:batchCode AND v.setNo=:setNo AND v.scrollNo=:scrollNo", VoucherMst.class);
		
		query.setParameter("tenantId", tenantId);
		query.setParameter("branchCode", branchCode);
		query.setParameter("entryDate", entryDate);
		query.setParameter("batchCode", batchCode);
		query.setParameter("setNo", setNo);
		query.setParameter("scrollNo", scrollNo);
		VoucherMst v = (VoucherMst) query.getSingleResult();
		return v;
	}
}
