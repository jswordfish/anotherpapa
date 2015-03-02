package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CollectionId;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

@Entity
@NamedQueries({
	@NamedQuery(name="BranchMst.getBranchMst", 
			query="SELECT b FROM BranchMst b WHERE b.branchCode=:branchCode AND b.tenantId=:tenantId AND b.isActive=true")
})
public class BranchMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(length = 20, nullable = true)
	private String branchCode = "";

	@Column(length = 100, nullable = true)
	private String branchName = "";

	@Column(length = 30, nullable = true)
	private String branchTypeCode = ""; // from Lookup - HO, ZO, RO, BO

	@Column(length = 20, nullable = true)
	private String parentBranchCode = ""; // implied Self Join

	// @OneToMany(mappedBy = "branchMst", cascade = CascadeType.ALL)
	// private Collection<UserBranchMap> userBranchMap = new
	// ArrayList<UserBranchMap>();

	@Column(length = 100, nullable = true)
	private String address1 = "";
	@Column(length = 100, nullable = true)
	private String address2 = "";
	@Column(length = 100, nullable = true)
	private String address3 = "";
	@Column(length = 30, nullable = true)
	private String villageCode = "";
	@Column(length = 30, nullable = true)
	private String municipalityCode = "";
	@Column(length = 30, nullable = true)
	private String districtCode = "";
	@Column(length = 30, nullable = true)
	private String stateCode = "";
	@Column(length = 10, nullable = true)
	private String countryCode = "";
	@Column(length = 10, nullable = true)
	private String postalCode = "";

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "Branch_Product", joinColumns = { @JoinColumn(name = "branchId") }, inverseJoinColumns = { @JoinColumn(name = "productId") })
	private List<ProductMst> products = new ArrayList<ProductMst>();

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "Branch_Module", joinColumns = { @JoinColumn(name = "branchId") }, inverseJoinColumns = { @JoinColumn(name = "moduleId") })
	private List<ModuleMst> modules = new ArrayList<ModuleMst>();

	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER,mappedBy = "branchMst")
	private List<BatchMst> batches = new ArrayList<BatchMst>();

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER,mappedBy = "branches")
	private List<AuthMatrix> authMatrix = new ArrayList<AuthMatrix>();

	@Column(length = 30, nullable = true)
	private String branchRefCode = "";

	@ElementCollection(fetch = FetchType.EAGER)
	@JoinTable(name = "BRANCH_ADDRESS", joinColumns = @JoinColumn(name = "BRANCH_ID"))
	@GenericGenerator(name = "hilo-gen", strategy = "hilo")
	@CollectionId(columns = { @Column(name = "Id") }, generator = "hilo-gen", type = @Type(type = "long"))
	private Collection<Address> branchAddresses = new ArrayList<Address>();

	@Column(length = 100, nullable = true)
	private String contactPerson = "";

	@Column(length = 30, nullable = true)
	private String faxNumber = "";

	@Column(length = 30, nullable = true)
	private String tele1 = "";

	@Column(length = 30, nullable = true)
	private String tele2 = "";

	@Column(length = 200, nullable = true)
	private String emailId = "";

	@Column(length = 20, nullable = true)
	private String branchDayFromCode = "";

	@Column(length = 20, nullable = true)
	private String branchDayToCode = "";

	@Column(length = 20, nullable = true)
	private String branchFromTime = "";

	@Column(length = 20, nullable = true)
	private String branchToTime = "";

	@Column(length = 20, nullable = true)
	private String finYearFromCode = "";

	@Column(length = 20, nullable = true)
	private String finYearToCode = "";

	@Column(length = 20, nullable = true)
	private String weeklyOff1Code = "";

	@Column(length = 20, nullable = true)
	private String weeklyOff2Code = "";

	@Column(length = 20, nullable = true)
	private String weeklyHalfOff1Code = "";

	@Column(length = 20, nullable = true)
	private String weeklyHalfOff2Code = "";

	@Column(length = 20, nullable = true)
	private String nonWorkingHalfOffs = ""; // comma separated values: 1,2,3,4,5

	@Column(length = 10, nullable = true)
	private String baseCurrency = ""; // Reference: Currency Master

	@Column(length = 30, nullable = true)
	private String ipNo = "";

	@Column(length = 30, nullable = true)
	private String clusterNo = "";

	@Column(nullable = true)
	private Boolean isActive = true;

	@Column(nullable = true, length = 50)
	private String authStatus = "";

	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getBranchTypeCode() {
		return branchTypeCode;
	}

	public void setBranchTypeCode(String branchTypeCode) {
		this.branchTypeCode = branchTypeCode;
	}

	public String getParentBranchCode() {
		return parentBranchCode;
	}

	public void setParentBranchCode(String parentBranchCode) {
		this.parentBranchCode = parentBranchCode;
	}

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

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public String getVillageCode() {
		return villageCode;
	}

	public void setVillageCode(String villageCode) {
		this.villageCode = villageCode;
	}

	public String getMunicipalityCode() {
		return municipalityCode;
	}

	public void setMunicipalityCode(String municipalityCode) {
		this.municipalityCode = municipalityCode;
	}

	public String getDistrictCode() {
		return districtCode;
	}

	public void setDistrictCode(String districtCode) {
		this.districtCode = districtCode;
	}

	public String getStateCode() {
		return stateCode;
	}

	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}

	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	
	public List<ProductMst> getProducts() {
		return products;
	}

	public void setProducts(List<ProductMst> products) {
		this.products = products;
	}

	public List<ModuleMst> getModules() {
		return modules;
	}

	public void setModules(List<ModuleMst> modules) {
		this.modules = modules;
	}

	public List<BatchMst> getBatches() {
		return batches;
	}

	public void setBatches(List<BatchMst> batches) {
		this.batches = batches;
	}

	public List<AuthMatrix> getAuthMatrix() {
		return authMatrix;
	}

	public void setAuthMatrix(List<AuthMatrix> authMatrix) {
		this.authMatrix = authMatrix;
	}

	public String getBranchRefCode() {
		return branchRefCode;
	}

	public void setBranchRefCode(String branchRefCode) {
		this.branchRefCode = branchRefCode;
	}

	public Collection<Address> getBranchAddresses() {
		return branchAddresses;
	}

	public void setBranchAddresses(Collection<Address> branchAddresses) {
		this.branchAddresses = branchAddresses;
	}

	public String getContactPerson() {
		return contactPerson;
	}

	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}

	public String getFaxNumber() {
		return faxNumber;
	}

	public void setFaxNumber(String faxNumber) {
		this.faxNumber = faxNumber;
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

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getBranchDayFromCode() {
		return branchDayFromCode;
	}

	public void setBranchDayFromCode(String branchDayFromCode) {
		this.branchDayFromCode = branchDayFromCode;
	}

	public String getBranchDayToCode() {
		return branchDayToCode;
	}

	public void setBranchDayToCode(String branchDayToCode) {
		this.branchDayToCode = branchDayToCode;
	}

	public String getBranchFromTime() {
		return branchFromTime;
	}

	public void setBranchFromTime(String branchFromTime) {
		this.branchFromTime = branchFromTime;
	}

	public String getBranchToTime() {
		return branchToTime;
	}

	public void setBranchToTime(String branchToTime) {
		this.branchToTime = branchToTime;
	}

	public String getFinYearFromCode() {
		return finYearFromCode;
	}

	public void setFinYearFromCode(String finYearFromCode) {
		this.finYearFromCode = finYearFromCode;
	}

	public String getFinYearToCode() {
		return finYearToCode;
	}

	public void setFinYearToCode(String finYearToCode) {
		this.finYearToCode = finYearToCode;
	}

	public String getWeeklyOff1Code() {
		return weeklyOff1Code;
	}

	public void setWeeklyOff1Code(String weeklyOff1Code) {
		this.weeklyOff1Code = weeklyOff1Code;
	}

	public String getWeeklyOff2Code() {
		return weeklyOff2Code;
	}

	public void setWeeklyOff2Code(String weeklyOff2Code) {
		this.weeklyOff2Code = weeklyOff2Code;
	}

	public String getWeeklyHalfOff1Code() {
		return weeklyHalfOff1Code;
	}

	public void setWeeklyHalfOff1Code(String weeklyHalfOff1Code) {
		this.weeklyHalfOff1Code = weeklyHalfOff1Code;
	}

	public String getWeeklyHalfOff2Code() {
		return weeklyHalfOff2Code;
	}

	public void setWeeklyHalfOff2Code(String weeklyHalfOff2Code) {
		this.weeklyHalfOff2Code = weeklyHalfOff2Code;
	}

	public String getNonWorkingHalfOffs() {
		return nonWorkingHalfOffs;
	}

	public void setNonWorkingHalfOffs(String nonWorkingHalfOffs) {
		this.nonWorkingHalfOffs = nonWorkingHalfOffs;
	}

	public String getBaseCurrency() {
		return baseCurrency;
	}

	public void setBaseCurrency(String baseCurrency) {
		this.baseCurrency = baseCurrency;
	}

	public String getIpNo() {
		return ipNo;
	}

	public void setIpNo(String ipNo) {
		this.ipNo = ipNo;
	}

	public String getClusterNo() {
		return clusterNo;
	}

	public void setClusterNo(String clusterNo) {
		this.clusterNo = clusterNo;
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