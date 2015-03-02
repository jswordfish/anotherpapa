package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;

@Entity
public class LoanTypePurposeMap extends Base {

	@ManyToMany(cascade = CascadeType.ALL)
	private Collection<Address> addresses = new ArrayList<Address>();
	@Column(nullable = true)
	private Integer vendorCode = 0;
	@Column(length = 200, nullable = true)
	private String vendorName = "";
	@Column(length = 200, nullable = true)
	private String vendorType = "";
	@Column(nullable = true)
	private String ref = "";
	/*
	 * @Column(nullable=true) private String address;
	 * 
	 * @Column(nullable=true) private String village;
	 * 
	 * @Column(nullable=true) private String municipality;
	 * 
	 * @Column(nullable=true) private String districtCity;
	 * 
	 * @Column(nullable=true) private String state;
	 * 
	 * @Column(nullable=true) private String country;
	 */
	/*
	 * @Column(nullable=true) private Integer pincode;
	 */
	@Column(nullable = true)
	private String contactPerson = "";
	@Column(nullable = true)
	private Boolean gender = false;
	@Column(nullable = true)
	private String tele1 = "";
	@Column(nullable = true)
	private String tele2 = "";
	@Column(nullable = true)
	private String email = "";

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getVendorCode() {
		return vendorCode;
	}

	public void setVendorCode(Integer vendorCode) {
		this.vendorCode = vendorCode;
	}

	public String getVendorName() {
		return vendorName;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

	public String getVendorType() {
		return vendorType;
	}

	public void setVendorType(String vendorType) {
		this.vendorType = vendorType;
	}

	public String getRef() {
		return ref;
	}

	public void setRef(String ref) {
		this.ref = ref;
	}

	/*
	 * public String getAddress() { return address; } public void
	 * setAddress(String address) { this.address = address; } public String
	 * getVillage() { return village; } public void setVillage(String village) {
	 * this.village = village; } public String getMunicipality() { return
	 * municipality; } public void setMunicipality(String municipality) {
	 * this.municipality = municipality; } public String getDistrictCity() {
	 * return districtCity; } public void setDistrictCity(String districtCity) {
	 * this.districtCity = districtCity; } public String getState() { return
	 * state; } public void setState(String state) { this.state = state; }
	 * public String getCountry() { return country; } public void
	 * setCountry(String country) { this.country = country; }
	 */
	/*
	 * public Integer getPincode() { return pincode; } public void
	 * setPincode(Integer pincode) { this.pincode = pincode; }
	 */
	public String getContactPerson() {
		return contactPerson;
	}

	public Collection<Address> getAddresses() {

		return addresses;
	}

	public void setAddresses(Collection<Address> addresses) {

		this.addresses = addresses;
		System.out.println("LoanTypePurposeMap.setAddresses() " + addresses);
	}

	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}

	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTele1() {
		return tele1;
	}

	public void setTele1(String tele1) {
		this.tele1 = tele1;
	}

	public String getTele2() {
		return tele2;
	}

	public void setTele2(String tele2) {
		this.tele2 = tele2;
	}

}
