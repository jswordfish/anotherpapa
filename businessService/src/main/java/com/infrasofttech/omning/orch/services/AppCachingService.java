package com.infrasofttech.omning.orch.services;

import com.infrasofttech.exceptions.OmniNGException;

public interface AppCachingService {

	public void cacheAppConfigValues() throws OmniNGException;
	
	public void cacheLookupValues() throws OmniNGException;
	
	public void cacheMenuz() throws OmniNGException;
	
	public void cacheEmailProp() throws OmniNGException;
	
}
