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
import com.infrasofttech.domain.entities.VillageMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IVillageMstDAO;

@Service("villageMstService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class VillageMstServiceImpl extends OmniNGServiceImpl<Long, VillageMst>
		implements com.infrasofttech.omning.services.VillageMstService {
	@Autowired
	protected IVillageMstDAO villageMstDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) villageMstDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		villageMstDAO.setEntityManager(entityManager);
	}
	private static final Logger logger = Logger.getLogger(VillageMstServiceImpl.class);

	public static Logger getLogger() {
		return logger;
	}

	public List<VillageMst> showInitVillageList(String tenantId)
			throws OmniNGException {

		try{
			return super.findAllByTenant(tenantId);
		}catch(OmniNGException e){
			e.printStackTrace();
			throw new OmniNGException("cannot retrieve list of villages", e);
			
		}
	}
}
