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
import com.infrasofttech.domain.entities.BatchMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IBatchMstDao;
import com.infrasofttech.omning.services.BatchMstService;

@Service("batchMstService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class BatchMstServiceImpl extends OmniNGServiceImpl<Long, BatchMst>
		implements BatchMstService {
	private static final Logger logger = Logger
			.getLogger(BatchMstServiceImpl.class);

	@Autowired
	protected IBatchMstDao batchMstDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) batchMstDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		batchMstDAO.setEntityManager(entityManager);
	}

}
