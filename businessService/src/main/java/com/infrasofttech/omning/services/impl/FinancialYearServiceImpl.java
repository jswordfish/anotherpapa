package com.infrasofttech.omning.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.persistence.EntityManager;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.FinancialYear;
import com.infrasofttech.domain.entities.ModuleMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IFinancialYearDAO;
import com.infrasofttech.omning.IModuleMstDAO;
import com.infrasofttech.omning.services.FinancialYearService;
import com.infrasofttech.omning.services.ModuleMstService;

@Service("financialYearService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class FinancialYearServiceImpl extends OmniNGServiceImpl<Long, FinancialYear>
		implements FinancialYearService {
	private static final Logger logger = Logger.getLogger(FinancialYearServiceImpl.class);
	
	
	@Autowired
	protected IFinancialYearDAO financialYearDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) financialYearDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		financialYearDAO.setEntityManager(entityManager);
	}

	

	
}
