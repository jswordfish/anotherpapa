package com.infrasofttech.domain.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

@Entity
@NamedQueries({ @NamedQuery(name = "ParamLoanMst.getParamLoanMst", query = "SELECT pl FROM ParamLoanAc pl WHERE pl.tenantId=:tenantId AND "
		+ " pl.moduleCode=:moduleCode AND pl.prodCode=:productCode AND "
		+ " pl.isActive=true AND pl.branchCode=:branchCode AND effectiveFrom=:effFromDate"),
		@NamedQuery(name = "ParamLoanMst.getParamLoanMstDisable", query = "SELECT pl FROM ParamLoanAc pl WHERE pl.tenantId=:tenantId AND "
				+ " pl.moduleCode=:moduleCode AND pl.prodCode=:productCode AND "
				+ " pl.isActive=false AND pl.branchCode=:branchCode AND effectiveFrom=:effFromDate"),
@NamedQuery(name = "ParamLoanMst.getParamLoanMstBySetNo",query = "SELECT pl FROM ParamLoanAc pl WHERE pl.tenantId=:tenantId AND "
		+ " pl.moduleCode=:moduleCode AND pl.prodCode=:productCode AND "
		+ " pl.setNumber=:setNumber AND pl.isActive=true")})
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "tenantId",
		"moduleCode", "prodCode" ,"branchCode","effectiveFrom"}))
public class ParamLoanAc extends Base {
	private static final long serialVersionUID = 1701926931204630606L;
	
		
	@Column(nullable = true)
	Long setNumber;
	
	@Column(nullable = true, length = 20)
	private String branchCode = "";

	@Column(nullable = true)
	private String moduleCode = "";

	@Column(nullable = true)
	private String prodCode = "";

	// @Column(nullable=true, length=50)
	// private String prdAcNo;

	@Temporal(TemporalType.DATE)
	private Date effectiveFrom;

	@Temporal(TemporalType.DATE)
	private Date effectiveTill;

	@Column(length = 20, nullable = true)
	private String interestApplicationFrequency = "";

	@Column(length = 50, nullable = true)
	private String productCalculationType = "";

	@Column(length = 20, nullable = true)
	private String holidayPeriod = "";

	@Column(length = 20, nullable = true)
	private String roundOff = "";

	@Column(length = 20, nullable = true)
	private String loanType = "";

	@Column(length = 20, nullable = true)
	private String interestChargeType = "";

	@Column(nullable = true)
	private Boolean equated = false;

	@Column(nullable = true)
	private Boolean funded = false;

	@Column(nullable = true, length = 50)
	private Integer graceDaysInstallment = 0;

	@Column(nullable = true, length = 50)
	private String defaultTransferBatch = "";

	@Column(nullable = true, length = 50)
	private Double minimumTerm = 0D;

	@Column(nullable = true, length = 50)
	private Integer maximumTerm = 0;

	@Column(nullable = true, length = 50)
	private Double minimumAmount = 0D;

	@Column(nullable = true, length = 50)
	private Double maximumAmount = 0D;

	@Column(nullable = true, length = 50)
	private Integer graceDayInterest = 0;

	@Column(nullable = true, length = 50)
	private Integer minimumDaysOfInterest = 0;

	@Column(nullable = true, length = 50)
	private Double penalInterestRate = 0D;

	@Column(nullable = true, length = 50)
	private Double maxPenalInterestRate = 0D;

	@Column(nullable = true, length = 50)
	private Double interestTax = 0D;

	@Column(nullable = true, length = 50)
	private Double notPerformingAccountpenalRate = 0d;

	@Column(nullable = true, length = 50)
	private Integer minimumClosureTerm = 0;

	@Column(nullable = true)
	private Boolean discoutedInterestRate = false;

	@Column(nullable = true, length = 50)
	private Integer numberOfDaysInYear = 0;

	@Column(nullable = true, length = 50)
	private Float maximumSanctionLimit = 0.0F;

	@Column(nullable = true)
	private Boolean acceptNonPerformingAccountDate = false;

	@Column(nullable = true)
	private Boolean chargeFullMonthInterestClosure = false;

	public Long getSetNumber() {
		return setNumber;
	}

	public void setSetNumber(Long setNumber) {
		this.setNumber = setNumber;
	}

	@Column(nullable = true, length = 50)
	private Integer monthValueDate = 0;

	@Column(nullable = true, length = 50)
	private Double deathInsurance = 0D;

	@Column(nullable = true, length = 50)
	private Double guaranteeDeposit = 0D;

	@Column(nullable = true, length = 50)
	private Double guaranteeFund = 0D;
	
	@Column(nullable = true, length = 50)
	private String status = "";

	@Column(nullable = true, length = 50)
	private Integer numOfAccount = 0;

