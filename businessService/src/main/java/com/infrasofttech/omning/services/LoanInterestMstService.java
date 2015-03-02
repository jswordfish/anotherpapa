package com.infrasofttech.omning.services;

import java.util.Date;

import com.infrasofttech.domain.entities.LoanInterestMst;
import com.infrasofttech.exceptions.OmniNGException;


public interface LoanInterestMstService extends OmniNGService{

	public LoanInterestMst getLIMstByUniqueComposition(String tenantId, String productCode,
			String currencyCode, Date effFromDate) throws OmniNGException;

	
}
