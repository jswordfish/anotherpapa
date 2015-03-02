package com.infrasofttech.omning.services;

import java.util.List;

import com.infrasofttech.domain.entities.CustomerMst;
import com.infrasofttech.exceptions.OmniNGException;

public interface CustomerService extends OmniNGService {

	

	public List<CustomerMst> getCustomerByTenantId(String tenantId) throws OmniNGException;

	public CustomerMst saveOrUpdate(CustomerMst customerMst)
			throws OmniNGException;

	public CustomerMst getCustomerMstByUniqueComposite(String tenantCode,
			String customerCode) throws OmniNGException;

}
