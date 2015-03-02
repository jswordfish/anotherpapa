package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class AccountNominee extends Base {

	@ManyToOne
	@JoinColumn(name = "fkTenantMstPk")
	TenantMst tenantMst;
	@ManyToMany
	private Collection<BranchMst> branches = new ArrayList<BranchMst>();
	@Column(nullable = true)
	private Integer accountNumber = 0;
	@Column(nullable = true)
	private String entityId = "";
	@Column(nullable = true)
	private String branchCode = "";
	@Column(nullable = true)
	private String productAccountId = "";
	@Column(nullable = true)
	private String custCode = "";
	@Column(nullable = true)
	private Integer srNo = 0;
	@Column(nullable = true)
	private Integer nomineeNo = 0;
	@Column(nullable = true)
	private Date nomineeDate;
	@Column(nullable = true)
	private String nomineeTitle = "";
	@Column(nullable = true)
	private String nomineeName = "";
	@Column(nullable = true)
	private String nomineeRelationship = "";
	@Column(nullable = true)
	private String address1 = "";
	@Column(nullable = true)
	private String address2 = "";
	@Column(nullable = true)
	private String address3 = "";
	@Column(nullable = true)
	private String village = "";
	@Column(nullable = true)
	private String city = "";
	@Column(nullable = true)
	private String state = "";
	@Column(nullable = true)
	private String countryCode = "";
	@Column(nullable = true)
	private Date nomineeDOB;
	@Column(nullable = true)
	private Integer nomineeAge = 0;
	@Column(nullable = true)
	private String nomineePhone = "";
	@Column(nullable = true)
	private String nomineeMinorYN = "";
	@Column(nullable = true)
	private String nomineeGruadian = "";
	@Column(nullable = true)
	private double nomineePercentage = 0D;
	@Column(nullable = true)
	private Boolean isActive = true;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public TenantMst getTenantMst() {
		return tenantMst;
	}

	public void setTenantMst(TenantMst tenantMst) {
		this.tenantMst = tenantMst;
	}

	public Collection<BranchMst> getBranches() {
		return branches;
	}

	public void setBranches(Collection<BranchMst> branches) {
		this.branches = branches;
	}

	public Integer getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(Integer accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getEntityId() {
		return entityId;
	}

	public void setEntityId(String entityId) {
		this.entityId = entityId;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public String getProductAccountId() {
		return productAccountId;
	}

	public void setProductAccountId(String productAccountId) {
		this.productAccountId = productAccountId;
	}

	public String getCustCode() {
		return custCode;
	}

	public void setCustCode(String custCode) {
		this.custCode = custCode;
	}

	public Integer getSrNo() {
		return srNo;
	}

	public void setSrNo(Integer srNo) {
		this.srNo = srNo;
	}

	public Integer getNomineeNo() {
		return nomineeNo;
	}

	public void setNomineeNo(Integer nomineeNo) {
		this.nomineeNo = nomineeNo;
	}

	public Date getNomineeDate() {
		return nomineeDate;
	}

	public void setNomineeDate(Date nomineeDate) {
		this.nomineeDate = nomineeDate;
	}

	public String getNomineeTitle() {
		return nomineeTitle;
	}

	public void setNomineeTitle(String nomineeTitle) {
		this.nomineeTitle = nomineeTitle;
	}

	public String getNomineeName() {
		return nomineeName;
	}

	public void setNomineeName(String nomineeName) {
		this.nomineeName = nomineeName;
	}

	public String getNomineeRelationship() {
		return nomineeRelationship;
	}

	public void setNomineeRelationship(String nomineeRelationship) {
		this.nomineeRelationship = nomineeRelationship;
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

	public String getVillage() {
		return village;
	}

	public void setVillage(String village) {
		this.village = village;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public Date getNomineeDOB() {
		return nomineeDOB;
	}

	public void setNomineeDOB(Date nomineeDOB) {
		this.nomineeDOB = nomineeDOB;
	}

	public Integer getNomineeAge() {
		return nomineeAge;
	}

	public void setNomineeAge(Integer nomineeAge) {
		this.nomineeAge = nomineeAge;
	}

	public String getNomineePhone() {
		return nomineePhone;
	}

	public void setNomineePhone(String nomineePhone) {
		this.nomineePhone = nomineePhone;
	}

	public String getNomineeMinorYN() {
		return nomineeMinorYN;
	}

	public void setNomineeMinorYN(String nomineeMinorYN) {
		this.nomineeMinorYN = nomineeMinorYN;
	}

	public String getNomineeGruadian() {
		return nomineeGruadian;
	}

	public void setNomineeGruadian(String nomineeGruadian) {
		this.nomineeGruadian = nomineeGruadian;
	}

	public double getNomineePercentage() {
		return nomineePercentage;
	}

	public void setNomineePercentage(double nomineePercentage) {
		this.nomineePercentage = nomineePercentage;
	}

	public Boolean isActive() {
		return isActive;
	}

	public void setActive(Boolean isActive) {
		this.isActive = isActive;
	}

}
