package com.infrasofttech.omning.services;

import com.infrasofttech.domain.entities.DeDupConfig;
import com.infrasofttech.exceptions.OmniNGException;

public interface DeDupConfigService extends OmniNGService {

	public DeDupConfig getDeDupConfigByUniqueComposite(String tenantId,
			String refDoc, Integer seqNumVal);

	public DeDupConfig saveOrUpdate(DeDupConfig entity) throws OmniNGException;

}
