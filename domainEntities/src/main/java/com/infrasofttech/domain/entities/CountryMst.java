package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class CountryMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true, length = 10)
	private String countryCode = ""; // ISO Code

	@Column(nullable = true, length = 50)
	private String countryName = "";

	@OneToMany(mappedBy = "countryMst", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private Collection<StateMst> states = new ArrayList<StateMst>();

	@OneToOne(mappedBy = "countryMst", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private CurrencyMst currency;

	@Column(nullable = true, length = 10)
	private String isdCode = "";

	@Column(nullable = true)
	private Boolean isActive = true;

	@Column(nullable = true, length = 20)
	private String zone = "";

	@Column(nullable = true, length = 20)
	private String region = "";

	@Column(nullable = true, length = 20)
	private Boolean gracePrdYN = false;

	@Column(nullable = true, length = 20)
	private Integer gracePrd = 0;

	@Column(nullable = true, length = 20)
	private String countryType = "";

	@Column(nullable = true, length = 20)
	private Boolean ecgcCoverYN = false;

	@Column(nullable = true, length = 20)
	private Boolean restrictedYN = false;

	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public Collection<StateMst> getStates() {
		return states;
	}

	public void setStates(Collection<StateMst> states) {
		this.states = states;
	}

	public CurrencyMst getCurrency() {
		return currency;
	}

	public void setCurrency(CurrencyMst currency) {
		this.currency = currency;
	}

	public String getIsdCode() {
		return isdCode;
	}

	public void setIsdCode(String isdCode) {
		this.isdCode = isdCode;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public Boolean getGracePrdYN() {
		return gracePrdYN;
	}

	public void setGracePrdYN(Boolean gracePrdYN) {
		this.gracePrdYN = gracePrdYN;
	}

	public Integer getGracePrd() {
		return gracePrd;
	}

	public void setGracePrd(Integer gracePrd) {
		this.gracePrd = gracePrd;
	}

	public String getCountryType() {
		return countryType;
	}

	public void setCountryType(String countryType) {
		this.countryType = countryType;
	}

	public Boolean getEcgcCoverYN() {
		return ecgcCoverYN;
	}

	public void setEcgcCoverYN(Boolean ecgcCoverYN) {
		this.ecgcCoverYN = ecgcCoverYN;
	}

	public Boolean getRestrictedYN() {
		return restrictedYN;
	}

	public void setRestrictedYN(Boolean restrictedYN) {
		this.restrictedYN = restrictedYN;
	}
}
