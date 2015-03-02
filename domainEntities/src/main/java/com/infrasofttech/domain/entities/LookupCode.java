package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;

@Entity
public class LookupCode extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true, length = 30)
	private String lookupCode = "";

	@Column(nullable = true, length = 50)
	private String lookupCodeDesc = "";

	@Column(nullable = true)
	private String lookupTypeCode = ""; // 'SYSTEM', 'USER' - 2 values only.

	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private Collection<LookupValue> lookupValues = new ArrayList<LookupValue>();

	@Column(nullable = true)
	private Boolean isActive = true;

	public String getLookupCode() {
		return lookupCode;
	}

	public void setLookupCode(String lookupCode) {
		this.lookupCode = lookupCode;
	}

	public String getLookupCodeDesc() {
		return lookupCodeDesc;
	}

	public void setLookupCodeDesc(String lookupCodeDesc) {
		this.lookupCodeDesc = lookupCodeDesc;
	}

	public String getLookupTypeCode() {
		return lookupTypeCode;
	}

	public void setLookupTypeCode(String lookupTypeCode) {
		this.lookupTypeCode = lookupTypeCode;
	}

	public Collection<LookupValue> getLookupValues() {
		return lookupValues;
	}

	public void setLookupValues(Collection<LookupValue> lookupValues) {
		this.lookupValues = lookupValues;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

}
