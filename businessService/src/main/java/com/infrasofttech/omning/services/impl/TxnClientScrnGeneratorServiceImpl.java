package com.infrasofttech.omning.services.impl;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.TxnHeader;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.ITxnCCDetailDAO;

@Service("txnClientScrnGenService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class TxnClientScrnGeneratorServiceImpl extends OmniNGServiceImpl<Long, TxnHeader>
		implements com.infrasofttech.omning.services.TxnClientScrnGeneratorService {
	@Autowired
	protected ITxnCCDetailDAO txnCCDtlsDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) txnCCDtlsDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		txnCCDtlsDAO.setEntityManager(entityManager);
	}
}
