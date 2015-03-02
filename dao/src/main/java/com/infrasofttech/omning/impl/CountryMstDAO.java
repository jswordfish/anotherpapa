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
import com.infrasofttech.domain.entities.CountryMst;
import com.infrasofttech.omning.ICountryMstDAO;

@Repository("countryMstDAO")
public class CountryMstDAO extends JpaDAOImpl<Long, CountryMst> implements
		ICountryMstDAO {
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
	
	private static final Logger logger = Logger.getLogger(CountryMstDAO.class);

	public void create(CountryMst countryMst) throws Exception {
		//super.save(countryMst);
	}

	/*public List<CountryMst> showInitCountryList(){
		List<CountryMst>country=new ArrayList<CountryMst>();
		country=super.showInitCountryList();
		return country;
	}*/

	public List<CountryMst> showInitCountryList() {
		return null;
	}

}
