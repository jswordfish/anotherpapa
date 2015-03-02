package com.infrasofttech.domain.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class CustomerKYCDocs extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(length = 50, nullable = true)
	private String KYCType1 = "";

	@Column(length = 30, nullable = true)
	private String proofType = "";

	@Column(length = 30, nullable = true)
	private String idNumber = "";

	@Column(length = 50, nullable = true)
	private String issuedBy = "";

	@Temporal(TemporalType.DATE)
	private Date issuedDate;

	@Temporal(TemporalType.DATE)
	private Date expiryDate;

	@Temporal(TemporalType.DATE)
	private Date recievedDate;

	@Column(length = 100, nullable = true)
	private String remarks = "";

	public String getKYCType1() {
		return KYCType1;
	}

	public void setKYCType1(String kYCType1) {
		KYCType1 = kYCType1;
	}

	public String getProofType() {
		return proofType;
	}

	public void setProofType(String proofType) {
		this.proofType = proofType;
	}

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public String getIssuedBy() {
		return issuedBy;
	}

	public void setIssuedBy(String issuedBy) {
		this.issuedBy = issuedBy;
	}

	public Date getIssuedDate() {
		return issuedDate;
	}

	public void setIssuedDate(Date issuedDate) {
		this.issuedDate = issuedDate;
	}

	public Date getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}

	public Date getRecievedDate() {
		return recievedDate;
	}

	public void setRecievedDate(Date recievedDate) {
		this.recievedDate = recievedDate;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

}
