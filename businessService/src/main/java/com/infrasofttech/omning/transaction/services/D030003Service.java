package com.infrasofttech.omning.transaction.services;

import com.infrasofttech.domain.entities.transaction.runtime.D030003;
import com.infrasofttech.omning.services.OmniNGService;

public interface D030003Service extends OmniNGService{
	
	public D030003 getD030003ByProductAccId(String PrdAcctId);
}