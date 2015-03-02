package com.infrasofttech.omning.services;

import com.infrasofttech.domain.entities.AuthMatrixSlabUser;
import com.infrasofttech.exceptions.OmniNGException;

public interface AuthMatrixSlabUserService extends OmniNGService{
	public AuthMatrixSlabUser saveOrUpdate(AuthMatrixSlabUser entity) throws OmniNGException;

	public AuthMatrixSlabUser getAuthMatrixSlabUserByUniqueComposite(Long id)
			throws OmniNGException;
}
