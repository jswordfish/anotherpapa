package com.infrasofttech.omning.services;

import java.util.List;

import com.infrasofttech.domain.entities.StateMst;
import com.infrasofttech.exceptions.OmniNGException;

public interface StateMstService extends OmniNGService {

	
	public List<StateMst> showInitStateList(String tenantId) throws OmniNGException;
	
}
