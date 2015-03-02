package com.infrasofttech.omning.services;

import java.util.List;

import com.infrasofttech.domain.entities.TenantMst;
import com.infrasofttech.exceptions.OmniNGException;

public interface TenantMstService extends OmniNGService {

	public TenantMst getTenantMst(String tenantCode, String tenantGrpCode)throws OmniNGException;

	public List<TenantMst> getTenants(String tenantGrpCode) throws OmniNGException;

	public TenantMst findByURL(String url) throws OmniNGException;

	public TenantMst getTenantMstByCode(String tenantCode) throws OmniNGException;

}
