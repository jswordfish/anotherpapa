package com.infrasofttech.omning.services.impl;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.persistence.EntityManager;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.CountryMst;
import com.infrasofttech.domain.entities.StateMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.ICountryMstDAO;

@Service("countryMstService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class CountryMstServiceImpl extends OmniNGServiceImpl<Long, CountryMst>
		implements com.infrasofttech.omning.services.CountryMstService {
	@Autowired
	protected ICountryMstDAO countryMstDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) countryMstDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		countryMstDAO.setEntityManager(entityManager);
	}

	private static final Logger logger = Logger
			.getLogger(CountryMstServiceImpl.class);

	public static Logger getLogger() {
		return logger;
	}

	public List<CountryMst> showInitCountryList(String tenantId)
			throws OmniNGException {

		try{
			return super.findAllByTenant(tenantId);
		}catch(OmniNGException e){
			e.printStackTrace();
			throw new OmniNGException("cannot retrieve list of countries", e);
			
		}
	}
}
