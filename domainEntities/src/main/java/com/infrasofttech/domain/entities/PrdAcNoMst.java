package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
@NamedQueries({
		@NamedQuery(name = "PrdAcNo.getPrdAcNo", query = "SELECT p FROM PrdAcNoMst p WHERE p.tenantId=:tenantId AND "
				+ " p.branchCode=:branchCode AND p.moduleCode=:moduleCode AND "
				+ " p.productCode=:productCode AND p.customerNumber=:customerNumber AND p.accountNumber=:accountNumber "
				+ " AND p.isActive=true"),
		@NamedQuery(name = "PrdAcNo.getDisabledPrdAcNo", query = "SELECT p FROM PrdAcNoMst p WHERE p.tenantId=:tenantId AND "
				+ " p.branchCode=:branchCode AND p.moduleCode=:moduleCode AND "
				+ " p.productCode=:productCode AND p.customerNumber=:customerNumber AND p.accountNumber=:accountNumber "
				+ " AND p.isActive=false") })
public class PrdAcNoMst extends Base {

	private static final long serialVersionUID = 5115630273638279721L;

	@Column(nullable = true, length = 20)
	private String branchCode = "";

	@Column(nullable = true, length = 20)
	private String moduleCode = "";

	@Column(nullable = true, length = 20)
	private String productCode = "";

	@Column(nullable = true, length = 20)
	private String customerNumber = "";

	@Column(nullable = true, length = 20)
	private String currencyCode = "";

	@Column(nullable = true, length = 50)
	private String accountNumber = "";

	@Column(nullable = true, length = 50)
	private String customerName = "";

	@Column(nullable = true, length = 50)
	private String hnwCustCat = "";

	@Column(nullable = true, length = 50)
	private String accountName = "";

	@Column(nullable = true, length = 50)
	private String accountName1 = "";

	@Column(nullable = true, length = 50)
	private String accountType = "";

	@Column(nullable = true, length = 50)
	private String modeOfOperation = "";

	@Column(nullable = true, length = 50)
	private String accountStatus = "";

	@Column(nullable = true, length = 50)
	private String minorType = "";

	@Column(nullable = true, length = 50)
	private String currencyCode1 = "";

	@Column(nullable = true, length = 50)
	private String freezeType = "";

	@Column(nullable = true, length = 100)
	private String reason = "";

	@Column(nullable = true, length = 50)
	private String openUser = "";

	@Column(nullable = true, length = 50)
	private String openUserDate = "";

	@Column(nullable = true, length = 50)
	private String closedUser = "";

	@Column(nullable = true, length = 50)
	private String closedUserDate = "";

	@Column(nullable = true, length = 50)
	private String memberType = "";

	@Column(nullable = true, length = 50)
	private String memberNumber = "";

	@Column(nullable = true, length = 500)
	private String reasonForMember = "";

	@Column(nullable = true, length = 100)
	private String additionalInformation1 = "";

	@Column(nullable = true, length = 100)
	private String additionalInformation2 = "";

	@Column(nullable = true, length = 50)
	private String dateOfEstablishment = "";

	@Column(nullable = true, length = 50)
	private String payingAccount = "";

	@Column(nullable = true, length = 50)
	private String drawingPowerNDM = "";

	@Column(nullable = true, length = 50)
	private String documentFileNumber = "";

	@Column(nullable = true, length = 100)
	private String holder1Name = "";
	@Column(nullable = true, length = 20)
	private String holder1Gender = "M";
	@Column(nullable = true, length = 50)
	private String holder1DOB = "";
	@Column(nullable = true, length = 50)
	private String holder1Minor = "N";

	@Column(nullable = true, length = 50)
	private String holder2Name = "";
	@Column(nullable = true, length = 50)
	private String holder2Gender = "M";
	@Column(nullable = true, length = 50)
	private String holder2DOB = "";
	@Column(nullable = true, length = 50)
	private String holder2Minor = "N";

