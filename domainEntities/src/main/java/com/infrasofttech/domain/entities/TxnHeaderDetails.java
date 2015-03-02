package com.infrasofttech.domain.entities;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class TxnHeaderDetails extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	private String colKey = "";
	private String colValue = "";

	@ManyToOne
	@JoinColumn(name = "fkTxnHeaderPk")
	private TxnHeader txnHeader;

	public String getColKey() {
		return colKey;
	}

	public void setColKey(String colKey) {
		this.colKey = colKey;
	}

	public String getColValue() {
		return colValue;
	}

	public void setColValue(String colValue) {
		this.colValue = colValue;
	}

	public TxnHeader getTxnHeader() {
		return txnHeader;
	}

	public void setTxnHeader(TxnHeader txnHeader) {
		this.txnHeader = txnHeader;
	}
}
