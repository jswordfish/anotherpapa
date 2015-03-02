package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
@NamedQueries({ @NamedQuery(name = "LookupValue.getLookupValue", query = "SELECT l FROM LookupValue l "
		+ "WHERE l.tenantId=:tenantId AND l.lookUpCode=:lookUpCode AND l.languageCode=:languageCode") })
public class LookupValue extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true, length = 30, unique = false)
	// This is multi-tenant system. (tenantcode + languageCode +
	// lookupValueCode) will be unique.
	private String lookupValueCode = ""; // This value will be fixed across all
											// tenants

	@Column(nullable = true, length = 100, unique = false)
	private String lookupDisplayValue = ""; // Can be different for different
											// tenants

	@Column(nullable = true, length = 30, unique = false)
	private String lookUpCode = "";

	@Column(nullable = true, length = 10)
	private String languageCode = "";

	@Column(nullable = true)
	private Boolean isActive = true;

	@Column(nullable = true, length = 30)
	private String authStatus="";

	public String getLookupValueCode() {
		return lookupValueCode;
	}

	public void setLookupValueCode(String lookupValueCode) {
		this.lookupValueCode = lookupValueCode;
	}

	public String getLookupDisplayValue() {
		return lookupDisplayValue;
	}

	public void setLookupDisplayValue(String lookupDisplayValue) {
		this.lookupDisplayValue = lookupDisplayValue;
	}

	public String getLookUpCode() {
		return lookUpCode;
	}

	public void setLookUpCode(String lookUpCode) {
		this.lookUpCode = lookUpCode;
	}

	public String getLanguageCode() {
		return languageCode;
	}

	public void setLanguageCode(String languageCode) {
		this.languageCode = languageCode;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public String getAuthStatus() {
		return authStatus;
	}

	public void setAuthStatus(String authStatus) {
		this.authStatus = authStatus;
	}
}
