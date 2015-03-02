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
import com.infrasofttech.domain.entities.CheckingInterestMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.ICheckingInterestMstDao;
import com.infrasofttech.omning.services.CheckingInterestMstService;

@Service("checkingInterestMstService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class CheckingInterestMstServiceImpl extends OmniNGServiceImpl<Long, CheckingInterestMst>
		implements CheckingInterestMstService {
	private static final Logger logger = Logger
			.getLogger(CheckingInterestMstServiceImpl.class);

	@Autowired
	protected ICheckingInterestMstDao checkingInterestMstDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) checkingInterestMstDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		checkingInterestMstDAO.setEntityManager(entityManager);
	}
}
