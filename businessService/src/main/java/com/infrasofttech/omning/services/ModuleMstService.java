package com.infrasofttech.omning.services;

import java.util.List;

import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.domain.entities.ModuleMst;
import com.infrasofttech.exceptions.OmniNGException;

public interface ModuleMstService extends OmniNGService {
	
	public ModuleMst getModuleMst(String tenantId, String branchCode) throws OmniNGException;
	public List<ModuleMst> getModules(String tenantId) throws OmniNGException;
	
}