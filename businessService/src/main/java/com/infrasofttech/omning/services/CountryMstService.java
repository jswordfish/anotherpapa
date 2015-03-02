package com.infrasofttech.omning.services;

import java.util.List;

import com.infrasofttech.domain.entities.CountryMst;
import com.infrasofttech.exceptions.OmniNGException;

public interface CountryMstService extends OmniNGService {

	public List<CountryMst> showInitCountryList(String tenantId) throws OmniNGException;
}
