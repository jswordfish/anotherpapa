package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@NamedQueries({
		@NamedQuery(name = "ProductMst.getProductMst", query = "SELECT p FROM ProductMst p WHERE p.tenantId=:tenantId AND "
				+ " p.moduleCode=:moduleCode AND p.productCode=:productCode AND "
				+ " p.isActive=true"),
		@NamedQuery(name = "ProductMst.getProductsByModule", query = "SELECT p FROM ProductMst p WHERE p.tenantId=:tenantId AND "
				+ " p.moduleCode=:moduleCode AND " + " p.isActive=true"),
		@NamedQuery(name = "ProductMst.getDisabledProduct", query = "SELECT p FROM ProductMst p WHERE p.tenantId=:tenantId AND "
				+ " p.moduleCode=:moduleCode AND p.productCode=:productCode AND "
				+ " p.isActive=false") })
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "tenantId",
		"modulecode", "productCode" }))
public class ProductMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true, length = 20)
	private String productCode = "";

	@Column(nullable = true, length = 50)
	private String productName = "";

	@Column(nullable = true, length = 20)
	private String parentProductCode = ""; // to maintain a grouping between
											// products & SUB-PRODUCTS

	@Column(nullable = true, length = 30)
	private String productTypeCode = ""; // from Lookup - ?

	@Column(nullable = true, length = 30)
	private String generalLadger = ""; 
	
	
	@Column(nullable = true, length = 30)
	private String moduleCode = "";

	// @ManyToMany(cascade = CascadeType.ALL)
	// private Collection<ProductNameAddress> prdNameAddresses = new
	// ArrayList<ProductNameAddress>();

	@Column(nullable = true, length = 10)
	private String currencyCode = ""; // drop down from DB

	@Column(nullable = true)
	private String customerInternal = ""; // lookup

	@Column(nullable = true)
	private String vcrEntryLevel = ""; // lookup

	@Column(nullable = true)
	private String vcrOpenLevel = ""; // lookup

	@Column(nullable = true)
	private String moduleType = ""; // lookup

	@Column(nullable = true)
	private String typeOfDeposit = ""; // lookup

	@Column(nullable = true)
	private Boolean autoGenAcNoYN = true;

	@Column(nullable = true)
	private Boolean autoGenSubAcNoYN = false;

	@Column(nullable = true)
	private Double minBalChqBook = 0d;

	@Column(nullable = true)
	private Double minBalNonChqBook = 0d;

	@Column(nullable = true)
	private String assetLiability = "";

	@Column(nullable = true)
	private String finNonFin = ""; // from lookup

	@Column(nullable = true)
	private String conditionalAssetGL = ""; // from lookup

	@Column(nullable = true)
	private String conditionalLiabilityGL = ""; // from lookup

	@Column(nullable = true)
	private String reconType = ""; // from lookup

	@Column(nullable = true)
	private String prdStatus = "";

	@Column(nullable = true)
	private Boolean accruedYN = false;

	@Column(nullable = true)
	private Boolean cashDrYN = false;

	@Column(nullable = true)
	private Boolean cashCrYN = false;

	@Column(nullable = true)
	private Boolean transferDrYN = false;

	@Column(nullable = true)
	private Boolean transferCrYN = false;

	@Column(nullable = true)
	private Boolean clearingDrYN = false;

	@Column(nullable = true)
	private Boolean clearingCrYN = false;

	@Column(nullable = true)
	private Boolean isActive = true;

	@Column(nullable = true, length = 30)
	private String authStatus = "";

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getParentProductCode() {
		return parentProductCode;
	}

	public void setParentProductCode(String parentProductCode) {
		this.parentProductCode = parentProductCode;
	}

	public String getProductTypeCode() {
		return productTypeCode;
	}

	public void setProductTypeCode(String productTypeCode) {
		this.productTypeCode = productTypeCode;
	}

	public String getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}

	public String getCurrencyCode() {
		return currencyCode;
	}

	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}

	public String getCustomerInternal() {
		return customerInternal;
	}

	public void setCustomerInternal(String customerInternal) {
		this.customerInternal = customerInternal;
	}

	public String getVcrEntryLevel() {
		return vcrEntryLevel;
	}

	public void setVcrEntryLevel(String vcrEntryLevel) {
		this.vcrEntryLevel = vcrEntryLevel;
	}

	public String getVcrOpenLevel() {
		return vcrOpenLevel;
	}

	public void setVcrOpenLevel(String vcrOpenLevel) {
		this.vcrOpenLevel = vcrOpenLevel;
	}

	public String getModuleType() {
		return moduleType;
	}

	public void setModuleType(String moduleType) {
		this.moduleType = moduleType;
	}

	public String getTypeOfDeposit() {
		return typeOfDeposit;
	}

	public void setTypeOfDeposit(String typeOfDeposit) {
		this.typeOfDeposit = typeOfDeposit;
	}

	public Boolean getAutoGenAcNoYN() {
		return autoGenAcNoYN;
	}

	public void setAutoGenAcNoYN(Boolean autoGenAcNoYN) {
		this.autoGenAcNoYN = autoGenAcNoYN;
	}

	public Boolean getAutoGenSubAcNoYN() {
		return autoGenSubAcNoYN;
	}

	public void setAutoGenSubAcNoYN(Boolean autoGenSubAcNoYN) {
		this.autoGenSubAcNoYN = autoGenSubAcNoYN;
	}

	public Double getMinBalChqBook() {
		return minBalChqBook;
	}

	public void setMinBalChqBook(Double minBalChqBook) {
		this.minBalChqBook = minBalChqBook;
	}

	public Double getMinBalNonChqBook() {
		return minBalNonChqBook;
	}

	public void setMinBalNonChqBook(Double minBalNonChqBook) {
		this.minBalNonChqBook = minBalNonChqBook;
	}

	public String getAssetLiability() {
		return assetLiability;
	}

	public void setAssetLiability(String assetLiability) {
		this.assetLiability = assetLiability;
	}

	public String getFinNonFin() {
		return finNonFin;
	}

	public void setFinNonFin(String finNonFin) {
		this.finNonFin = finNonFin;
	}

	public String getConditionalAssetGL() {
		return conditionalAssetGL;
	}

	public void setConditionalAssetGL(String conditionalAssetGL) {
		this.conditionalAssetGL = conditionalAssetGL;
	}

	public String getConditionalLiabilityGL() {
		return conditionalLiabilityGL;
	}

	public void setConditionalLiabilityGL(String conditionalLiabilityGL) {
		this.conditionalLiabilityGL = conditionalLiabilityGL;
	}

	public String getReconType() {
		return reconType;
	}

	public void setReconType(String reconType) {
		this.reconType = reconType;
	}

	public String getPrdStatus() {
		return prdStatus;
	}

	public void setPrdStatus(String prdStatus) {
		this.prdStatus = prdStatus;
	}

	public Boolean getAccruedYN() {
		return accruedYN;
	}

	public void setAccruedYN(Boolean accruedYN) {
		this.accruedYN = accruedYN;
	}

	public Boolean getCashDrYN() {
		return cashDrYN;
	}

	public void setCashDrYN(Boolean cashDrYN) {
		this.cashDrYN = cashDrYN;
	}

	public Boolean getCashCrYN() {
		return cashCrYN;
	}

	public void setCashCrYN(Boolean cashCrYN) {
		this.cashCrYN = cashCrYN;
	}

	public Boolean getTransferDrYN() {
		return transferDrYN;
	}

	public void setTransferDrYN(Boolean transferDrYN) {
		this.transferDrYN = transferDrYN;
	}

	public Boolean getTransferCrYN() {
		return transferCrYN;
	}

	public void setTransferCrYN(Boolean transferCrYN) {
		this.transferCrYN = transferCrYN;
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

	public Boolean getClearingDrYN() {
		return clearingDrYN;
	}

	public void setClearingDrYN(Boolean clearingDrYN) {
		this.clearingDrYN = clearingDrYN;
	}

	public Boolean getClearingCrYN() {
		return clearingCrYN;
	}

	public void setClearingCrYN(Boolean clearingCrYN) {
		this.clearingCrYN = clearingCrYN;
	}
	public String getGeneralLadger() {
		return generalLadger;
	}

	public void setGeneralLadger(String generalLadger) {
		this.generalLadger = generalLadger;
	}

}
