package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class CustomerContact  {

	@Column(nullable = true, length = 20)
	private String residencePhone = "";

	@Column(nullable = true, length = 20)
	private String mobile1 = "";

	@Column(nullable = true, length = 20)
	private String mobile2 = "";

	@Column(nullable = true, length = 40)
	private String emailId1 = "";

	@Column(nullable = true, length = 40)
	private String emailId2 = "";

	@Column(nullable = true, length = 20)
	private String faxNo = "";

	@Column(nullable = true, length = 20)
	private String officePhone1 = "";
	@Column(nullable = true, length = 20)
	private String officePhone2 = "";

	// @ManyToOne
	// @JoinColumn(name="fkCustomerPk",nullable=true,updatable=true)
	// private CustomerMst customerMst;

	public String getResidencePhone() {
		return residencePhone;
	}

	public void setResidencePhone(String residencePhone) {
		this.residencePhone = residencePhone;
	}

	public String getMobile1() {
		return mobile1;
	}

	public void setMobile1(String mobile1) {
		this.mobile1 = mobile1;
	}

	public String getMobile2() {
		return mobile2;
	}

	public void setMobile2(String mobile2) {
		this.mobile2 = mobile2;
	}

	public String getEmailId1() {
		return emailId1;
	}

	public void setEmailId1(String emailId1) {
		this.emailId1 = emailId1;
	}

	public String getEmailId2() {
		return emailId2;
	}

	public void setEmailId2(String emailId2) {
		this.emailId2 = emailId2;
	}

	public String getFaxNo() {
		return faxNo;
	}

	public void setFaxNo(String faxNo) {
		this.faxNo = faxNo;
	}

	public String getOfficePhone1() {
		return officePhone1;
	}

	public void setOfficePhone1(String officePhone1) {
		this.officePhone1 = officePhone1;
	}

	public String getOfficePhone2() {
		return officePhone2;
	}

	public void setOfficePhone2(String officePhone2) {
		this.officePhone2 = officePhone2;
	}
}
