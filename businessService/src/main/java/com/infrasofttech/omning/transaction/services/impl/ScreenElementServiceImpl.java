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
import com.infrasofttech.domain.entities.transaction.ScreenElement;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.impl.OmniNGServiceImpl;
import com.infrasofttech.omning.transaction.IScreenElementDAO;
import com.infrasofttech.omning.transaction.services.ScreenElementService;

@Service("screenElementService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class ScreenElementServiceImpl extends OmniNGServiceImpl<Long, ScreenElement>
implements ScreenElementService {

	private static final Logger logger = Logger
		.getLogger(ScreenElementServiceImpl.class);
	@Autowired
	protected IScreenElementDAO screenElementDAO;
	
	@PostConstruct
	public void init() throws Exception {
	super.setDAO((JPADAO) screenElementDAO);
	}
	
	@PreDestroy
	public void destroy() {
	}
	
	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		screenElementDAO.setEntityManager(entityManager);
	}

	public ScreenElement saveOrUpdate(ScreenElement screenElement) throws OmniNGException {
		return super.saveOrUpdate(screenElement);
	}
}

