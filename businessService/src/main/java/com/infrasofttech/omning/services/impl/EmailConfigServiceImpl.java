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
import com.infrasofttech.domain.entities.EmailConfig;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IEmailConfigDAO;
import com.infrasofttech.omning.services.EmailConfigService;

@Service("emailConfigService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class EmailConfigServiceImpl extends
		OmniNGServiceImpl<Long, EmailConfig> implements
		EmailConfigService {
	@Autowired
	protected IEmailConfigDAO emailConfigDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) emailConfigDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		emailConfigDAO.setEntityManager(entityManager);
	}

	
	public EmailConfig getEmailConfigByUniqueComposite(String tenantId, String emailConfigCode) {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("emailConfigCode", emailConfigCode);
		queryParams.put("tenantId", tenantId);
		@SuppressWarnings("unchecked")
		List<EmailConfig> emailConfigs = (List<EmailConfig>)findByNamedQueryAndNamedParams("EmailConfig.getEmailConfig", queryParams);
		if (emailConfigs == null) {
			return null;
		} else if (emailConfigs != null && emailConfigs.size() == 0) {
			return null;
		}
		return emailConfigs.get(0);
	}
}
