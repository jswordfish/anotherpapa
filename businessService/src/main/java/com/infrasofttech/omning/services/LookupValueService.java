package com.infrasofttech.omning.services;

import java.util.List;
import java.util.Map;

import com.infrasofttech.domain.entities.LookupValue;
import com.infrasofttech.exceptions.OmniNGException;

public interface LookupValueService extends OmniNGService {

	// Can be discarded later
	public List<LookupValue> getLookupValueListOnId(String tenantId, String lookupCode, String langCode) throws Exception;
	
	public Map<String, String> getLookupValues(String lookupCode, String languageCode, String tenantId ) throws OmniNGException;
	
}