	@Column(nullable = true, length = 50)
	private String holder3Name = "";
	@Column(nullable = true, length = 50)
	private String holder3Gender = "M";
	@Column(nullable = true, length = 50)
	private String holder3DOB = "";
	@Column(nullable = true, length = 50)
	private String holder3Minor = "N";

	@Column(nullable = true, length = 50)
	private String nominee1Name = "";
	@Column(nullable = true, length = 50)
	private String nominee1Gender = "F";
	@Column(nullable = true, length = 50)
	private String nominee1DOB = "";
	@Column(nullable = true, length = 50)
	private String nominee1Minor = "N";

	@Column(nullable = true, length = 50)
	private String nominee2Name = "";
	@Column(nullable = true, length = 50)
	private String nominee2Gender = "F";
	@Column(nullable = true, length = 50)
	private String nominee2DOB = "";
	@Column(nullable = true, length = 50)
	private String nominee2Minor = "N";

	@Column(nullable = true, length = 50)
	private String nominee3Name = "";
	@Column(nullable = true, length = 50)
	private String nominee3Gender = "F";
	@Column(nullable = true, length = 50)
	private String nominee3DOB = "";
	@Column(nullable = true, length = 50)
	private String nominee3Minor = "N";

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

	public String getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getCustomerNumber() {
		return customerNumber;
	}

	public void setCustomerNumber(String customerNumber) {
		this.customerNumber = customerNumber;
	}

	public String getCurrencyCode() {
		return currencyCode;
	}

	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getHnwCustCat() {
		return hnwCustCat;
	}

