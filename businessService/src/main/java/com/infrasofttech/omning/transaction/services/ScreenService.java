package com.infrasofttech.omning.transaction.services;

import com.infrasofttech.domain.entities.transaction.Screen;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.OmniNGService;

public interface ScreenService extends OmniNGService{
	
	public Screen saveOrUpdate(Screen screen) throws OmniNGException;

}
