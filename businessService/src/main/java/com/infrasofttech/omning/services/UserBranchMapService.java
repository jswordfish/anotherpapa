package com.infrasofttech.omning.services;

import com.infrasofttech.domain.entities.UserBranch_RoleMap;
import com.infrasofttech.exceptions.OmniNGException;


public interface UserBranchMapService extends OmniNGService {

	public String getRoleCode(String tenantId, String branchCode,
			String loginId) throws OmniNGException;
	
	
	//public UserBranch_RoleMap saveOrUpdate(UserBranch_RoleMap userBranch_RoleMap) throws OmniNGException;
	
}
