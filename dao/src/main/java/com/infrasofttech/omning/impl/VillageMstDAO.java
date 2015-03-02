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
import com.infrasofttech.domain.entities.VillageMst;
import com.infrasofttech.omning.IVillageMstDAO;

@Repository("villaegMstDAO")
public class VillageMstDAO extends JpaDAOImpl<Long, VillageMst> implements
		IVillageMstDAO {
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
	
	private static final Logger logger = Logger.getLogger(VillageMstDAO.class);

	public void create(VillageMst villageMst) throws Exception {
		//super.save(villageMst);
	}

	/*public List<VillageMst> showInitVillageList(){
		List<VillageMst>village=new ArrayList<VillageMst>();
		village=super.showInitVillageList();
		return village;
	}*/


	public List<VillageMst> showInitVillageList() {
		return null;
	}

}
