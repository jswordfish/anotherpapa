package com.infrasofttech.omning.services;

import java.util.Date;
import java.util.List;

import com.infrasofttech.domain.entities.ParamCheckingAc;
import com.infrasofttech.exceptions.OmniNGException;

public interface ParamsCheckingAcService extends OmniNGService {

	public ParamCheckingAc getParamCheckingAcByUniqueComposite(String tenantId,
			String moduleCode, String productCode, String branchCode,Date effFromDate)
			throws OmniNGException;
	public ParamCheckingAc getParamCheckingAcByUniqueCompositeOfDisable(String tenantId,
			String moduleCode, String productCode, String branchCode,Date effFromDate)
			throws OmniNGException;

	public ParamCheckingAc saveOrUpdate(ParamCheckingAc entity)
			throws OmniNGException;

	public List<ParamCheckingAc> getParamCheckingAcBysetNO(String tenantId,
			String moduleCode, String productCode, Long setNumber)
			throws OmniNGException;

}