	public void setHnwCustCat(String hnwCustCat) {
		this.hnwCustCat = hnwCustCat;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getAccountName1() {
		return accountName1;
	}

	public void setAccountName1(String accountName1) {
		this.accountName1 = accountName1;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getModeOfOperation() {
		return modeOfOperation;
	}

	public void setModeOfOperation(String modeOfOperation) {
		this.modeOfOperation = modeOfOperation;
	}

	public String getAccountStatus() {
		return accountStatus;
	}

	public void setAccountStatus(String accountStatus) {
		this.accountStatus = accountStatus;
	}

	public String getMinorType() {
		return minorType;
	}

	public void setMinorType(String minorType) {
		this.minorType = minorType;
	}

	public String getCurrencyCode1() {
		return currencyCode1;
	}

	public void setCurrencyCode1(String currencyCode1) {
		this.currencyCode1 = currencyCode1;
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

	public String getOpenUser() {
		return openUser;
	}

	public void setOpenUser(String openUser) {
		this.openUser = openUser;
	}

	public String getOpenUserDate() {
		return openUserDate;
	}

	public void setOpenUserDate(String openUserDate) {
		this.openUserDate = openUserDate;
	}

	public String getClosedUser() {
		return closedUser;
	}

	public void setClosedUser(String closedUser) {
		this.closedUser = closedUser;
	}

	public String getClosedUserDate() {
		return closedUserDate;
	}

	public void setClosedUserDate(String closedUserDate) {
		this.closedUserDate = closedUserDate;
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

	public String getReasonForMember() {
		return reasonForMember;
	}

	public void setReasonForMember(String reasonForMember) {
		this.reasonForMember = reasonForMember;
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

	public String getDateOfEstablishment() {
		return dateOfEstablishment;
	}

	public void setDateOfEstablishment(String dateOfEstablishment) {
		this.dateOfEstablishment = dateOfEstablishment;
	}

	public String getPayingAccount() {
		return payingAccount;
	}

	public void setPayingAccount(String payingAccount) {
		this.payingAccount = payingAccount;
	}

	public String getDrawingPowerNDM() {
		return drawingPowerNDM;
	}

	public void setDrawingPowerNDM(String drawingPowerNDM) {
		this.drawingPowerNDM = drawingPowerNDM;
	}

	public String getDocumentFileNumber() {
		return documentFileNumber;
	}

	public void setDocumentFileNumber(String documentFileNumber) {
		this.documentFileNumber = documentFileNumber;
	}

	public String getHolder1Name() {
		return holder1Name;
	}

	public void setHolder1Name(String holder1Name) {
		this.holder1Name = holder1Name;
	}

	public String getHolder1Gender() {
		return holder1Gender;
	}

	public void setHolder1Gender(String holder1Gender) {
		this.holder1Gender = holder1Gender;
	}

	public String getHolder1DOB() {
		return holder1DOB;
	}

	public void setHolder1DOB(String holder1dob) {
		holder1DOB = holder1dob;
	}

	public String getHolder1Minor() {
		return holder1Minor;
	}

	public void setHolder1Minor(String holder1Minor) {
		this.holder1Minor = holder1Minor;
	}

	public String getHolder2Name() {
		return holder2Name;
	}

	public void setHolder2Name(String holder2Name) {
		this.holder2Name = holder2Name;
	}

	public String getHolder2Gender() {
		return holder2Gender;
	}

	public void setHolder2Gender(String holder2Gender) {
		this.holder2Gender = holder2Gender;
	}

	public String getHolder2DOB() {
		return holder2DOB;
	}

	public void setHolder2DOB(String holder2dob) {
		holder2DOB = holder2dob;
	}

	public String getHolder2Minor() {
		return holder2Minor;
	}

	public void setHolder2Minor(String holder2Minor) {
		this.holder2Minor = holder2Minor;
	}

	public String getHolder3Name() {
		return holder3Name;
	}

	public void setHolder3Name(String holder3Name) {
		this.holder3Name = holder3Name;
	}

	public String getHolder3Gender() {
		return holder3Gender;
	}

	public void setHolder3Gender(String holder3Gender) {
		this.holder3Gender = holder3Gender;
	}

	public String getHolder3DOB() {
		return holder3DOB;
	}

	public void setHolder3DOB(String holder3dob) {
		holder3DOB = holder3dob;
	}

	public String getHolder3Minor() {
		return holder3Minor;
	}

	public void setHolder3Minor(String holder3Minor) {
		this.holder3Minor = holder3Minor;
	}

	public String getNominee1Name() {
		return nominee1Name;
	}

	public void setNominee1Name(String nominee1Name) {
		this.nominee1Name = nominee1Name;
	}

	public String getNominee1Gender() {
		return nominee1Gender;
	}

	public void setNominee1Gender(String nominee1Gender) {
		this.nominee1Gender = nominee1Gender;
	}

	public String getNominee1DOB() {
		return nominee1DOB;
	}

	public void setNominee1DOB(String nominee1dob) {
		nominee1DOB = nominee1dob;
	}

	public String getNominee1Minor() {
		return nominee1Minor;
	}

	public void setNominee1Minor(String nominee1Minor) {
		this.nominee1Minor = nominee1Minor;
	}

	public String getNominee2Name() {
		return nominee2Name;
	}

	public void setNominee2Name(String nominee2Name) {
		this.nominee2Name = nominee2Name;
	}

	public String getNominee2Gender() {
		return nominee2Gender;
	}

	public void setNominee2Gender(String nominee2Gender) {
		this.nominee2Gender = nominee2Gender;
	}

	public String getNominee2DOB() {
		return nominee2DOB;
	}

	public void setNominee2DOB(String nominee2dob) {
		nominee2DOB = nominee2dob;
	}

	public String getNominee2Minor() {
		return nominee2Minor;
	}

	public void setNominee2Minor(String nominee2Minor) {
		this.nominee2Minor = nominee2Minor;
	}

	public String getNominee3Name() {
		return nominee3Name;
	}

	public void setNominee3Name(String nominee3Name) {
		this.nominee3Name = nominee3Name;
	}

	public String getNominee3Gender() {
		return nominee3Gender;
	}

	public void setNominee3Gender(String nominee3Gender) {
		this.nominee3Gender = nominee3Gender;
	}

	public String getNominee3DOB() {
		return nominee3DOB;
	}

	public void setNominee3DOB(String nominee3dob) {
		nominee3DOB = nominee3dob;
	}

	public String getNominee3Minor() {
		return nominee3Minor;
	}

	public void setNominee3Minor(String nominee3Minor) {
		this.nominee3Minor = nominee3Minor;
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
