package com.infrasofttech.omning.services;

import java.util.List;

import com.infrasofttech.domain.entities.PrdAcNoMst;
import com.infrasofttech.domain.entities.PrdAcNumberConfig;
import com.infrasofttech.exceptions.OmniNGException;

public interface PrdAcNoMstService extends OmniNGService {

	public PrdAcNoMst getPrdAcNoByUniqueComposite(
		String tenantId, String branchCode, String moduleCode, String productCode, String customerNumber, String accountNumber) 
			throws OmniNGException;

	public PrdAcNoMst saveOrUpdate(PrdAcNoMst entity) throws OmniNGException;
	
	public PrdAcNoMst enablePrdAcNo(
		String tenantId, String branchCode, String moduleCode, String productCode, String customerNumber, String accountNumber) 
			throws OmniNGException;
	
	public PrdAcNoMst disablePrdAcNo(
		String tenantId, String branchCode, String moduleCode, String productCode, String customerNumber, String accountNumber) 
			throws OmniNGException;
	
	public List<PrdAcNoMst> getDisabledPrdAcNo(String tenantId, String branchCode) throws OmniNGException;
	
	public List<PrdAcNoMst> getDisabledPrdAcNoPg(
		String tenantId, String branchCode, Integer startFrom, Integer maxResults) throws OmniNGException;

	public List<PrdAcNoMst> getActivePrdAcNo(String tenantId, String branchCode) throws OmniNGException;

	public List<PrdAcNoMst> getActivePrdAcNoPg(
		String tenantId, String branchCode, Integer startFrom, Integer maxResults) throws OmniNGException;
	public PrdAcNoMst accountNumberGen(PrdAcNoMst prdAcNoMst ,PrdAcNumberConfig prdAcNumberConfig)throws OmniNGException;
	/*public PrdAcNumberConfig getConfigDetails(String tenantId,String moduleCode,String productCode);*/
}
