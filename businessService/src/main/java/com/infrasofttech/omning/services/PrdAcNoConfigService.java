package com.infrasofttech.omning.services;

import java.util.List;

import com.infrasofttech.domain.entities.PrdAcNoMst;
import com.infrasofttech.domain.entities.PrdAcNumberConfig;
import com.infrasofttech.domain.entities.ProductMst;
import com.infrasofttech.exceptions.OmniNGException;


public interface PrdAcNoConfigService extends OmniNGService {

	public PrdAcNumberConfig getPrdAcNumberConfigByUniqueComposite(
			String tenantId, String moduleCode, String productCode) throws OmniNGException;

	public PrdAcNumberConfig saveOrUpdate(PrdAcNumberConfig entity) throws OmniNGException;
	
	public List<ProductMst> getProductsByModule(String tenantId,String moduleCode);
	public PrdAcNumberConfig enablePrdAcNo(
			String tenantId, String moduleCode, String productCode) 
				throws OmniNGException;
		
		public PrdAcNumberConfig disablePrdAcNo(
			String tenantId, String moduleCode, String productCode) 
				throws OmniNGException;
		
		public List<PrdAcNumberConfig> getDisabledPrdAcNo(String tenantId) throws OmniNGException;
		
}
