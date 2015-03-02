package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class TxnCCDtls {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(length = 20, nullable = true)
	private String tenantCode = "";

	@ManyToOne
	@JoinColumn(name = "fkModuleDefKeyPK", nullable = true, updatable = true)
	private TxnCCMain txnCCMain;

	@Column(nullable = true)
	private Integer rowNumber = 0;

	@Column(nullable = true)
	private String Column1Code = "";

	@Column(nullable = true)
	private String Column2Code = "";

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

	public Integer getRowNumber() {
		return rowNumber;
	}

	public void setRowNumber(Integer rowNumber) {
		this.rowNumber = rowNumber;
	}

	public String getColumn1Code() {
		return Column1Code;
	}

	public void setColumn1Code(String column1Code) {
		Column1Code = column1Code;
	}

	public String getColumn2Code() {
		return Column2Code;
	}

	public void setColumn2Code(String column2Code) {
		Column2Code = column2Code;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
}
