package com.infrasofttech.domain.entities;

import javax.persistence.Entity;

@Entity
public class TxnTypeBatchMap extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	private String txnTypeCode = ""; // from lookup

	private String activityCode = "";

	private String batchTypeCode = "";

	private String batchTypeName = "";

	public String getTxnTypeCode() {
		return txnTypeCode;
	}

	public void setTxnTypeCode(String txnTypeCode) {
		this.txnTypeCode = txnTypeCode;
	}

	public String getActivityCode() {
		return activityCode;
	}

	public void setActivityCode(String activityCode) {
		this.activityCode = activityCode;
	}

	public String getBatchTypeCode() {
		return batchTypeCode;
	}

	public void setBatchTypeCode(String batchTypeCode) {
		this.batchTypeCode = batchTypeCode;
	}

	public String getBatchTypeName() {
		return batchTypeName;
	}

	public void setBatchTypeName(String batchTypeName) {
		this.batchTypeName = batchTypeName;
	}

}
