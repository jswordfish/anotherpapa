package com.infrasofttech.omning.services;

import java.util.List;

import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.exceptions.OmniNGException;

public interface BranchMstService extends OmniNGService {
	
	public BranchMst getBranchMst(String tenantId, String branchCode) throws OmniNGException;
	public List<BranchMst> getBranches(String tenantCode) throws OmniNGException;
	//public List<BranchMst> listUserById(Long[] id) throws OmniNGException;
	public BranchMst saveOrUpdate(BranchMst branchMst)throws OmniNGException;
	public BranchMst disableBranch(String tenantId, String branchCode ) throws OmniNGException;
}