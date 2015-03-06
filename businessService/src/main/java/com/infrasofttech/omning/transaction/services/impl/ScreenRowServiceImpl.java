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
import com.infrasofttech.domain.entities.transaction.ScreenRow;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.impl.OmniNGServiceImpl;
import com.infrasofttech.omning.transaction.IScreenRowDAO;
import com.infrasofttech.omning.transaction.services.ScreenRowService;
@Service("screenRowService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class ScreenRowServiceImpl extends OmniNGServiceImpl<Long, ScreenRow>
implements ScreenRowService {

	private static final Logger logger = Logger
		.getLogger(ScreenElementServiceImpl.class);
	@Autowired
	protected IScreenRowDAO screenRowDAO;
	
	@PostConstruct
	public void init() throws Exception {
	super.setDAO((JPADAO) screenRowDAO);
	}
	
	@PreDestroy
	public void destroy() {
	}
	
	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		screenRowDAO.setEntityManager(entityManager);
	}

	


}
