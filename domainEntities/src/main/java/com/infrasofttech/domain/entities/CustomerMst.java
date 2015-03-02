package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.CollectionId;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

@Entity
@NamedQueries({
		@NamedQuery(name = "CustomerMst.getCustomerList", query = "SELECT c FROM CustomerMst c WHERE c.tenantId=:tenantId"),
		@NamedQuery(name = "CustomerMst.getCustomerByTenantIdAndCustomerCode", query = "SELECT c FROM CustomerMst c WHERE c.tenantId=:tenantId AND c.customerCode=:customerCode") })
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "tenantId",
		"customerCode" }))
public class CustomerMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column
	private Long code;

	@Column(nullable = false, length = 30)
	private String customerCode = "";

	@Column(nullable = true, length = 30)
	private String customerCreationBranch = "";
	@Column(nullable = true, length = 30)
	private String baseTenantCode = "";
	@Column(nullable = true, length = 30)
	private String customerTypeCode = ""; // from Lookup - Individual, Corporate
	@Column(nullable = true, length = 10)
	private String customerSalutation = "";
	// For Corporate Customers, their name can be longer then fName
	@Column(nullable = true, length = 100)
	private String customerFName = "";
	@Column(nullable = true, length = 50)
	private String customerMName = "";
	@Column(nullable = true, length = 50)
	private String customerLName = "";
	@Temporal(TemporalType.DATE)
	private Date customerDOB;
	@Temporal(TemporalType.DATE)
	private Date customerSince;
	@Column(nullable = true)
	private String relationshipOfficer = "";
	@Column(nullable = true, length = 30)
	private String KYCType = ""; // from Lookup
	@Column(nullable = true, length = 30)
	private String HNWCategory = "";
	@Column(nullable = true)
	private String customerGender = ""; // from Lookup
	@Column(nullable = true)
	private String custMaritalStatus = ""; // from Lookup
	@Column(nullable = true)
	private Integer noOfChildren = 0;
	@Column(nullable = true, length = 30)
	private String nationality = ""; // from Lookup
	@Column(nullable = true, length = 30)
	private String fatherSpouseName = "";
	@Column(nullable = true, length = 20)
	private String customerRegNo = "";
	@Column(nullable = true, length = 50)
	private String custAdditionalInfo = "";
	@Column(nullable = true)
	private Boolean transactionFreeze = false;
	@Column(nullable = true, length = 30)
	private String transactionFreezeReason = "";
	@Column(nullable = true, length = 30)
	private String specialInstructions = "";
	@Column(nullable = true, length = 30)
	private String NPARating = "";
	@Column(nullable = true, length = 30)
	private String NPAReason = "";
	// @ManyToOne
	// @JoinColumn(name = "fkBranchPk", nullable = true, updatable = true)
	// private BranchMst branchMst;
	@Column(nullable = true, length = 20)
	private String baseBranchCode = "";

	@Column(nullable = true)
	private Double customerAmtLimit = 0D;
	
	@Column(nullable = true)
	private String customerAmtCurrency = "INR";

	public String getCustomerAmtCurrency() {
		return customerAmtCurrency;
	}

	public void setCustomerAmtCurrency(String customerAmtCurrency) {
		this.customerAmtCurrency = customerAmtCurrency;
	}

	@Embedded
	private CustomerContact customerContact = new CustomerContact();

	@OneToMany(cascade = CascadeType.ALL)
	private Collection<CustomerBusinessDtls> customerBusinessDtls = new ArrayList<CustomerBusinessDtls>();

	@OneToMany(cascade = CascadeType.ALL)
	private Collection<CustomerEmploymentDtls> customerEmploymentDtls = new ArrayList<CustomerEmploymentDtls>();

	@OneToMany(cascade = CascadeType.ALL)
	private Collection<CustomerAsset> customerAssets = new ArrayList<CustomerAsset>();

	@OneToMany(cascade = CascadeType.ALL)
	private Collection<CustomerKYCDocs> customerKYCDocs = new ArrayList<CustomerKYCDocs>();

	@OneToMany(cascade = CascadeType.ALL)
	private Collection<CustomerKYCFamily> customerKYCFamilies = new ArrayList<CustomerKYCFamily>();

	@ElementCollection
	@JoinTable(name = "CUSTOMER_ADDRESS", joinColumns = @JoinColumn(name = "CUSTOMER_ID"))
	@GenericGenerator(name = "hilo-gen", strategy = "hilo")
	@CollectionId(columns = { @Column(name = "Id") }, generator = "hilo-gen", type = @Type(type = "long"))
	private Collection<Address> customerAddresses = new ArrayList<Address>();

	@Column(nullable = true, length = 30)
	private String customerCaste = ""; // from Lookup

	@Column(nullable = true, length = 30)
	private String customerCasteCategory = ""; // from Lookup

	// from lookup
	@Column(nullable = true, length = 30)
	private String customerCategory = "";

	// from lookup
	@Column(nullable = true, length = 30)
	private String memberType = "";

	@Column(nullable = true, length = 30)
	private String memberNumber = "";

	@Column(nullable = true)
	private Boolean residentYN = false;

	// from lookup
	@Column(nullable = true, length = 30)
	private String residentCountry = "";

	// from lookup
	@Column(nullable = true, length = 30)
	private String residentialStatus = "";

	// NRI/FOREIGNER DOC DETAILS
	@Column(nullable = true, length = 30)
	private String passportNumber = "";

	// from lookup
	@Column(nullable = true, length = 30)
	private String issuedByCountry = "";

	@Column(nullable = true, length = 30)
	private String visaType = "";

	@Column(nullable = true, length = 30)
	private String visaNumber = "";

	@Temporal(TemporalType.DATE)
	private Date passportIssuedDate;

	@Temporal(TemporalType.DATE)
	private Date passportExpiryDate;

	@Temporal(TemporalType.DATE)
	private Date visaIssuedDate;

	// ADHOC DETAILS
	@Column(nullable = true, length = 30)
	private String qualifications = "";
	@Column(nullable = true, length = 30)
	private String religion = "";
	@Column(nullable = true, length = 30)
	private String bloodGroup = "";
	@Column(nullable = true, length = 30)
	private Integer numberOfDependants = 0;
	@Column(nullable = true)
	private Boolean introducerYN = false;
	@Column(nullable = true, length = 30)
	// from lookup
	private String residenceType = "";
	@Column(nullable = true, length = 30)
	private String introducerNumber = "";
	@Column(nullable = true, length = 40)
	private String AMLRating = "";
	@Column(nullable = true)
	private Boolean PEPYN = false;
	// TAX DETAILS
	@Column(nullable = true)
	private Boolean TDSYN = false;
	@Column(nullable = true, length = 30)
	private String TDSPercentage = "";
	@Column(nullable = true, length = 30)
	private String TDSReason = "";

	@Column(nullable = true)
	private Boolean isActive = true;

	@Column(nullable = true, length = 30)
	private String authStatus;
	
	@Lob
	private byte[] signature;
	
	@Lob
	private byte[] photo;

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getCustomerCreationBranch() {
		return customerCreationBranch;
	}

	public void setCustomerCreationBranch(String customerCreationBranch) {
		this.customerCreationBranch = customerCreationBranch;
	}

	public String getBaseTenantCode() {
		return baseTenantCode;
	}

	public void setBaseTenantCode(String baseTenantCode) {
		this.baseTenantCode = baseTenantCode;
	}

	public String getCustomerTypeCode() {
		return customerTypeCode;
	}

	public void setCustomerTypeCode(String customerTypeCode) {
		this.customerTypeCode = customerTypeCode;
	}

	public String getCustomerSalutation() {
		return customerSalutation;
	}

	public void setCustomerSalutation(String customerSalutation) {
		this.customerSalutation = customerSalutation;
	}

	public String getCustomerFName() {
		return customerFName;
	}

	public void setCustomerFName(String customerFName) {
		this.customerFName = customerFName;
	}

	public String getCustomerMName() {
		return customerMName;
	}

	public void setCustomerMName(String customerMName) {
		this.customerMName = customerMName;
	}

	public String getCustomerLName() {
		return customerLName;
	}

	public void setCustomerLName(String customerLName) {
		this.customerLName = customerLName;
	}

	public Date getCustomerDOB() {
		return customerDOB;
	}

	public void setCustomerDOB(Date customerDOB) {
		this.customerDOB = customerDOB;
	}

	public Date getCustomerSince() {
		return customerSince;
	}

	public void setCustomerSince(Date customerSince) {
		this.customerSince = customerSince;
	}

	public String getRelationshipOfficer() {
		return relationshipOfficer;
	}

	public void setRelationshipOfficer(String relationshipOfficer) {
		this.relationshipOfficer = relationshipOfficer;
	}

	public String getKYCType() {
		return KYCType;
	}

	public void setKYCType(String kYCType) {
		KYCType = kYCType;
	}

	public String getHNWCategory() {
		return HNWCategory;
	}

	public void setHNWCategory(String hNWCategory) {
		HNWCategory = hNWCategory;
	}

	public String getCustomerGender() {
		return customerGender;
	}

	public void setCustomerGender(String customerGender) {
		this.customerGender = customerGender;
	}

	public String getCustMaritalStatus() {
		return custMaritalStatus;
	}

	public void setCustMaritalStatus(String custMaritalStatus) {
		this.custMaritalStatus = custMaritalStatus;
	}

	public Integer getNoOfChildren() {
		return noOfChildren;
	}

	public void setNoOfChildren(Integer noOfChildren) {
		this.noOfChildren = noOfChildren;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getFatherSpouseName() {
		return fatherSpouseName;
	}

	public void setFatherSpouseName(String fatherSpouseName) {
		this.fatherSpouseName = fatherSpouseName;
	}

	public String getCustomerRegNo() {
		return customerRegNo;
	}

	public void setCustomerRegNo(String customerRegNo) {
		this.customerRegNo = customerRegNo;
	}

	public String getCustAdditionalInfo() {
		return custAdditionalInfo;
	}

	public void setCustAdditionalInfo(String custAdditionalInfo) {
		this.custAdditionalInfo = custAdditionalInfo;
	}

	public Boolean getTransactionFreeze() {
		return transactionFreeze;
	}

	public void setTransactionFreeze(Boolean transactionFreeze) {
		this.transactionFreeze = transactionFreeze;
	}

	public String getTransactionFreezeReason() {
		return transactionFreezeReason;
	}

	public void setTransactionFreezeReason(String transactionFreezeReason) {
		this.transactionFreezeReason = transactionFreezeReason;
	}

	public String getSpecialInstructions() {
		return specialInstructions;
	}

	public void setSpecialInstructions(String specialInstructions) {
		this.specialInstructions = specialInstructions;
	}

	public String getNPARating() {
		return NPARating;
	}

	public void setNPARating(String nPARating) {
		NPARating = nPARating;
	}

	public String getNPAReason() {
		return NPAReason;
	}

	public void setNPAReason(String nPAReason) {
		NPAReason = nPAReason;
	}

	public String getBaseBranchCode() {
		return baseBranchCode;
	}

	public void setBaseBranchCode(String baseBranchCode) {
		this.baseBranchCode = baseBranchCode;
	}

	public Double getCustomerAmtLimit() {
		return customerAmtLimit;
	}

	public void setCustomerAmtLimit(Double customerAmtLimit) {
		this.customerAmtLimit = customerAmtLimit;
	}

	

//	public CustomerContact getCustomerContact() {
//		return customerContact;
//	}
//
//	public void setCustomerContact(CustomerContact customerContact) {
//		this.customerContact = customerContact;
//	}

	public Collection<CustomerBusinessDtls> getCustomerBusinessDtls() {
		return customerBusinessDtls;
	}

	public void setCustomerBusinessDtls(
			Collection<CustomerBusinessDtls> customerBusinessDtls) {
		this.customerBusinessDtls = customerBusinessDtls;
	}

	public Collection<CustomerEmploymentDtls> getCustomerEmploymentDtls() {
		return customerEmploymentDtls;
	}

	public void setCustomerEmploymentDtls(
			Collection<CustomerEmploymentDtls> customerEmploymentDtls) {
		this.customerEmploymentDtls = customerEmploymentDtls;
	}

	public Collection<CustomerAsset> getCustomerAssets() {
		return customerAssets;
	}

	public void setCustomerAssets(Collection<CustomerAsset> customerAssets) {
		this.customerAssets = customerAssets;
	}

	public Collection<CustomerKYCDocs> getCustomerKYCDocs() {
		return customerKYCDocs;
	}

	public void setCustomerKYCDocs(Collection<CustomerKYCDocs> customerKYCDocs) {
		this.customerKYCDocs = customerKYCDocs;
	}

	public Collection<CustomerKYCFamily> getCustomerKYCFamilies() {
		return customerKYCFamilies;
	}

	public void setCustomerKYCFamilies(
			Collection<CustomerKYCFamily> customerKYCFamilies) {
		this.customerKYCFamilies = customerKYCFamilies;
	}

	public Collection<Address> getCustomerAddresses() {
		return customerAddresses;
	}

	public void setCustomerAddresses(Collection<Address> customerAddresses) {
		this.customerAddresses = customerAddresses;
	}

	public String getCustomerCaste() {
		return customerCaste;
	}

	public void setCustomerCaste(String customerCaste) {
		this.customerCaste = customerCaste;
	}

	public String getCustomerCasteCategory() {
		return customerCasteCategory;
	}

	public void setCustomerCasteCategory(String customerCasteCategory) {
		this.customerCasteCategory = customerCasteCategory;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public String getCustomerCategory() {
		return customerCategory;
	}

	public void setCustomerCategory(String customerCategory) {
		this.customerCategory = customerCategory;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public String getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(String memberNumber) {
		this.memberNumber = memberNumber;
	}

	public Boolean getResidentYN() {
		return residentYN;
	}

	public void setResidentYN(Boolean residentYN) {
		this.residentYN = residentYN;
	}

	public String getResidentCountry() {
		return residentCountry;
	}

	public void setResidentCountry(String residentCountry) {
		this.residentCountry = residentCountry;
	}

	public String getResidentialStatus() {
		return residentialStatus;
	}

	public void setResidentialStatus(String residentialStatus) {
		this.residentialStatus = residentialStatus;
	}

	public String getPassportNumber() {
		return passportNumber;
	}

	public void setPassportNumber(String passportNumber) {
		this.passportNumber = passportNumber;
	}

	public String getIssuedByCountry() {
		return issuedByCountry;
	}

	public void setIssuedByCountry(String issuedByCountry) {
		this.issuedByCountry = issuedByCountry;
	}

	public String getVisaType() {
		return visaType;
	}

	public void setVisaType(String visaType) {
		this.visaType = visaType;
	}

	public String getVisaNumber() {
		return visaNumber;
	}

	public void setVisaNumber(String visaNumber) {
		this.visaNumber = visaNumber;
	}

	public Date getPassportIssuedDate() {
		return passportIssuedDate;
	}

	public void setPassportIssuedDate(Date passportIssuedDate) {
		this.passportIssuedDate = passportIssuedDate;
	}

	public Date getPassportExpiryDate() {
		return passportExpiryDate;
	}

	public void setPassportExpiryDate(Date passportExpiryDate) {
		this.passportExpiryDate = passportExpiryDate;
	}

	public Date getVisaIssuedDate() {
		return visaIssuedDate;
	}

	public void setVisaIssuedDate(Date visaIssuedDate) {
		this.visaIssuedDate = visaIssuedDate;
	}

	public String getQualifications() {
		return qualifications;
	}

	public void setQualifications(String qualifications) {
		this.qualifications = qualifications;
	}

	public String getReligion() {
		return religion;
	}

	public void setReligion(String religion) {
		this.religion = religion;
	}

	public String getBloodGroup() {
		return bloodGroup;
	}

	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}

	public Integer getNumberOfDependants() {
		return numberOfDependants;
	}

	public void setNumberOfDependants(Integer numberOfDependants) {
		this.numberOfDependants = numberOfDependants;
	}

	public Boolean getIntroducerYN() {
		return introducerYN;
	}

	public void setIntroducerYN(Boolean introducerYN) {
		this.introducerYN = introducerYN;
	}

	public String getResidenceType() {
		return residenceType;
	}

	public void setResidenceType(String residenceType) {
		this.residenceType = residenceType;
	}

	public String getIntroducerNumber() {
		return introducerNumber;
	}

	public void setIntroducerNumber(String introducerNumber) {
		this.introducerNumber = introducerNumber;
	}

	public String getAMLRating() {
		return AMLRating;
	}

	public void setAMLRating(String aMLRating) {
		AMLRating = aMLRating;
	}

	public Boolean getPEPYN() {
		return PEPYN;
	}

	public void setPEPYN(Boolean pEPYN) {
		PEPYN = pEPYN;
	}

	public Boolean getTDSYN() {
		return TDSYN;
	}

	public void setTDSYN(Boolean tDSYN) {
		TDSYN = tDSYN;
	}

	public String getTDSPercentage() {
		return TDSPercentage;
	}

	public void setTDSPercentage(String tDSPercentage) {
		TDSPercentage = tDSPercentage;
	}

	public String getTDSReason() {
		return TDSReason;
	}

	public void setTDSReason(String tDSReason) {
		TDSReason = tDSReason;
	}

	public Long getCode() {
		return code;
	}

	public void setCode(Long code) {
		this.code = code;
	}

	public String getAuthStatus() {
		return authStatus;
	}

	public void setAuthStatus(String authStatus) {
		this.authStatus = authStatus;
	}

	public byte[] getSignature() {
		return signature;
	}

	public void setSignature(byte[] signature) {
		this.signature = signature;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}
	
	
}
