package com.infrasofttech.domain.entities;

import javax.persistence.Entity;

@Entity
public class CustomerPrdAcLimit extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	private String prdAcNo = "";

	private Double limitAmount = 0D;

	public String getPrdAcNo() {
		return prdAcNo;
	}

	public void setPrdAcNo(String prdAcNo) {
		this.prdAcNo = prdAcNo;
	}

	public Double getLimitAmount() {
		return limitAmount;
	}

	public void setLimitAmount(Double limitAmount) {
		this.limitAmount = limitAmount;
	}

}
