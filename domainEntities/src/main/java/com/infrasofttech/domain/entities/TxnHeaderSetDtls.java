package com.infrasofttech.domain.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class TxnHeaderSetDtls extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	private Integer txnNoFK = 0;

	private Integer setNo = 0;

	private Integer scrollNo = 0;

	private Integer mainScrollNo = 0;

	private Boolean isActive = true;

	@Temporal(TemporalType.TIMESTAMP)
	private Date oprnDate;

	public Integer getTxnNoFK() {
		return txnNoFK;
	}

	public void setTxnNoFK(Integer txnNoFK) {
		this.txnNoFK = txnNoFK;
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

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public Date getOprnDate() {
		return oprnDate;
	}

	public void setOprnDate(Date oprnDate) {
		this.oprnDate = oprnDate;
	}
}
