package com.infrasofttech.omning.services;


import com.infrasofttech.domain.entities.AuthMatrix;
import com.infrasofttech.exceptions.OmniNGException;

public interface AuthMatrixService extends OmniNGService {

	public AuthMatrix saveOrUpdate(AuthMatrix entity) throws OmniNGException;

	public AuthMatrix getAuthMatrixByUniqueComposite(Long id)
			throws OmniNGException;

	public AuthMatrix getAuthMatrixId() throws OmniNGException;
}
