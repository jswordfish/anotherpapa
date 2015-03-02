package com.infrasofttech.omning.services.impl;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.LookupValue;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.ILookupValueDAO;

@Service("lookupValueService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class LookupValueServiceImpl extends OmniNGServiceImpl<Long, LookupValue>
		implements com.infrasofttech.omning.services.LookupValueService {
	@Autowired
	protected ILookupValueDAO lookupValueDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) lookupValueDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		lookupValueDAO.setEntityManager(entityManager);
	}

	public List<LookupValue> getLookupValueListOnId(String tenantId,
			String lookupCode, String langCode) throws Exception {
		// TODO Auto-generated method stub
		//LookupValue.getLookupValue
		Map<String, String> params = new HashMap<String, String>();
		params.put("tenantId",  tenantId);
		params.put("lookUpCode", lookupCode);
		params.put("languageCode", langCode);
		List<LookupValue> values = super.findByNamedQueryAndNamedParams("LookupValue.getLookupValue", params);
		return values;
	}

	@SuppressWarnings("unchecked")
	public Map<String, String> getLookupValues(String lookupCode,
			String languageCode, String tenantId) throws OmniNGException {
		Map<String, String> mapOfLookupValues = new HashMap<String, String>();
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("lookUpCode", lookupCode);
		params.put("languageCode", languageCode);
		params.put("tenantId",  tenantId);
		
		List<LookupValue> lookupValueList = super.findByNamedQueryAndNamedParams("LookupValue.getLookupValue", params);
		
		for(LookupValue lookupValue : lookupValueList) {
			mapOfLookupValues.put(lookupValue.getLookupValueCode(), lookupValue.getLookupDisplayValue());
		}
		
		return mapOfLookupValues;
	}
	
	
}
