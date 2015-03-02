package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import org.hibernate.annotations.CollectionId;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

@Entity
public class AccountMgmtMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true)
	private Boolean isActive = true;

	@ManyToMany
	@JoinTable(name = "Account_ProductMst", joinColumns = { @JoinColumn(name = "accountId") }, inverseJoinColumns = { @JoinColumn(name = "productId") })
	private Collection<ProductMst> product = new ArrayList<ProductMst>();

	@ManyToMany
	@JoinTable(name = "Account_Currency", joinColumns = { @JoinColumn(name = "accountId") }, inverseJoinColumns = { @JoinColumn(name = "currencyId") })
	private Collection<CurrencyMst> currency = new ArrayList<CurrencyMst>();
	/*
	 * private Collection<MemberMst> customer = new ArrayList<MemberMst>();
	 */
	@Column(nullable = true)
	private String address = "";
	@Column(nullable = true)
	private String modeOfOperation = "";

	@Column(nullable = true)
	private String telephoneCode = "";
	@Column(nullable = true)
	private String telephoneNo = "";
	@Column(nullable = true)
	private String accountType = "";
	@Column(nullable = true)
	private String accountStatus = "";
	@Column(nullable = true)
	private String freezeType = "";
	@Column(nullable = true)
	private String reason = "";
	@Column(nullable = true)
	private String additionalInformation1 = "";

	@Column(nullable = true)
	private String additionalInformation2 = "";
	@Column(nullable = true)
	private String nameOfHolder = "";
	@Column(nullable = true)
	private String holders = "";
	@Column(nullable = true)
	private String holderTelephoneCode = "";
	@Column(nullable = true)
	private String holderTelephoneNo = "";
	@Column(nullable = true)
	private String eMail = "";
	@Column(nullable = true)
	private Date holderDateOfBirth;
	@Column(nullable = true)
	private Integer noOfHolders = 0;
	@Column(nullable = true)
	private Boolean gender = false;
	@Column(nullable = true)
	private String holderAddress="";
	@Column(nullable = true)
	private String dateOfNomination = "";
	// private Collection<AccountNominee> relationshipWithNominee = new
	// ArrayList<AccountNominee>();
	@Column(nullable = true)
	private String nameOfNominee = "";
	@Column(nullable = true)
	private String AddressOfNominee = "";
	/*
	 * @ManyToMany(cascade = CascadeType.ALL) private Collection<Address>
	 * addresses=new ArrayList<Address>();
	 */

	@ElementCollection
	@JoinTable(name = "ACCOUNT_ADDRESS", joinColumns = @JoinColumn(name = "ACCOUNT_ID"))
	@GenericGenerator(name = "hilo-gen", strategy = "hilo")
	@CollectionId(columns = { @Column(name = "Id") }, generator = "hilo-gen", type = @Type(type = "long"))
	private Collection<Address> accountAddresses = new ArrayList<Address>();

	/*
	 * private Collection<MunicipalityMst> muncipality = new
	 * ArrayList<MunicipalityMst>(); private Collection<DistrictMst>
	 * district_City = new ArrayList<DistrictMst>(); private
	 * Collection<StateMst> state = new ArrayList<StateMst>(); private
	 * Collection<CountryMst> country = new ArrayList<CountryMst>(); private
	 * Integer pincode;
	 */
	private String nomineeTelephoneCode = "";
	private String nomineeTelephoneNo = "";
	private String nomineeEMail = "";
	private Date nomineeDateOfBirth;
	private Boolean isNomineeMinor = false;
	private String minorType = "";
	private Integer percentageShare = 0;
	private String guardianOfMinorNominee = "";
	private String remarks = "";

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Collection<ProductMst> getProduct() {
		return product;
	}

	public void setProduct(Collection<ProductMst> product) {
		this.product = product;
	}

	public Collection<CurrencyMst> getCurrency() {
		return currency;
	}

	public void setCurrency(Collection<CurrencyMst> currency) {
		this.currency = currency;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	/*
	 * public Collection<ProductMst> getProduct() { return product; }
	 * 
	 * public void setProduct(Collection<ProductMst> product) { this.product =
	 * product; }
	 * 
	 * public Collection<MemberMst> getCustomer() { return customer; }
	 * 
	 * public void setCustomer(Collection<MemberMst> customer) { this.customer =
	 * customer; }
	 * 
	 * public Collection<CurrencyMst> getCurrency() { return currency; }
	 * 
	 * public void setCurrency(Collection<CurrencyMst> currency) { this.currency
	 * = currency; }
	 */

	/*
	 * public String getAddress() { return Address; }
	 * 
	 * public void setAddress(String address) { Address = address; }
	 */

	public String getModeOfOperation() {
		return modeOfOperation;
	}

	public void setModeOfOperation(String modeOfOperation) {
		this.modeOfOperation = modeOfOperation;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getAccountStatus() {
		return accountStatus;
	}

	public void setAccountStatus(String accountStatus) {
		this.accountStatus = accountStatus;
	}

	public String getFreezeType() {
		return freezeType;
	}

	public void setFreezeType(String freezeType) {
		this.freezeType = freezeType;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getAdditionalInformation1() {
		return additionalInformation1;
	}

	public void setAdditionalInformation1(String additionalInformation1) {
		this.additionalInformation1 = additionalInformation1;
	}

	public String getAdditionalInformation2() {
		return additionalInformation2;
	}

	public void setAdditionalInformation2(String additionalInformation2) {
		this.additionalInformation2 = additionalInformation2;
	}

	public String getNameOfHolder() {
		return nameOfHolder;
	}

	public void setNameOfHolder(String nameOfHolder) {
		this.nameOfHolder = nameOfHolder;
	}

	public String getHolders() {
		return holders;
	}

	public void setHolders(String holders) {
		this.holders = holders;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public Date getHolderDateOfBirth() {
		return holderDateOfBirth;
	}

	public void setHolderDateOfBirth(Date holderDateOfBirth) {
		this.holderDateOfBirth = holderDateOfBirth;
	}

	public Integer getNoOfHolders() {
		return noOfHolders;
	}

	public void setNoOfHolders(Integer noOfHolders) {
		this.noOfHolders = noOfHolders;
	}

	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

	public String getHolderAddress() {
		return holderAddress;
	}

	public void setHolderAddress(String holderAddress) {
		this.holderAddress = holderAddress;
	}

	/*
	 * public Collection<AccountNominee> getRelationshipWithNominee() { return
	 * relationshipWithNominee; }
	 * 
	 * public void setRelationshipWithNominee( Collection<AccountNominee>
	 * relationshipWithNominee) { this.relationshipWithNominee =
	 * relationshipWithNominee; }
	 */
	public String getNameOfNominee() {
		return nameOfNominee;
	}

	public void setNameOfNominee(String nameOfNominee) {
		this.nameOfNominee = nameOfNominee;
	}

	public String getDateOfNomination() {
		return dateOfNomination;
	}

	public void setDateOfNomination(String dateOfNomination) {
		this.dateOfNomination = dateOfNomination;
	}

	public String getAddressOfNominee() {
		return AddressOfNominee;
	}

	public void setAddressOfNominee(String addressOfNominee) {
		AddressOfNominee = addressOfNominee;
	}

	/*
	 * public Collection<VillageMst> getVillage() { return village; }
	 * 
	 * public void setVillage(Collection<VillageMst> village) { this.village =
	 * village; }
	 * 
	 * public Collection<MunicipalityMst> getMuncipality() { return muncipality;
	 * }
	 * 
	 * public void setMuncipality(Collection<MunicipalityMst> muncipality) {
	 * this.muncipality = muncipality; }
	 * 
	 * public Collection<DistrictMst> getDistrict_City() { return district_City;
	 * }
	 * 
	 * public void setDistrict_City(Collection<DistrictMst> district_City) {
	 * this.district_City = district_City; }
	 * 
	 * public Collection<StateMst> getState() { return state; }
	 * 
	 * public void setState(Collection<StateMst> state) { this.state = state; }
	 * 
	 * public Collection<CountryMst> getCountry() { return country; }
	 * 
	 * public void setCountry(Collection<CountryMst> country) { this.country =
	 * country; }
	 * 
	 * public Integer getPincode() { return pincode; }
	 * 
	 * public void setPincode(Integer pincode) { this.pincode = pincode; }
	 */

	public String getNomineeEMail() {
		return nomineeEMail;
	}

	public String getTelephoneCode() {
		return telephoneCode;
	}

	public void setTelephoneCode(String telephoneCode) {
		this.telephoneCode = telephoneCode;
	}

	public String getTelephoneNo() {
		return telephoneNo;
	}

	public void setTelephoneNo(String telephoneNo) {
		this.telephoneNo = telephoneNo;
	}

	public String getHolderTelephoneCode() {
		return holderTelephoneCode;
	}

	public void setHolderTelephoneCode(String holderTelephoneCode) {
		this.holderTelephoneCode = holderTelephoneCode;
	}

	public Collection<Address> getAccountAddresses() {
		return accountAddresses;
	}

	public void setAccountAddresses(Collection<Address> accountAddresses) {
		this.accountAddresses = accountAddresses;
	}

	public String getHolderTelephoneNo() {
		return holderTelephoneNo;
	}

	public void setHolderTelephoneNo(String holderTelephoneNo) {
		this.holderTelephoneNo = holderTelephoneNo;
	}

	public String getNomineeTelephoneCode() {
		return nomineeTelephoneCode;
	}

	public void setNomineeTelephoneCode(String nomineeTelephoneCode) {
		this.nomineeTelephoneCode = nomineeTelephoneCode;
	}

	public String getNomineeTelephoneNo() {
		return nomineeTelephoneNo;
	}

	public void setNomineeTelephoneNo(String nomineeTelephoneNo) {
		this.nomineeTelephoneNo = nomineeTelephoneNo;
	}

	public void setNomineeEMail(String nomineeEMail) {
		this.nomineeEMail = nomineeEMail;
	}

	public Date getNomineeDateOfBirth() {
		return nomineeDateOfBirth;
	}

	public void setNomineeDateOfBirth(Date nomineeDateOfBirth) {
		this.nomineeDateOfBirth = nomineeDateOfBirth;
	}

	public Boolean getIsNomineeMinor() {
		return isNomineeMinor;
	}

	public void setIsNomineeMinor(Boolean isNomineeMinor) {
		this.isNomineeMinor = isNomineeMinor;
	}

	public String getMinorType() {
		return minorType;
	}

	public void setMinorType(String minorType) {
		this.minorType = minorType;
	}

	public Integer getPercentageShare() {
		return percentageShare;
	}

	public void setPercentageShare(Integer percentageShare) {
		this.percentageShare = percentageShare;
	}

	public String getGuardianOfMinorNominee() {
		return guardianOfMinorNominee;
	}

	public void setGuardianOfMinorNominee(String guardianOfMinorNominee) {
		this.guardianOfMinorNominee = guardianOfMinorNominee;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

}