	@Column(nullable = true, length = 50)
	private String lastAccount = "";

	@Column(nullable = true, length = 50)
	private String unRecovExpAc = "";

	@Column(nullable = true, length = 50)
	private String npaAIntRecvAc = "";

	@Column(nullable = true, length = 50)
	private String npaAIntResAc = "";

	@Column(nullable = true, length = 50)
	private String npaPIntRecvAc = "";

	@Column(nullable = true, length = 50)
	private String npaPIntResAc = "";

	@Column(nullable = true, length = 50)
	private String npaOCRecvAc = "";

	@Column(nullable = true, length = 50)
	private String npaOCResAc = "";

	@Column(nullable = true)
	private Boolean isActive = true;

	@Column(nullable = true, length = 30)
	private String authStatus = "";

	public String getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}

	public String getProdCode() {
		return prodCode;
	}

	public void setProdCode(String prodCode) {
		this.prodCode = prodCode;
	}

	public Date getEffectiveFrom() {
		return effectiveFrom;
	}

	public void setEffectiveFrom(Date effectiveFrom) {
		this.effectiveFrom = effectiveFrom;
	}

	public Date getEffectiveTill() {
		
		return effectiveTill;
	}

	public void setEffectiveTill(Date effectiveTill) {
		this.effectiveTill = effectiveTill;
	}

	public String getInterestApplicationFrequency() {
		return interestApplicationFrequency;
	}

	public void setInterestApplicationFrequency(
			String interestApplicationFrequency) {
		this.interestApplicationFrequency = interestApplicationFrequency;
	}

	public String getProductCalculationType() {
		return productCalculationType;
	}

	public void setProductCalculationType(String productCalculationType) {
		this.productCalculationType = productCalculationType;
	}

	public String getHolidayPeriod() {
		return holidayPeriod;
	}

	public void setHolidayPeriod(String holidayPeriod) {
		this.holidayPeriod = holidayPeriod;
	}

	public String getRoundOff() {
		return roundOff;
	}

	public void setRoundOff(String roundOff) {
		this.roundOff = roundOff;
	}

	public String getLoanType() {
		return loanType;
	}

	public void setLoanType(String loanType) {
		this.loanType = loanType;
	}

	public String getInterestChargeType() {
		return interestChargeType;
	}

	public void setInterestChargeType(String interestChargeType) {
		this.interestChargeType = interestChargeType;
	}

	public Boolean getEquated() {
		return equated;
	}

	public void setEquated(Boolean equated) {
		this.equated = equated;
	}

	public Boolean getFunded() {
		return funded;
	}

	public void setFunded(Boolean funded) {
		this.funded = funded;
	}

	public Integer getGraceDaysInstallment() {
		return graceDaysInstallment;
	}

	public void setGraceDaysInstallment(Integer graceDaysInstallment) {
		this.graceDaysInstallment = graceDaysInstallment;
	}

	public String getDefaultTransferBatch() {
		return defaultTransferBatch;
	}

	public void setDefaultTransferBatch(String defaultTransferBatch) {
		this.defaultTransferBatch = defaultTransferBatch;
	}

	public Double getMinimumTerm() {
		return minimumTerm;
	}

	public void setMinimumTerm(Double minimumTerm) {
		this.minimumTerm = minimumTerm;
	}

	public Integer getMaximumTerm() {
		return maximumTerm;
	}

	public void setMaximumTerm(Integer maximumTerm) {
		this.maximumTerm = maximumTerm;
	}

	public Double getMinimumAmount() {
		return minimumAmount;
	}

	public void setMinimumAmount(Double minimumAmount) {
		this.minimumAmount = minimumAmount;
	}

	public Double getMaximumAmount() {
		return maximumAmount;
	}

	public void setMaximumAmount(Double maximumAmount) {
		this.maximumAmount = maximumAmount;
	}

	public Integer getGraceDayInterest() {
		return graceDayInterest;
	}

	public void setGraceDayInterest(Integer graceDayInterest) {
		this.graceDayInterest = graceDayInterest;
	}

	public Integer getMinimumDaysOfInterest() {
		return minimumDaysOfInterest;
	}

	public void setMinimumDaysOfInterest(Integer minimumDaysOfInterest) {
		this.minimumDaysOfInterest = minimumDaysOfInterest;
	}

	public Double getPenalInterestRate() {
		return penalInterestRate;
	}

	public void setPenalInterestRate(Double penalInterestRate) {
		this.penalInterestRate = penalInterestRate;
	}

	public Double getMaxPenalInterestRate() {
		return maxPenalInterestRate;
	}

	public void setMaxPenalInterestRate(Double maxPenalInterestRate) {
		this.maxPenalInterestRate = maxPenalInterestRate;
	}

	public Double getInterestTax() {
		return interestTax;
	}

	public void setInterestTax(Double interestTax) {
		this.interestTax = interestTax;
	}

	public Double getNotPerformingAccountpenalRate() {
		return notPerformingAccountpenalRate;
	}

	public void setNotPerformingAccountpenalRate(
			Double notPerformingAccountpenalRate) {
		this.notPerformingAccountpenalRate = notPerformingAccountpenalRate;
	}

	public Integer getMinimumClosureTerm() {
		return minimumClosureTerm;
	}

	public void setMinimumClosureTerm(Integer minimumClosureTerm) {
		this.minimumClosureTerm = minimumClosureTerm;
	}

	public Boolean getDiscoutedInterestRate() {
		return discoutedInterestRate;
	}

	public void setDiscoutedInterestRate(Boolean discoutedInterestRate) {
		this.discoutedInterestRate = discoutedInterestRate;
	}

	public Integer getNumberOfDaysInYear() {
		return numberOfDaysInYear;
	}

	public void setNumberOfDaysInYear(Integer numberOfDaysInYear) {
		this.numberOfDaysInYear = numberOfDaysInYear;
	}

	public Float getMaximumSanctionLimit() {
		return maximumSanctionLimit;
	}

	public void setMaximumSanctionLimit(Float maximumSanctionLimit) {
		this.maximumSanctionLimit = maximumSanctionLimit;
	}

	public Boolean getAcceptNonPerformingAccountDate() {
		return acceptNonPerformingAccountDate;
	}

	public void setAcceptNonPerformingAccountDate(
			Boolean acceptNonPerformingAccountDate) {
		this.acceptNonPerformingAccountDate = acceptNonPerformingAccountDate;
	}

	public Boolean getChargeFullMonthInterestClosure() {
		return chargeFullMonthInterestClosure;
	}

	public void setChargeFullMonthInterestClosure(
			Boolean chargeFullMonthInterestClosure) {
		this.chargeFullMonthInterestClosure = chargeFullMonthInterestClosure;
	}

	public Integer getMonthValueDate() {
		return monthValueDate;
	}

	public void setMonthValueDate(Integer monthValueDate) {
		this.monthValueDate = monthValueDate;
	}

	public Double getDeathInsurance() {
		return deathInsurance;
	}

	public void setDeathInsurance(Double deathInsurance) {
		this.deathInsurance = deathInsurance;
	}

	public Double getGuaranteeDeposit() {
		return guaranteeDeposit;
	}

	public void setGuaranteeDeposit(Double guaranteeDeposit) {
		this.guaranteeDeposit = guaranteeDeposit;
	}

	public Double getGuaranteeFund() {
		return guaranteeFund;
	}

	public void setGuaranteeFund(Double guaranteeFund) {
		this.guaranteeFund = guaranteeFund;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getNumOfAccount() {
		return numOfAccount;
	}

	public void setNumOfAccount(Integer numOfAccount) {
		this.numOfAccount = numOfAccount;
	}

	public String getLastAccount() {
		return lastAccount;
	}

	public void setLastAccount(String lastAccount) {
		this.lastAccount = lastAccount;
	}

	public String getUnRecovExpAc() {
		return unRecovExpAc;
	}

	public void setUnRecovExpAc(String unRecovExpAc) {
		this.unRecovExpAc = unRecovExpAc;
	}

	public String getNpaAIntRecvAc() {
		return npaAIntRecvAc;
	}

	public void setNpaAIntRecvAc(String npaAIntRecvAc) {
		this.npaAIntRecvAc = npaAIntRecvAc;
	}

	public String getNpaAIntResAc() {
		return npaAIntResAc;
	}

	public void setNpaAIntResAc(String npaAIntResAc) {
		this.npaAIntResAc = npaAIntResAc;
	}

	public String getNpaPIntRecvAc() {
		return npaPIntRecvAc;
	}

	public void setNpaPIntRecvAc(String npaPIntRecvAc) {
		this.npaPIntRecvAc = npaPIntRecvAc;
	}

	public String getNpaPIntResAc() {
		return npaPIntResAc;
	}

	public void setNpaPIntResAc(String npaPIntResAc) {
		this.npaPIntResAc = npaPIntResAc;
	}

	public String getNpaOCRecvAc() {
		return npaOCRecvAc;
	}

	public void setNpaOCRecvAc(String npaOCRecvAc) {
		this.npaOCRecvAc = npaOCRecvAc;
	}

	public String getNpaOCResAc() {
		return npaOCResAc;
	}

	public void setNpaOCResAc(String npaOCResAc) {
		this.npaOCResAc = npaOCResAc;
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

	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
}
