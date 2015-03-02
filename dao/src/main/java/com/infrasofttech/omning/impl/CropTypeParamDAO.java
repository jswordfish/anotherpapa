package com.infrasofttech.omning.impl;



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
import com.infrasofttech.domain.entities.CropTypeParam;
import com.infrasofttech.omning.ICropTypeParamDAO;

@Repository("cropTypeParamDAO")
public class CropTypeParamDAO extends JpaDAOImpl<Long, CropTypeParam> implements
		ICropTypeParamDAO {
	
	@Autowired
	EntityManagerFactory entityManagerFactory;

	@PersistenceContext(unitName = "OMNI_NG")
	private EntityManager entityManager;

	public CropTypeParamDAO() {
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
	
	private static final Logger logger = Logger.getLogger(CropTypeParamDAO.class);
	private static SessionFactory sessionFactory;
	private static final ThreadLocal<Session> threadSession = new ThreadLocal<Session>();
	
	
	
/*
	public List<CropTypeParam> showInitCropTypeList(String tenantCode) {

		List<CropTypeParam> cropTypeParamList = new ArrayList<CropTypeParam>();
		
		return cropTypeParamList;
	}

	// @Override
	public void saveOrUpdateBranch(CropTypeParam cropTypeParam) {
	}

	*//** Used to list all the CropTypeParam **//*
	@SuppressWarnings("unchecked")
	// @Override
	public List<CropTypeParam> listCropTypeParam() {
		List<CropTypeParam> cropTypeParam = null;
		return cropTypeParam;
	}

	public String cropTypeCodeVerify(String cropTypeCode, String tenantCode, Date fromDate) {
		String retVal = "";

		return retVal;

	}

	public List<CropTypeParam> getAllCropTypeList(String tenantCode) {
		
		List<CropTypeParam> cropType = new ArrayList<CropTypeParam>();
		return cropType;
	}
	
	public CropTypeParam showEditCropTypeList(Long id) {
		CropTypeParam cropTypeParam = new CropTypeParam();
		return cropTypeParam;
	}*/
}
