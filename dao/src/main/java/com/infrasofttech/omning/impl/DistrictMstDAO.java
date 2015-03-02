package com.infrasofttech.omning.impl;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infrasofttech.dao.basic.JpaDAOImpl;
import com.infrasofttech.domain.entities.DistrictMst;
import com.infrasofttech.omning.IDistrictMstDAO;

@Repository("districtMstDAO")
public class DistrictMstDAO extends JpaDAOImpl<Long, DistrictMst> implements
		IDistrictMstDAO {
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
	
	private static final Logger logger = Logger.getLogger(DistrictMstDAO.class);

	public void create(DistrictMst districtMst) throws Exception {
		//super.save(districtMst);
	}

	/*public List<DistrictMst> showInitDistrictList() {
		logger.info("Inside District mst dao list method");
		List<DistrictMst> district = new ArrayList<DistrictMst>();
		district = super.showInitDistrictList();
		return district;
	}
*/
	public List<DistrictMst> showInitDistrictList() {
		return null;
	}

}
