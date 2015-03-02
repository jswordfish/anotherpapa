package com.infrasofttech.domain.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class TxnVoucherAuthProcess extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	private Integer txnNoFK = 0;

	private String voucherNumber = "";

	@Temporal(TemporalType.TIMESTAMP)
	private Date oprnDate;

	private String voucherStatusCode = "";

	private Boolean isActive = true;

	public Integer getTxnNoFK() {
		return txnNoFK;
	}

	public void setTxnNoFK(Integer txnNoFK) {
		this.txnNoFK = txnNoFK;
	}

	public String getVoucherNumber() {
		return voucherNumber;
	}

	public void setVoucherNumber(String voucherNumber) {
		this.voucherNumber = voucherNumber;
	}

	public Date getOprnDate() {
		return oprnDate;
	}

	public void setOprnDate(Date oprnDate) {
		this.oprnDate = oprnDate;
	}

	public String getVoucherStatusCode() {
		return voucherStatusCode;
	}

	public void setVoucherStatusCode(String voucherStatusCode) {
		this.voucherStatusCode = voucherStatusCode;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

}
