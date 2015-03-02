package com.infrasofttech.omning.services.impl;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.TxnCCMain;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.ITxnCCMainDAO;

@Service("txnClientConfiguratorService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class TxnClientConfiguratorServiceImpl extends OmniNGServiceImpl<Long, TxnCCMain>
		implements com.infrasofttech.omning.services.TxnClientConfiguratorService {
	@Autowired
	protected ITxnCCMainDAO txnCCMainDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) txnCCMainDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		txnCCMainDAO.setEntityManager(entityManager);
	}
}
