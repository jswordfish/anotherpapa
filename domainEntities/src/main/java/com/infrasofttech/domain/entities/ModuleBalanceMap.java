package com.infrasofttech.domain.entities;

import javax.persistence.Entity;

@Entity
public class ModuleBalanceMap extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	private String moduleCode = "";

	private String balanceCode = "";

	public String getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}

	public String getBalanceCode() {
		return balanceCode;
	}

	public void setBalanceCode(String balanceCode) {
		this.balanceCode = balanceCode;
	}

}
