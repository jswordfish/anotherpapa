package com.infrasofttech.omning;

import java.util.List;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.AccountNominee;
import com.infrasofttech.domain.entities.LookupCode;

public interface ILookupCodeDAO extends JPADAO<LookupCode, Long> {
	public List<LookupCode> getLookupCodeList();
	public LookupCode getLookupCodeListOnId(Long id) throws Exception;
}
