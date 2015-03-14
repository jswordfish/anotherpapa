package com.infrasofttech.omning;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.VoucherMst;

public interface IVoucherMstDAO extends JPADAO<VoucherMst, Long> {
	
	public VoucherMst getUniqueVoucherMstNormal(String tenantId, String branchCode, String entryDate, String batchCode, Long setNo, Long scrollNo);

}
