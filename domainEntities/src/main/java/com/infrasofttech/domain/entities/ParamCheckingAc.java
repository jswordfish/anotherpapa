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
@NamedQueries({
		@NamedQuery(name = "ParamCheckingAc.getParamCheckingAcMst", query = "SELECT pc FROM ParamCheckingAc pc WHERE pc.tenantId=:tenantId AND "
				+ " pc.moduleCode=:moduleCode AND"
				+ " pc.prodCode=:productCode AND "
				+ "pc.branchCode=:branchCode AND "
				+ " pc.isActive=true AND effectiveFrom=:effFromDate"),
		@NamedQuery(name = "ParamCheckingAc.getParamCheckingAcMstDisable", query = "SELECT pc FROM ParamCheckingAc pc WHERE pc.tenantId=:tenantId AND "
				+ " pc.moduleCode=:moduleCode AND"
				+ " pc.prodCode=:productCode AND "
				+ "pc.branchCode=:branchCode AND " + " pc.isActive=false AND effectiveFrom=:effFromDate"),
		@NamedQuery(name = "ParamCheckingAc.getParamCheckingAcMstBySetNo", query = "SELECT pc FROM ParamCheckingAc pc WHERE pc.tenantId=:tenantId AND "
				+ " pc.moduleCode=:moduleCode AND pc.prodCode=:productCode AND "
				+ " pc.setNumber=:setNumber AND pc.isActive=true") })
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "tenantId",
		"moduleCode", "prodCode", "branchCode","effectiveFrom"}))
