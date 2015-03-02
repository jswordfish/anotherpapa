package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
public class TxnHeader extends Base {

	private static final long serialVersionUID = 1701926931204630606L;
	private Integer txnNo = 0;
	private String branchCode = "";
	private String txnTypeCode = "";
	private String prdAcNum = "";
	private String activityCode = "";
	private String currencyCode = "";
	private String moduleCode = "";
	private String productCode = "";
	private String customerId = "";
	private String customerName = "";

	@OneToMany(mappedBy = "txnHeader", cascade = CascadeType.ALL)
	@Fetch(FetchMode.SELECT)
	private Collection<TxnHeaderDetails> txnHeaderDetails = new ArrayList<TxnHeaderDetails>();

	/*
	 * public Long getId() { return id; }
	 * 
	 * public void setId(Long id) { this.id = id; }
	 */

	public String getTxnTypeCode() {
		return txnTypeCode;
	}

	public void setTxnTypeCode(String txnTypeCode) {
		this.txnTypeCode = txnTypeCode;
	}

	public String getPrdAcNum() {
		return prdAcNum;
	}

	public void setPrdAcNum(String prdAcNum) {
		this.prdAcNum = prdAcNum;
	}

	public String getActivityCode() {
		return activityCode;
	}

	public void setActivityCode(String activityCode) {
		this.activityCode = activityCode;
	}

	public String getCurrencyCode() {
		return currencyCode;
	}

	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}

	public Collection<TxnHeaderDetails> getTxnHeaderDetails() {
		return txnHeaderDetails;
	}

	public void setTxnHeaderDetails(
			Collection<TxnHeaderDetails> txnHeaderDetails) {
		this.txnHeaderDetails = txnHeaderDetails;
	}

}
