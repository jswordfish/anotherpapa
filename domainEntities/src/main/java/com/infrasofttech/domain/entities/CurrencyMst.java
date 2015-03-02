package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
public class CurrencyMst extends Base {

	private static final long serialVersionUID = 1L;

	@Column(nullable = true, length = 10)
	private String currencyISOCode = "";

	@Column(nullable = true, length = 50)
	private String currencyName = "";

	@OneToOne(cascade = CascadeType.ALL)
	private CountryMst countryMst;

	@ManyToMany(mappedBy = "currencies")
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<AuthMatrix> authMatrix = new ArrayList<AuthMatrix>();

	@Column(nullable = true, length = 20)
	private String majorUnit = "";

	@Column(nullable = true, length = 20)
	private String minorUnit = "";

	@Column(nullable = true, precision = 9)
	private double unitConversion = 0D;

	@Column(nullable = true)
	private Integer minorUnitDecimals = 0;

	@Column(nullable = true)
	private Boolean isActive = true;

	public String getCurrencyISOCode() {
		return currencyISOCode;
	}

	public void setCurrencyISOCode(String currencyISOCode) {
		this.currencyISOCode = currencyISOCode;
	}

	public String getCurrencyName() {
		return currencyName;
	}

	public void setCurrencyName(String currencyName) {
		this.currencyName = currencyName;
	}

	public CountryMst getCountryMst() {
		return countryMst;
	}

	public void setCountryMst(CountryMst countryMst) {
		this.countryMst = countryMst;
	}

	public Collection<AuthMatrix> getAuthMatrix() {
		return authMatrix;
	}

	public void setAuthMatrix(Collection<AuthMatrix> authMatrix) {
		this.authMatrix = authMatrix;
	}

	public String getMajorUnit() {
		return majorUnit;
	}

	public void setMajorUnit(String majorUnit) {
		this.majorUnit = majorUnit;
	}

	public String getMinorUnit() {
		return minorUnit;
	}

	public void setMinorUnit(String minorUnit) {
		this.minorUnit = minorUnit;
	}

	public double getUnitConversion() {
		return unitConversion;
	}

	public void setUnitConversion(double unitConversion) {
		this.unitConversion = unitConversion;
	}

	public Integer getMinorUnitDecimals() {
		return minorUnitDecimals;
	}

	public void setMinorUnitDecimals(Integer minorUnitDecimals) {
		this.minorUnitDecimals = minorUnitDecimals;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
}
