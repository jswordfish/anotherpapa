package com.infrasofttech.omning.impl;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infrasofttech.dao.basic.JpaDAOImpl;
import com.infrasofttech.domain.entities.MunicipalityMst;
import com.infrasofttech.omning.IMunicipalityMstDAO;


@Repository("municipalityMstDAO")
public class MunicipalityMstDAO extends JpaDAOImpl<Long, MunicipalityMst> implements
		IMunicipalityMstDAO {
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
	
	private static final Logger logger = Logger.getLogger(MunicipalityMst.class);

	public void create(MunicipalityMst municipalityMst) throws Exception {
		//super.save(municipalityMst);
	}

	/*public List<MunicipalityMst> showInitMuncipalList(){
		List<MunicipalityMst>muncipal=new ArrayList<MunicipalityMst>();
		muncipal=super.showInitMuncipalList();
		return muncipal;
	}
*/

	
	
}
