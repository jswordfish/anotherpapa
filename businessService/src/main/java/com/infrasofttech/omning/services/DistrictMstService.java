package com.infrasofttech.omning.services;

import java.util.List;

import com.infrasofttech.domain.entities.DistrictMst;
import com.infrasofttech.exceptions.OmniNGException;

public interface DistrictMstService extends OmniNGService {

	public List<DistrictMst> showInitDistrictList(String tenantId) throws OmniNGException;
}
