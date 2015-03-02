package com.infrasofttech.omning;

import java.util.List;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.AccountMgmtMst;
import com.infrasofttech.domain.entities.LookupValue;

public interface ILookupValueDAO extends JPADAO<LookupValue, Long> {
	public List<LookupValue> getLookupValueListOnId(Long id) throws Exception;
}
