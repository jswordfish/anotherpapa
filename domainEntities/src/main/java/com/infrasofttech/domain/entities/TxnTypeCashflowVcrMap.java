package com.infrasofttech.domain.entities;

import javax.persistence.Entity;

@Entity
public class TxnTypeCashflowVcrMap extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	private String txnType = "";

	private String moduleCode = "";

	private String activityCode = "";

	private String cashflowCode = "";

	private String voucherTypeCode = "";

	public String getTxnType() {
		return txnType;
	}

	public void setTxnType(String txnType) {
		this.txnType = txnType;
	}

	public String getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}

	public String getActivityCode() {
		return activityCode;
	}

	public void setActivityCode(String activityCode) {
		this.activityCode = activityCode;
	}

	public String getCashflowCode() {
		return cashflowCode;
	}

	public void setCashflowCode(String cashflowCode) {
		this.cashflowCode = cashflowCode;
	}

	public String getVoucherTypeCode() {
		return voucherTypeCode;
	}

	public void setVoucherTypeCode(String voucherTypeCode) {
		this.voucherTypeCode = voucherTypeCode;
	}
}
