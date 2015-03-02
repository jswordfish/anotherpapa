package com.infrasofttech.omning.services;

import java.util.Date;
import java.util.List;

import com.infrasofttech.domain.entities.ParamLoanAc;
import com.infrasofttech.exceptions.OmniNGException;

public interface ParamsLoanService extends OmniNGService {

	public ParamLoanAc getParamLoanByUniqueComposite(String tenantId, String moduleCode, String productCode,String branchCode,Date effFromDate) throws OmniNGException;
	public ParamLoanAc getParamLoanByUniqueCompositeOfDisable(String tenantId, String moduleCode, String productCode,String branchCode,Date effFromDate) throws OmniNGException;
	public ParamLoanAc saveOrUpdate(ParamLoanAc entity) throws OmniNGException;
	public List<ParamLoanAc> getParamLoanMstBySetNo(String tenantId, String moduleCode, String productCode,Long setNo)throws OmniNGException;
	
}
