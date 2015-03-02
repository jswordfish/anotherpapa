package com.infrasofttech.omning.services;

import com.infrasofttech.domain.entities.RoleMst;
import com.infrasofttech.exceptions.OmniNGException;

public interface RoleMstService extends OmniNGService {

	public RoleMst saveOrUpdate(RoleMst entity) throws OmniNGException;
	public RoleMst getRoleMstByTenantNRoleNIsActive(String tenantId, String roleCode) throws OmniNGException;
	public RoleMst getRoleMstByUniqueComposite(String tenantId, String roleCode)throws OmniNGException; 
}
