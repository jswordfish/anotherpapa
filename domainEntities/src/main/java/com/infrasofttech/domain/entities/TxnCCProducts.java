package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class TxnCCProducts extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@ManyToOne
	@JoinColumn(name = "fkModuleDefKeyPK", nullable = true, updatable = true)
	private TxnCCMain txnCCMain;

	@Column(length = 20, nullable = true)
	private String productCodes = "";

	@Column
	private Boolean isActive = true;

	public TxnCCMain getTxnCCMain() {
		return txnCCMain;
	}

	public void setTxnCCMain(TxnCCMain txnCCMain) {
		this.txnCCMain = txnCCMain;
	}

	public String getProductCodes() {
		return productCodes;
	}

	public void setProductCodes(String productCodes) {
		this.productCodes = productCodes;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
}
