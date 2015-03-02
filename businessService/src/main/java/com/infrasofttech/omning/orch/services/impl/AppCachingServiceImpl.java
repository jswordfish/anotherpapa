package com.infrasofttech.omning.orch.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IAppConfigDAO;
import com.infrasofttech.omning.IEmailPropDAO;
import com.infrasofttech.omning.ILookupValueDAO;
import com.infrasofttech.omning.IMenuzDAO;
import com.infrasofttech.omning.orch.services.AppCachingService;

@Service("appCachingServiceImpl")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class AppCachingServiceImpl implements AppCachingService{

	@Autowired
	IAppConfigDAO appConfigDAO;

	//@Autowired
	ILookupValueDAO lookupValuesDAO;
	
	//@Autowired
	IEmailPropDAO emailPropDAO;
	
	//@Autowired
	IMenuzDAO menuzDAO;
	
	public void cacheAppConfigValues() throws OmniNGException {
		//TODO Read values from DB and assign to ...

	
	}

	public void cacheLookupValues() throws OmniNGException {
		//TODO Read values from DB and assign to ...
		
	}

	public void cacheMenuz() throws OmniNGException {
		//TODO Read values from DB and assign to ...
		
	}

	public void cacheEmailProp() throws OmniNGException {
		//TODO Read values from DB and assign to ...
		
	}

	

}
