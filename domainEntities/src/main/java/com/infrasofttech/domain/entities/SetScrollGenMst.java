package com.infrasofttech.domain.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class SetScrollGenMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Temporal(TemporalType.TIMESTAMP)
	private Date txnDate;

	private Integer currentSetNo = 0;

	private Integer currentScrollNo = 0;

	private Integer currentMainScrollNo = 0;

	public Date getTxnDate() {
		return txnDate;
	}

	public void setTxnDate(Date txnDate) {
		this.txnDate = txnDate;
	}

	public Integer getCurrentSetNo() {
		return currentSetNo;
	}

	public void setCurrentSetNo(Integer currentSetNo) {
		this.currentSetNo = currentSetNo;
	}

	public Integer getCurrentScrollNo() {
		return currentScrollNo;
	}

	public void setCurrentScrollNo(Integer currentScrollNo) {
		this.currentScrollNo = currentScrollNo;
	}

	public Integer getCurrentMainScrollNo() {
		return currentMainScrollNo;
	}

	public void setCurrentMainScrollNo(Integer currentMainScrollNo) {
		this.currentMainScrollNo = currentMainScrollNo;
	}

}
