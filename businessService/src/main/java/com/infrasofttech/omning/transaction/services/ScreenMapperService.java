package com.infrasofttech.omning.transaction.services;

import com.infrasofttech.domain.entities.transaction.ScreenMapper;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.OmniNGService;

public interface ScreenMapperService extends OmniNGService{
	
	public ScreenMapper saveOrUpdate(ScreenMapper screenMapper) throws OmniNGException;

}
