package com.infrasofttech.omning.services;

import java.util.List;

import com.infrasofttech.domain.entities.LookupCode;
import com.infrasofttech.exceptions.OmniNGException;

public interface LookupCodeService extends OmniNGService {

	public List<LookupCode> getLookupCodeList(String tenantId) throws OmniNGException;
	
	
	//public LookupCode getLookupCodeListOnId(String tenantId, Long look) throws Exception;
}
