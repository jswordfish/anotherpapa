package com.infrasofttech.omning.action.transaction;

import java.util.ArrayList;
import java.util.List;

import com.infrasofttech.domain.entities.LookupValue;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.LookupValueService;
import com.infrasofttech.omning.utils.SpringUtil;

public class TransctionUtil {
	
	public static List<String> getLookupValues(String tenantId, String languageCode, String lookupCode) throws OmniNGException{
		try {
			LookupValueService lookupValueService = (LookupValueService) SpringUtil.getSpringUtil().getService("lookupValueService");
		
			List<LookupValue> values = lookupValueService.getLookupValueListOnId(tenantId, lookupCode, languageCode);
			List<String> vs = new ArrayList<String>();
			for(LookupValue value : values){
				vs.add(value.getLookupDisplayValue());
				
			}
			return vs;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new OmniNGException("lookup code looks invalid", e);
		}
	}

}
