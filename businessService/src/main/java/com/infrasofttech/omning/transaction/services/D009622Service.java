package com.infrasofttech.omning.transaction.services;

import com.infrasofttech.domain.entities.transaction.runtime.D009622;
import com.infrasofttech.omning.services.OmniNGService;

public interface D009622Service extends OmniNGService{
	
	public D009622 getD009622ByProductAccId(String PrdAcctId);
}