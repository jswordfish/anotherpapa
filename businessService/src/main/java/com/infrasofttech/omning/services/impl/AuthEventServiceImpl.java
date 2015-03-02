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
import com.infrasofttech.domain.entities.AuthEvent;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IAuthEventDAO;
import com.infrasofttech.omning.services.AuthEventService;

@Service("authEventService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class AuthEventServiceImpl extends OmniNGServiceImpl<Long, AuthEvent>
		implements AuthEventService {

	private static final Logger logger = Logger
			.getLogger(AuthEventServiceImpl.class);
	@Autowired
	protected IAuthEventDAO authEventDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) authEventDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		authEventDAO.setEntityManager(entityManager);
	}
}
