package com.infrasofttech.omning.services;

import com.infrasofttech.domain.entities.AuthMatrixSlab;
import com.infrasofttech.exceptions.OmniNGException;

public interface AuthMatrixSlabService extends OmniNGService{
	public AuthMatrixSlab saveOrUpdate(AuthMatrixSlab entity) throws OmniNGException;

	public AuthMatrixSlab getAuthMatrixSlabByUniqueComposite(Long id)
			throws OmniNGException;

}
