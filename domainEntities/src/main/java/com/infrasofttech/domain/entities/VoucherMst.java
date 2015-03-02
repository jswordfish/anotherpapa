package com.infrasofttech.domain.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class VoucherMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	private String bookTypeCode = "";

	private String voucherTypeCode = ""; // from VoucherTypeMst

	private String voucherNumber = "";

	private String branchCode = "";

	private String moduleCode = "";

	private String productCode = "";

	private String activityCode = "";

	private String currencyCode = "";

	private String txnCode = "";

	@ManyToOne
	@JoinColumn(name = "fkTxnHeaderPK")
	private TxnHeader txnHeader;

	private String prdAcNo = "";

	private String batchCode = "";

	private Integer setNo = 0;

	private Integer scrollNo = 0;

	private Integer mainScrollNo = 0;

	private Date entryDateTime;

	private Date postDateTime;

	private Date authorizeDateTime;

	private Date fundingDateTime;

	private Date valueDate;

	private String DrCr = "";

	private String vcrAcNo = "";

	private String mainAcNo = "";

	private Integer vcrModType = 0;

	private Integer mainModType = 0;

	private Double fcyTxnAmount = 0D;

	private Double lcyConvRate = 0D;

	private Double lcyTxnAmt = 0D;

	private String instrBankCode = "";

	private String instrBranchCode = "";

	private String instrTypeCode = "";

	private String instrNumber = "";

	private Date instrDate;

	private String tokenNumber = "";

	private String particulars = "";

	private Integer sysGenVcr = 0;

	private Integer postFlag = 0;

	private Integer authFlag = 0;

	private Integer feffFlag = 0;

	private Integer cancelledFlag;

	private String postAuthfeffCncl = "";

	private String updateChkId = "";

	private Double partClearAmount = 0D;

	public String getBookTypeCode() {
		return bookTypeCode;
	}

	public void setBookTypeCode(String bookTypeCode) {
		this.bookTypeCode = bookTypeCode;
	}

	public String getVoucherTypeCode() {
		return voucherTypeCode;
	}

	public void setVoucherTypeCode(String voucherTypeCode) {
		this.voucherTypeCode = voucherTypeCode;
	}

	public String getVoucherNumber() {
		return voucherNumber;
	}

	public void setVoucherNumber(String voucherNumber) {
		this.voucherNumber = voucherNumber;
	}

	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public String getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getActivityCode() {
		return activityCode;
	}

	public void setActivityCode(String activityCode) {
		this.activityCode = activityCode;
	}

	public String getCurrencyCode() {
		return currencyCode;
	}

	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}

	public String getTxnCode() {
		return txnCode;
	}

	public void setTxnCode(String txnCode) {
		this.txnCode = txnCode;
	}

	public TxnHeader getTxnHeader() {
		return txnHeader;
	}

	public void setTxnHeader(TxnHeader txnHeader) {
		this.txnHeader = txnHeader;
	}

	public String getPrdAcNo() {
		return prdAcNo;
	}

	public void setPrdAcNo(String prdAcNo) {
		this.prdAcNo = prdAcNo;
	}

	public String getBatchCode() {
		return batchCode;
	}

	public void setBatchCode(String batchCode) {
		this.batchCode = batchCode;
	}

	public Integer getSetNo() {
		return setNo;
	}

	public void setSetNo(Integer setNo) {
		this.setNo = setNo;
	}

	public Integer getScrollNo() {
		return scrollNo;
	}

	public void setScrollNo(Integer scrollNo) {
		this.scrollNo = scrollNo;
	}

	public Integer getMainScrollNo() {
		return mainScrollNo;
	}

	public void setMainScrollNo(Integer mainScrollNo) {
		this.mainScrollNo = mainScrollNo;
	}

	public Date getEntryDateTime() {
		return entryDateTime;
	}

	public void setEntryDateTime(Date entryDateTime) {
		this.entryDateTime = entryDateTime;
	}

	public Date getPostDateTime() {
		return postDateTime;
	}

	public void setPostDateTime(Date postDateTime) {
		this.postDateTime = postDateTime;
	}

	public Date getAuthorizeDateTime() {
		return authorizeDateTime;
	}

	public void setAuthorizeDateTime(Date authorizeDateTime) {
		this.authorizeDateTime = authorizeDateTime;
	}

	public Date getFundingDateTime() {
		return fundingDateTime;
	}

	public void setFundingDateTime(Date fundingDateTime) {
		this.fundingDateTime = fundingDateTime;
	}

	public Date getValueDate() {
		return valueDate;
	}

	public void setValueDate(Date valueDate) {
		this.valueDate = valueDate;
	}

	public String getDrCr() {
		return DrCr;
	}

	public void setDrCr(String drCr) {
		DrCr = drCr;
	}

	public String getVcrAcNo() {
		return vcrAcNo;
	}

	public void setVcrAcNo(String vcrAcNo) {
		this.vcrAcNo = vcrAcNo;
	}

	public String getMainAcNo() {
		return mainAcNo;
	}

	public void setMainAcNo(String mainAcNo) {
		this.mainAcNo = mainAcNo;
	}

	public Integer getVcrModType() {
		return vcrModType;
	}

	public void setVcrModType(Integer vcrModType) {
		this.vcrModType = vcrModType;
	}

	public Integer getMainModType() {
		return mainModType;
	}

	public void setMainModType(Integer mainModType) {
		this.mainModType = mainModType;
	}

	public Double getFcyTxnAmount() {
		return fcyTxnAmount;
	}

	public void setFcyTxnAmount(Double fcyTxnAmount) {
		this.fcyTxnAmount = fcyTxnAmount;
	}

	public Double getLcyConvRate() {
		return lcyConvRate;
	}

	public void setLcyConvRate(Double lcyConvRate) {
		this.lcyConvRate = lcyConvRate;
	}

	public Double getLcyTxnAmt() {
		return lcyTxnAmt;
	}

	public void setLcyTxnAmt(Double lcyTxnAmt) {
		this.lcyTxnAmt = lcyTxnAmt;
	}

	public String getInstrBankCode() {
		return instrBankCode;
	}

	public void setInstrBankCode(String instrBankCode) {
		this.instrBankCode = instrBankCode;
	}

	public String getInstrBranchCode() {
		return instrBranchCode;
	}

	public void setInstrBranchCode(String instrBranchCode) {
		this.instrBranchCode = instrBranchCode;
	}

	public String getInstrTypeCode() {
		return instrTypeCode;
	}

	public void setInstrTypeCode(String instrTypeCode) {
		this.instrTypeCode = instrTypeCode;
	}

	public String getInstrNumber() {
		return instrNumber;
	}

	public void setInstrNumber(String instrNumber) {
		this.instrNumber = instrNumber;
	}

	public Date getInstrDate() {
		return instrDate;
	}

	public void setInstrDate(Date instrDate) {
		this.instrDate = instrDate;
	}

	public String getTokenNumber() {
		return tokenNumber;
	}

	public void setTokenNumber(String tokenNumber) {
		this.tokenNumber = tokenNumber;
	}

	public String getParticulars() {
		return particulars;
	}

	public void setParticulars(String particulars) {
		this.particulars = particulars;
	}

	public Integer getSysGenVcr() {
		return sysGenVcr;
	}

	public void setSysGenVcr(Integer sysGenVcr) {
		this.sysGenVcr = sysGenVcr;
	}

	public Integer getPostFlag() {
		return postFlag;
	}

	public void setPostFlag(Integer postFlag) {
		this.postFlag = postFlag;
	}

	public Integer getAuthFlag() {
		return authFlag;
	}

	public void setAuthFlag(Integer authFlag) {
		this.authFlag = authFlag;
	}

	public Integer getFeffFlag() {
		return feffFlag;
	}

	public void setFeffFlag(Integer feffFlag) {
		this.feffFlag = feffFlag;
	}

	public Integer getCancelledFlag() {
		return cancelledFlag;
	}

	public void setCancelledFlag(Integer cancelledFlag) {
		this.cancelledFlag = cancelledFlag;
	}

	public String getPostAuthfeffCncl() {
		return postAuthfeffCncl;
	}

	public void setPostAuthfeffCncl(String postAuthfeffCncl) {
		this.postAuthfeffCncl = postAuthfeffCncl;
	}

	public String getUpdateChkId() {
		return updateChkId;
	}

	public void setUpdateChkId(String updateChkId) {
		this.updateChkId = updateChkId;
	}

	public Double getPartClearAmount() {
		return partClearAmount;
	}

	public void setPartClearAmount(Double partClearAmount) {
		this.partClearAmount = partClearAmount;
	}

}
