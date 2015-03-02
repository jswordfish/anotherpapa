package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class AccountMst extends Base {

	@ManyToOne
	@JoinColumn(name = "fkBranchMstPk")
	private BranchMst branchMst;
	@Column(nullable = true)
	private String customerCode = "";
	@Column(nullable = true)
	private String branchCode = "";
	@Column(nullable = true)
	private String prdAcctId = "";
	@Column(nullable = true)
	private String tele1 = "";
	@Column(nullable = true)
	private String tele2 = "";
	@Column(nullable = true)
	private String fax1 = "";
	@Column(nullable = true)
	private String fax2 = "";
	@Column(nullable = true)
	private String area = "";

	@ManyToMany(cascade = CascadeType.ALL)
	private Collection<Address> addresses = new ArrayList<Address>();
	@Column(nullable = true)
	private Boolean isActive = true;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public BranchMst getBranchMst() {
		return branchMst;
	}

	public void setBranchMst(BranchMst branchMst) {
		this.branchMst = branchMst;
	}

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public String getPrdAcctId() {
		return prdAcctId;
	}

	public void setPrdAcctId(String prdAcctId) {
		this.prdAcctId = prdAcctId;
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

	public String getFax1() {
		return fax1;
	}

	public void setFax1(String fax1) {
		this.fax1 = fax1;
	}

	public String getFax2() {
		return fax2;
	}

	public void setFax2(String fax2) {
		this.fax2 = fax2;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public Collection<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(Collection<Address> addresses) {
		this.addresses = addresses;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

}
