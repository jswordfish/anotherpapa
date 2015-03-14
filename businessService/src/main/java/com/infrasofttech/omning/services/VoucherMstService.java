package com.infrasofttech.omning.services;

import com.infrasofttech.domain.entities.VoucherMst;
import com.infrasofttech.exceptions.OmniNGException;


public interface VoucherMstService extends OmniNGService {
	
	public VoucherMst saveOrUpdate(VoucherMst voucherMst) throws OmniNGException;
	
	public VoucherMst getUniqueVoucherMst(String tenantId, String branchCode, String entryDate, String batchCode, Long setNo, Long scrollNo);

	public VoucherMst getUniqueVoucherMstNormal(String tenantId, String branchCode, String entryDate, String batchCode, Long setNo, Long scrollNo);

}
