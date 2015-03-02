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
import com.infrasofttech.domain.entities.ActivityMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IActivityMstDao;
import com.infrasofttech.omning.services.ActivityMstService;

@Service("activityMstService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class ActivityMstServiceImpl extends OmniNGServiceImpl<Long, ActivityMst>
		implements ActivityMstService {
	private static final Logger logger = Logger.getLogger(ActivityMstServiceImpl.class);

	@Autowired
	protected IActivityMstDao activityMstDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) activityMstDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		activityMstDAO.setEntityManager(entityManager);
	}

}
