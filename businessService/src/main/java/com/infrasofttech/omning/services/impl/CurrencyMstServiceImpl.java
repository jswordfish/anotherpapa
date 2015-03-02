package com.infrasofttech.omning.services.impl;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.persistence.EntityManager;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.CurrencyMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.ICurrencyMstDAO;
import com.infrasofttech.omning.services.CurrencyMstService;

@Service("currencyMstService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class CurrencyMstServiceImpl extends
		OmniNGServiceImpl<Long, CurrencyMst> implements CurrencyMstService {

	private static final Logger logger = Logger
			.getLogger(ProductMstServiceImpl.class);
	@Autowired
	protected ICurrencyMstDAO currencyMstDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) currencyMstDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		currencyMstDAO.setEntityManager(entityManager);
	}

}
