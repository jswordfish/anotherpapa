package com.infrasofttech.omning.transaction.services;

import com.infrasofttech.domain.entities.VoucherMst;
import com.infrasofttech.domain.entities.transaction.runtime.ScreenTransaction;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.OmniNGService;

public interface ScreenTransactionService extends OmniNGService{
	
	public ScreenTransaction saveOrUpdate(ScreenTransaction screen, VoucherMst voucherMst) throws OmniNGException;

	public ScreenTransaction findUniqueScreenTransaction(String tenantId, String tNum);
}

