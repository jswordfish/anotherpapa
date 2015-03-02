package com.infrasofttech.omning.services;

import java.util.Date;
import java.util.List;


import com.infrasofttech.domain.entities.CropTypeParam;
import com.infrasofttech.exceptions.OmniNGException;

public interface CropTypeParamService extends OmniNGService {
	
	public CropTypeParam getUniqueCropTypeParam(String tenantId, String cropType, Date fromDate) throws OmniNGException;
	public List<CropTypeParam> getCropType(String tenantCode) throws OmniNGException;	
	public CropTypeParam saveOrUpdate(CropTypeParam cropTypeParam)throws OmniNGException;
	public CropTypeParam getDisabledCropType(String tenantId, String cropType, Date fromDate) throws OmniNGException;

}