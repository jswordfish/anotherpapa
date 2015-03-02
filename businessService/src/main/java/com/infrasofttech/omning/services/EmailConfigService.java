package com.infrasofttech.omning.services;

import com.infrasofttech.domain.entities.EmailConfig;
import com.infrasofttech.exceptions.OmniNGException;

public interface EmailConfigService extends OmniNGService {
	public EmailConfig getEmailConfigByUniqueComposite(String tenantId, String emailConfigCode)throws OmniNGException;
	
}
