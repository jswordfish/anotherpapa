package com.infrasofttech.utils;

import java.util.ArrayList;
import java.util.List;

import com.infrasofttech.domain.entities.LookupValue;

public class SetOfLookupValue {

	private String valueCode;
	
	private String languageCode;
	
	private List<LookupValue> lookupValues = new ArrayList<LookupValue>();

	public String getValueCode() {
		return valueCode;
	}

	public void setValueCode(String valueCode) {
		this.valueCode = valueCode;
	}

	public String getLanguageCode() {
		return languageCode;
	}

	public void setLanguageCode(String languageCode) {
		this.languageCode = languageCode;
	}

	public List<LookupValue> getLookupValues() {
		return lookupValues;
	}

	public void setLookupValues(List<LookupValue> lookupValues) {
		this.lookupValues = lookupValues;
	}
}
