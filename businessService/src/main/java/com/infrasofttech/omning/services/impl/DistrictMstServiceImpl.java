package com.infrasofttech.omning.services.impl;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.persistence.EntityManager;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.DistrictMst;
import com.infrasofttech.domain.entities.StateMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IDistrictMstDAO;

@Service("districtMstService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class DistrictMstServiceImpl extends
		OmniNGServiceImpl<Long, DistrictMst> implements
		com.infrasofttech.omning.services.DistrictMstService {
	@Autowired
	protected IDistrictMstDAO districtMstDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) districtMstDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		districtMstDAO.setEntityManager(entityManager);
	}
	private static final Logger logger = Logger
			.getLogger(DistrictMstServiceImpl.class);

	public static Logger getLogger() {
		return logger;
	}

	public List<DistrictMst> showInitDistrictList(String tenantId)
			throws OmniNGException {

		try{
			return super.findAllByTenant(tenantId);
		}catch(OmniNGException e){
			e.printStackTrace();
			throw new OmniNGException("cannot retrieve list of districts", e);
			
		}
	}
}
