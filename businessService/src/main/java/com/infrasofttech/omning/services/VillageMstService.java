package com.infrasofttech.omning.services;

import java.util.List;

import com.infrasofttech.domain.entities.VillageMst;
import com.infrasofttech.exceptions.OmniNGException;

public interface VillageMstService extends OmniNGService {

	public List<VillageMst> showInitVillageList(String tenantId) throws OmniNGException;
}
