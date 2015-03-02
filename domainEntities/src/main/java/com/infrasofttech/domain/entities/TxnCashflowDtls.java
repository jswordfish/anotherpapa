package com.infrasofttech.domain.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class TxnCashflowDtls extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	private Integer txnNoFK = 0;

	private String cashflowCode = "";

	@Temporal(TemporalType.DATE)
	private Date entryDate;

	public Integer getTxnNoFK() {
		return txnNoFK;
	}

	public void setTxnNoFK(Integer txnNoFK) {
		this.txnNoFK = txnNoFK;
	}

	public String getCashflowCode() {
		return cashflowCode;
	}

	public void setCashflowCode(String cashflowCode) {
		this.cashflowCode = cashflowCode;
	}

	public Date getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}

}
