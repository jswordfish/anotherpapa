package com.infrasofttech.omning.transaction.services.impl;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.persistence.EntityManager;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.transaction.runtime.ScreenTransaction;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.impl.OmniNGServiceImpl;
import com.infrasofttech.omning.transaction.IScreenTransactionDAO;
import com.infrasofttech.omning.transaction.services.ScreenTransactionService;
@Service("screenTransactionService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class ScreenTransactionServiceImpl extends OmniNGServiceImpl<Long, ScreenTransaction>
implements ScreenTransactionService {

	private static final Logger logger = Logger
		.getLogger(ScreenTransactionService.class);
	@Autowired
	protected IScreenTransactionDAO screenTransactionDAO;
	
	@PostConstruct
	public void init() throws Exception {
	super.setDAO((JPADAO) screenTransactionDAO);
	}
	
	@PreDestroy
	public void destroy() {
	}
	
	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		screenTransactionDAO.setEntityManager(entityManager);
	}

	public ScreenTransaction saveOrUpdate(ScreenTransaction screenTransaction) throws OmniNGException {
		
		return super.saveOrUpdate(screenTransaction);
	}
}

