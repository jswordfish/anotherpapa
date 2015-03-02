package com.infrasofttech.omning.services.impl;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.LookupCode;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.ILookupCodeDAO;

@Service("lookupCodeService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class LookupCodeServiceImpl extends OmniNGServiceImpl<Long, LookupCode>
		implements com.infrasofttech.omning.services.LookupCodeService {
	@Autowired
	protected ILookupCodeDAO lookupCodeDao;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) lookupCodeDao);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		lookupCodeDao.setEntityManager(entityManager);
	}

	public List<LookupCode> getLookupCodeList(String tenantId) throws OmniNGException {
		// TODO Auto-generated method stub
		return super.findAllByTenant(tenantId);
	}



}
