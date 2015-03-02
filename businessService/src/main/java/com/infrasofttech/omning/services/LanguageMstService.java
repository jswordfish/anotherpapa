package com.infrasofttech.omning.services;

import java.util.List;

import com.infrasofttech.domain.entities.LanguageMst;
import com.infrasofttech.exceptions.OmniNGException;

public interface LanguageMstService extends OmniNGService {
	public List<LanguageMst> getLanguageByUniqueComposite(String tenantId, String languageCode)throws OmniNGException;

	
}
