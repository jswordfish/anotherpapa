package com.infrasofttech.omning.services;

import java.util.List;

import com.infrasofttech.domain.entities.MunicipalityMst;
import com.infrasofttech.exceptions.OmniNGException;

public interface MunicipalityMstService extends OmniNGService {

	public List<MunicipalityMst> showInitMunicipalityList(String tenantId) throws OmniNGException;
}
