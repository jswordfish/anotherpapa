package com.infrasofttech.omning.transaction.services.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.persistence.EntityManager;

import org.apache.log4j.Logger;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import antlr.collections.List;

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
		//ScreenElement.getScreenElement
		Map<String, String> params = new HashMap<String, String>();
		params.put("tenantId", screenElement.getTenantId());
		params.put("name", screenElement.getName());
		java.util.List<ScreenElement> elements = super.findByNamedQueryAndNamedParams("ScreenElement.getScreenElement", params);
		if(elements.size() == 0){
			//create
			return super.saveOrUpdate(screenElement);
		}
		else{
			//update
			ScreenElement elementFromDb = elements.get(0);
			screenElement.setId(elementFromDb.getId());
			Mapper mapper = new DozerBeanMapper();
			mapper.map(screenElement, elementFromDb);
			return super.saveOrUpdate(elementFromDb);
		}
		//return super.saveOrUpdate(screenElement);
	}
}