public class ParamCheckingAc extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true)
	Long setNumber;

	@Column(nullable = true, length = 20)
	private String branchCode = "";

	@Column(nullable = true, length = 20)
	private String moduleCode = "";

	@Column(nullable = true, length = 20)
	private String prodCode = "";

	@Column(nullable = true, length = 50)
	private String prdAcNo = "";

	@Column(nullable = true)
	private String defaultTransferBatch = ""; // from lookup

	@Temporal(TemporalType.DATE)
	private Date effectiveFrom;

	@Temporal(TemporalType.DATE)
	private Date effectiveTill;

	@Column(nullable = true)
	private String interestPayOrReceiveCustomer = "";

	@Column(nullable = true)
	private Double maximumInterestRate = 0D;

	@Column(nullable = true)
	private Double penalInterestRate = 0D;

	@Column(nullable = true)
	private Double maximumAdhocInterestRate = 0D;

	@Column(nullable = true)
	private Double adhocInterestRate = 0D;

	@Column(nullable = true)
	private double tdsPercent = 0D;

	@Column(nullable = true)
	private Boolean tds = false;

	@Column(nullable = true)
	private double interestTax = 0D;

	@Column(nullable = true)
	private String roundOffOption = "";

	@Column(nullable = true)
	private Double temporaryOverdraftInterestRate = 0D;

	@Column(nullable = true)
	private Double nonPerpormingAssetPanelRate = 0D;

	@Column(nullable = true)
	private String interestCalculationBalancingType = "";

	@Column(nullable = true)
	private String valueMaxMonth = "";

	@Column(nullable = true)
	private String interestApplicationFrequency = "";

	@Column(nullable = true)
	private String discountedInterestRate = "";

	@Column(nullable = true)
	private String productCalculationType = "";

	@Column(nullable = true)
	private String dayOfMonth = "";

	@Column(nullable = true)
	private String daysCountPerYear = "";

	@Column(nullable = true)
	private String status = "";

	@Column(nullable = true)
	private String moveAcToInoperativeHead = "";

	@Column(nullable = true)
	private String afterMonthsInOperative = "";
	
	@Column(nullable = true)
	private String afterMonthsDormant = "";

	@Column(nullable = true)
	private String moveAccountToInDormantHead = "";

	@Column(nullable = true)
	private Double minimumProductTODCharge = 0D;

	@Column(nullable = true)
	private Double minimumTODChargeAmount = 0D;

	@Column(nullable = true)
	private Double minimumSBInterestAmount = 0D;

	@Column(nullable = true)
	private String intAcNo = "";

	@Column(nullable = true)
	private String penalIntAcNo = "";

	@Column(nullable = true)
	private String intRecvAcNo = "";

	@Column(nullable = true)
	private String intResAcNo = "";

	@Column(nullable = true)
	private String tdsAcNo = "";

	@Column(nullable = true)
	private String lastAcNo = "";

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

	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public String getPrdAcNo() {
		return prdAcNo;
	}

	public void setPrdAcNo(String prdAcNo) {
		this.prdAcNo = prdAcNo;
	}

	public String getDefaultTransferBatch() {
		return defaultTransferBatch;
	}

	public void setDefaultTransferBatch(String defaultTransferBatch) {
		this.defaultTransferBatch = defaultTransferBatch;
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

	public String getInterestPayOrReceiveCustomer() {
		return interestPayOrReceiveCustomer;
	}

	public void setInterestPayOrReceiveCustomer(
			String interestPayOrReceiveCustomer) {
		this.interestPayOrReceiveCustomer = interestPayOrReceiveCustomer;
	}

	public String getAfterMonthsInOperative() {
		return afterMonthsInOperative;
	}

	public String getAfterMonthsDormant() {
		return afterMonthsDormant;
	}

	public void setAfterMonthsDormant(String afterMonthsDormant) {
		this.afterMonthsDormant = afterMonthsDormant;
	}

	public void setAfterMonthsInOperative(String afterMonthsInOperative) {
		this.afterMonthsInOperative = afterMonthsInOperative;
	}

	public Double getMaximumInterestRate() {
		return maximumInterestRate;
	}

	public void setMaximumInterestRate(Double maximumInterestRate) {
		this.maximumInterestRate = maximumInterestRate;
	}

	public Double getPenalInterestRate() {
		return penalInterestRate;
	}

	public void setPenalInterestRate(Double penalInterestRate) {
		this.penalInterestRate = penalInterestRate;
	}

	public Double getMaximumAdhocInterestRate() {
		return maximumAdhocInterestRate;
	}

	public void setMaximumAdhocInterestRate(Double maximumAdhocInterestRate) {
		this.maximumAdhocInterestRate = maximumAdhocInterestRate;
	}

	public Double getAdhocInterestRate() {
		return adhocInterestRate;
	}

	public void setAdhocInterestRate(Double adhocInterestRate) {
		this.adhocInterestRate = adhocInterestRate;
	}

	public double getTdsPercent() {
		return tdsPercent;
	}

	public void setTdsPercent(double tdsPercent) {
		this.tdsPercent = tdsPercent;
	}

	public Boolean getTds() {
		return tds;
	}

	public void setTds(Boolean tds) {
		this.tds = tds;
	}

	public double getInterestTax() {
		return interestTax;
	}

	public void setInterestTax(double interestTax) {
		this.interestTax = interestTax;
	}

	public String getRoundOffOption() {
		return roundOffOption;
	}

	public void setRoundOffOption(String roundOffOption) {
		this.roundOffOption = roundOffOption;
	}

	public Double getTemporaryOverdraftInterestRate() {
		return temporaryOverdraftInterestRate;
	}

	public void setTemporaryOverdraftInterestRate(
			Double temporaryOverdraftInterestRate) {
		this.temporaryOverdraftInterestRate = temporaryOverdraftInterestRate;
	}

	public Double getNonPerpormingAssetPanelRate() {
		return nonPerpormingAssetPanelRate;
	}

	public void setNonPerpormingAssetPanelRate(
			Double nonPerpormingAssetPanelRate) {
		this.nonPerpormingAssetPanelRate = nonPerpormingAssetPanelRate;
	}

	public String getInterestCalculationBalancingType() {
		return interestCalculationBalancingType;
	}

	public void setInterestCalculationBalancingType(
			String interestCalculationBalancingType) {
		this.interestCalculationBalancingType = interestCalculationBalancingType;
	}

	public String getValueMaxMonth() {
		return valueMaxMonth;
	}

	public void setValueMaxMonth(String valueMaxMonth) {
		this.valueMaxMonth = valueMaxMonth;
	}

	public String getInterestApplicationFrequency() {
		return interestApplicationFrequency;
	}

	public void setInterestApplicationFrequency(
			String interestApplicationFrequency) {
		this.interestApplicationFrequency = interestApplicationFrequency;
	}

	public String getDiscountedInterestRate() {
		return discountedInterestRate;
	}

	public void setDiscountedInterestRate(String discountedInterestRate) {
		this.discountedInterestRate = discountedInterestRate;
	}

	public String getProductCalculationType() {
		return productCalculationType;
	}

	public void setProductCalculationType(String productCalculationType) {
		this.productCalculationType = productCalculationType;
	}

	public String getDayOfMonth() {
		return dayOfMonth;
	}

	public void setDayOfMonth(String dayOfMonth) {
		this.dayOfMonth = dayOfMonth;
	}

	public String getDaysCountPerYear() {
		return daysCountPerYear;
	}

	public void setDaysCountPerYear(String daysCountPerYear) {
		this.daysCountPerYear = daysCountPerYear;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMoveAcToInoperativeHead() {
		return moveAcToInoperativeHead;
	}

	public void setMoveAcToInoperativeHead(String moveAcToInoperativeHead) {
		this.moveAcToInoperativeHead = moveAcToInoperativeHead;
	}

	

	public String getMoveAccountToInDormantHead() {
		return moveAccountToInDormantHead;
	}

	public void setMoveAccountToInDormantHead(String moveAccountToInDormantHead) {
		this.moveAccountToInDormantHead = moveAccountToInDormantHead;
	}

	public Double getMinimumProductTODCharge() {
		return minimumProductTODCharge;
	}

	public void setMinimumProductTODCharge(Double minimumProductTODCharge) {
		this.minimumProductTODCharge = minimumProductTODCharge;
	}

	public Double getMinimumTODChargeAmount() {
		return minimumTODChargeAmount;
	}

	public void setMinimumTODChargeAmount(Double minimumTODChargeAmount) {
		this.minimumTODChargeAmount = minimumTODChargeAmount;
	}

	public Double getMinimumSBInterestAmount() {
		return minimumSBInterestAmount;
	}

	public void setMinimumSBInterestAmount(Double minimumSBInterestAmount) {
		this.minimumSBInterestAmount = minimumSBInterestAmount;
	}

	public String getIntAcNo() {
		return intAcNo;
	}

	public void setIntAcNo(String intAcNo) {
		this.intAcNo = intAcNo;
	}

	public String getPenalIntAcNo() {
		return penalIntAcNo;
	}

	public void setPenalIntAcNo(String penalIntAcNo) {
		this.penalIntAcNo = penalIntAcNo;
	}

	public String getIntRecvAcNo() {
		return intRecvAcNo;
	}

	public void setIntRecvAcNo(String intRecvAcNo) {
		this.intRecvAcNo = intRecvAcNo;
	}

	public String getIntResAcNo() {
		return intResAcNo;
	}

	public void setIntResAcNo(String intResAcNo) {
		this.intResAcNo = intResAcNo;
	}

	public String getTdsAcNo() {
		return tdsAcNo;
	}

	public void setTdsAcNo(String tdsAcNo) {
		this.tdsAcNo = tdsAcNo;
	}

	public String getLastAcNo() {
		return lastAcNo;
	}

	public void setLastAcNo(String lastAcNo) {
		this.lastAcNo = lastAcNo;
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

	public Long getSetNumber() {
		return setNumber;
	}

	public void setSetNumber(Long setNumber) {
		this.setNumber = setNumber;
	}

}
