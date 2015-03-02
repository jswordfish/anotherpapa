/**
 * @author Mahesh Laddha
 */
package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import com.infrasofttech.utils.AddressType;

@Embeddable
public class Address {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(length = 100, nullable = true, updatable = true)
	private String address1 = "";

	@Column(length = 100, nullable = true, updatable = true)
	private String address2 = "";

	@Column(length = 100, nullable = true, updatable = true)
	private String address3 = "";

	@Column(nullable = true, updatable = true)
	private Long villageId = 0L;

	@Column(nullable = true, updatable = true)
	private Long municipalityId = 0L;

	@Column(nullable = true, updatable = true)
	private Long cityId = 0L;

	@Column(nullable = true, updatable = true)
	private Long stateId = 0L;

	@Column(nullable = true, updatable = true)
	private Long countryId = 0L;

	@Column(length = 20, nullable = true)
	private String pinCode = "";

	@Column(length = 20, nullable = true, updatable = true)
	private String addressType = ""; // must come from lookup values

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress3() {
		return address3;
	}

	public Long getVillageId() {
		return villageId;
	}

	public void setVillageId(Long villageId) {
		this.villageId = villageId;
	}

	public Long getMunicipalityId() {
		return municipalityId;
	}

	public void setMunicipalityId(Long municipalityId) {
		this.municipalityId = municipalityId;
	}

	public Long getCityId() {
		return cityId;
	}

	public void setCityId(Long cityId) {
		this.cityId = cityId;
	}

	public Long getStateId() {
		return stateId;
	}

	public void setStateId(Long stateId) {
		this.stateId = stateId;
	}

	public Long getCountryId() {
		return countryId;
	}

	public void setCountryId(Long countryId) {
		this.countryId = countryId;
	}

	public String getPinCode() {
		return pinCode;
	}

	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}

	public String getAddressType() {
		return addressType;
	}

	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

}
