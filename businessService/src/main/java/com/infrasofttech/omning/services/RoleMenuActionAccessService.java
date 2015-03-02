package com.infrasofttech.omning.services;

import java.util.Set;

import com.infrasofttech.domain.entities.RoleMenuActionAccess;
import com.infrasofttech.exceptions.OmniNGException;


public interface RoleMenuActionAccessService extends OmniNGService {

	/**
	 * Functionalities required
	 * 1. Create new RMAA
	 * 2. Update RMAA
	 * 3. Get (non-paginated) List of RMAA based on tenantId and RoleCode and language
	 */

	// Functionalities 1 & 2
	public RoleMenuActionAccess saveOrUpdate(RoleMenuActionAccess entity) throws OmniNGException;
	
	public Set<RoleMenuActionAccess> getRoleMenuActionAccessSet(String tenantId, String roleCode)throws OmniNGException;

	public RoleMenuActionAccess getRoleMenuActionAccess(String tenantId, String roleCode, String menuCode) throws OmniNGException;
	
}



