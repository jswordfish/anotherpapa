package com.infrasofttech.omning;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.CustomerMst;

public interface ICustomerMstDAO extends JPADAO<CustomerMst, Long> {
	
	public Long getMaxCustomerCode();

}
