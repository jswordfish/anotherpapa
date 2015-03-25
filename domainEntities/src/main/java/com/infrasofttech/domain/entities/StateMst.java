package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
public class StateMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true, length = 20)
	private String stateCode = "";

	@Column(nullable = true, length = 50)
	private String stateName = "";

	@OneToMany(mappedBy = "stateMst", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<DistrictMst> districts = new ArrayList<DistrictMst>();

	@ManyToOne( cascade = CascadeType.ALL)
	@JoinColumn(name = "fkCountryPk")
	@LazyCollection(LazyCollectionOption.FALSE)
	private CountryMst countryMst;

	@Column(nullable = true)
	private Boolean isActive = true;

	public String getStateCode() {
		return stateCode;
	}

	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public Collection<DistrictMst> getDistricts() {
		return districts;
	}

	public void setDistricts(Collection<DistrictMst> districts) {
		this.districts = districts;
	}

	public CountryMst getCountryMst() {
		return countryMst;
	}

	public void setCountryMst(CountryMst countryMst) {
		this.countryMst = countryMst;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
}
