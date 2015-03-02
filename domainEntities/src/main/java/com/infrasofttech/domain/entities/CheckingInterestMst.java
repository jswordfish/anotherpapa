package com.infrasofttech.domain.entities;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
@NamedQueries({
	@NamedQuery(name="ChkIntMst.getInterestValue", 
			query="SELECT ci FROM LoanInterestMst ci "
					+ " WHERE ci.tenantId=:tenantId AND ci.isActive=true AND "
					+ " productCode=:productCode AND currencyCode=:currencyCode ")
})
public class CheckingInterestMst extends Base {

	private static final long serialVersionUID = -8642397363285592915L;

	@Column(nullable=true, length=30)
	private String productCode="";
	
	@Column(nullable=true, length=30)
	private String currencyCode="";
	
	@Column(nullable=true)
	private Date effFromDate;
	
	@Column(nullable=true)
	private Date effToDate;
	
	@Column(nullable=true)
	private Double fromAmount = 0d;
	
	@Column(nullable=true)
	private Double toAmount = 0d;
	
	@Column(nullable=true)
	private Double interestValue=0d;

	@Column(nullable=true)
	private Boolean isActive=true;
	
	@Column(nullable=true, length=30)
	private String authStatus="";
	
	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getCurrencyCode() {
		return currencyCode;
	}

	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}

	public Date getEffFromDate() {
		return effFromDate;
	}

	public void setEffFromDate(Date effFromDate) {
		this.effFromDate = effFromDate;
	}

	public Date getEffToDate() {
		return effToDate;
	}

	public void setEffToDate(Date effToDate) {
		this.effToDate = effToDate;
	}

	public Double getFromAmount() {
		return fromAmount;
	}

	public void setFromAmount(Double fromAmount) {
		this.fromAmount = fromAmount;
	}

	public Double getToAmount() {
		return toAmount;
	}

	public void setToAmount(Double toAmount) {
		this.toAmount = toAmount;
	}

	public Double getInterestValue() {
		return interestValue;
	}

	public void setInterestValue(Double interestValue) {
		this.interestValue = interestValue;
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
