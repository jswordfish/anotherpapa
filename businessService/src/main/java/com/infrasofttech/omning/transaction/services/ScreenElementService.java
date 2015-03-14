package com.infrasofttech.omning.transaction.services;

import java.util.List;

import com.infrasofttech.domain.entities.transaction.ScreenElement;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.OmniNGService;

public interface ScreenElementService extends OmniNGService{
	
	public ScreenElement saveOrUpdate(ScreenElement screenElement) throws OmniNGException;

	//public List<ScreenElement> populateDerivedFieldsFromSource(List<ScreenElement> elements)throws OmniNGException;
}
