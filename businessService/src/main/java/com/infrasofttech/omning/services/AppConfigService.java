package com.infrasofttech.omning.services;

import java.util.List;

import com.infrasofttech.domain.entities.AppConfig;
import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.domain.entities.PrdAcNumberConfig;
import com.infrasofttech.exceptions.OmniNGException;

public interface AppConfigService extends OmniNGService {
	public AppConfig findById(Long id);
	
	public List<AppConfig> getAllAppConfigList() ;
	public List<BranchMst> showInitBranchList(String tenantCode);
	public AppConfig saveOrUpdate(AppConfig entity) throws OmniNGException;
	public AppConfig getAppConfigByUniqueComposite(	String tenantId, String branchCode)	throws OmniNGException;
	public AppConfig getAppConfigByIsActiveFalseNTenantNBranch(	String tenantId, String branchCode)	throws OmniNGException;
	public List<AppConfig> getAppConfigBySetNoTenant(String tenantId,Long setNo)throws OmniNGException;
}
