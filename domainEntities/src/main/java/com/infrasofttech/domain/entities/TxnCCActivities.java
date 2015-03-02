package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class TxnCCActivities {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(length = 20, nullable = true)
	private String tenantCode = "";

	@ManyToOne
	@JoinColumn(name = "fkModuleDefKeyPK", nullable = true, updatable = true)
	private TxnCCMain txnCCMain;

	@Column(length = 20, nullable = true)
	private String activtyCodes = "";

	@Column
	private Boolean isActive = true;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTenantCode() {
		return tenantCode;
	}

	public void setTenantCode(String tenantCode) {
		this.tenantCode = tenantCode;
	}

	public TxnCCMain getTxnCCMain() {
		return txnCCMain;
	}

	public void setTxnCCMain(TxnCCMain txnCCMain) {
		this.txnCCMain = txnCCMain;
	}

	public String getActivtyCodes() {
		return activtyCodes;
	}

	public void setActivtyCodes(String activtyCodes) {
		this.activtyCodes = activtyCodes;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
}
