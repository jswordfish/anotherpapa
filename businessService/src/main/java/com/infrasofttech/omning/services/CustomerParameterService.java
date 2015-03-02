package com.infrasofttech.omning.services;

import com.infrasofttech.domain.entities.CustomerParameter;
import com.infrasofttech.exceptions.OmniNGException;


public interface CustomerParameterService extends OmniNGService {

	public CustomerParameter getCustomerParameter(String tenantId, String customerCode)	throws OmniNGException;
	
	public CustomerParameter saveOrUpdate(CustomerParameter customerParameter) throws OmniNGException;
	
}
