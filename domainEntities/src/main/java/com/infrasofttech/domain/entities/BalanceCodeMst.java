package com.infrasofttech.domain.entities;

import javax.persistence.Entity;

@Entity
public class BalanceCodeMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	private String balanceCode = "";

	private String balanceName = "";

	public String getBalanceCode() {
		return balanceCode;
	}

	public void setBalanceCode(String balanceCode) {
		this.balanceCode = balanceCode;
	}

	public String getBalanceName() {
		return balanceName;
	}

	public void setBalanceName(String balanceName) {
		this.balanceName = balanceName;
	}
}
