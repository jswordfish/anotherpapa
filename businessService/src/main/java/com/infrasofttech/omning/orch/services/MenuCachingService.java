package com.infrasofttech.omning.orch.services;

import java.util.List;

import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.utils.SetOfRoleMenuz;

public interface MenuCachingService {

	public List<SetOfRoleMenuz> getSetOfRoleMenuz() throws OmniNGException;
	
	
}
