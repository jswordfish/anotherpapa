package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@NamedQueries({
	@NamedQuery(name = "CustParam.getCustParam", query = "SELECT cp FROM CustomerParameter cp " +
			" WHERE cp.tenantId=:tenantId AND cp.customerCode=:customerCode")
})
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "tenantId", "customerCode" } ))
public class CustomerParameter extends Base {
	
	private static final long serialVersionUID = -4769012017013669262L;

	@Column(nullable=true, length=30)
	private String cutomerCode="";
	
	@Column(nullable=true, length=30)
	private String creditAccount="";
	
	@Column(nullable=true, length=30)
	private String shareCapitalAccount="";
	
	@Column(nullable=true, length=30)
	private String shareSuspenseAccount="";
	
	@Column(nullable=true, length=30)
	private String adjustmentAccount="";
	
	@Column(nullable=true, length=30)
	private String instrumentAccount="";
	
	@Column(nullable=true)
	private Integer yearNumberForHundi=0;
	
	@Column(nullable=true)
	private Double penalInterestRate=0.00d;

	@Column(nullable=true, length=30)
	private String dueDateMonthforTL="";
	
	@Column(nullable=true)
	private Integer postponedAdjustmentTenorYears=0;
	
	@Column(nullable=true)
	private Boolean isActive=true;
	
	@Column(nullable=true, length=30)
	private String authStatus="";

	public String getCutomerCode() {
		return cutomerCode;
	}

	public void setCutomerCode(String cutomerCode) {
		this.cutomerCode = cutomerCode;
	}

	public String getCreditAccount() {
		return creditAccount;
	}

	public void setCreditAccount(String creditAccount) {
		this.creditAccount = creditAccount;
	}

	public String getShareCapitalAccount() {
		return shareCapitalAccount;
	}

	public void setShareCapitalAccount(String shareCapitalAccount) {
		this.shareCapitalAccount = shareCapitalAccount;
	}

	public String getShareSuspenseAccount() {
		return shareSuspenseAccount;
	}

	public void setShareSuspenseAccount(String shareSuspenseAccount) {
		this.shareSuspenseAccount = shareSuspenseAccount;
	}

	public String getAdjustmentAccount() {
		return adjustmentAccount;
	}

	public void setAdjustmentAccount(String adjustmentAccount) {
		this.adjustmentAccount = adjustmentAccount;
	}

	public String getInstrumentAccount() {
		return instrumentAccount;
	}

	public void setInstrumentAccount(String instrumentAccount) {
		this.instrumentAccount = instrumentAccount;
	}

	public Integer getYearNumberForHundi() {
		return yearNumberForHundi;
	}

	public void setYearNumberForHundi(Integer yearNumberForHundi) {
		this.yearNumberForHundi = yearNumberForHundi;
	}

	public Double getPenalInterestRate() {
		return penalInterestRate;
	}

	public void setPenalInterestRate(Double penalInterestRate) {
		this.penalInterestRate = penalInterestRate;
	}

	public String getDueDateMonthforTL() {
		return dueDateMonthforTL;
	}

	public void setDueDateMonthforTL(String dueDateMonthforTL) {
		this.dueDateMonthforTL = dueDateMonthforTL;
	}

	public Integer getPostponedAdjustmentTenorYears() {
		return postponedAdjustmentTenorYears;
	}

	public void setPostponedAdjustmentTenorYears(
			Integer postponedAdjustmentTenorYears) {
		this.postponedAdjustmentTenorYears = postponedAdjustmentTenorYears;
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
