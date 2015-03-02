package com.infrasofttech.omning.services.impl;

import java.util.HashMap;
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
import com.infrasofttech.domain.entities.LanguageMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.ILanguageMstDAO;
import com.infrasofttech.omning.services.LanguageMstService;

@Service("languageMstService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class LanguageMstServiceImpl extends
		OmniNGServiceImpl<Long, LanguageMst> implements
		LanguageMstService {
	@Autowired
	protected ILanguageMstDAO languageMstDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) languageMstDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		languageMstDAO.setEntityManager(entityManager);
	}

	
	public List<LanguageMst> getLanguageByUniqueComposite(String tenantId, String languageCode) {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("languageCode", languageCode);
		queryParams.put("tenantId", tenantId);
		@SuppressWarnings("unchecked")
		List<LanguageMst> languages = (List<LanguageMst>)findByNamedQueryAndNamedParams("LanguageMst.getlanguage", queryParams);
		if (languages == null) {
			return null;
		} else if (languages != null && languages.size() == 0) {
			return null;
		}
		return languages;
	}
}
