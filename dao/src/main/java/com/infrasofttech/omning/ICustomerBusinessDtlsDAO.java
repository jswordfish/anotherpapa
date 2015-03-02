package com.infrasofttech.omning;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.CustomerBusinessDtls;

public interface ICustomerBusinessDtlsDAO extends
		JPADAO<CustomerBusinessDtls, Long> {

	public CustomerBusinessDtls getCustomerBusinessDtls(Long id);
}
