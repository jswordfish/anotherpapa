package com.infrasofttech.omning.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.infrasofttech.domain.entities.TenantGrpMst;
import com.infrasofttech.exceptions.OmniNGException;

public interface TenantGrpMstService extends OmniNGService {

	public TenantGrpMst getTenantGrpMstByUniqueComposite(String tenantGrpCode);
	public List<TenantGrpMst> getTenantGrpMst(String tenantGrpCode)
			throws OmniNGException;
	public TenantGrpMst saveOrUpdate(TenantGrpMst entity)
			throws OmniNGException;
	public TenantGrpMst enableTenantGrpMst(String tenantGrpCode)
			throws OmniNGException;
	public TenantGrpMst disableTenantGrpMst(String tenantGrpCode)
			throws OmniNGException;
	public List<TenantGrpMst> getTenantGrpMstWithoutFilter() throws OmniNGException ;
	
}
