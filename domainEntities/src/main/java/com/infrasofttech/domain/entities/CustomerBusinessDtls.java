package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class CustomerBusinessDtls extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true)
	private Integer noOfStaff = 0;

	@Column(nullable = true)
	private String regCode = "";

	@Column(nullable = true)
	private Boolean isActive = true;

	public Integer getNoOfStaff() {
		return noOfStaff;
	}

	public void setNoOfStaff(Integer noOfStaff) {
		this.noOfStaff = noOfStaff;
	}

	public String getRegCode() {
		return regCode;
	}

	public void setRegCode(String regCode) {
		this.regCode = regCode;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
}
