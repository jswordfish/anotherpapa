package com.infrasofttech.utils;

import java.util.ArrayList;
import java.util.List;

public class SetOfLookupCodeValue {

	private String tenantId;
	
	private String lookupCode;
	
	private List<SetOfLookupValue> setOfLookupValuez =
			new ArrayList<SetOfLookupValue>();

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getLookupCode() {
		return lookupCode;
	}

	public void setLookupCode(String lookupCode) {
		this.lookupCode = lookupCode;
	}

	public List<SetOfLookupValue> getSetOfLookupValuez() {
		return setOfLookupValuez;
	}

	public void setSetOfLookupValuez(List<SetOfLookupValue> setOfLookupValuez) {
		this.setOfLookupValuez = setOfLookupValuez;
	}
}
