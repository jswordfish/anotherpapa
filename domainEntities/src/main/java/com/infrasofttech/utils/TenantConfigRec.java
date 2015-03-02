package com.infrasofttech.utils;

public class TenantConfigRec {
	
	String tenantId;
	
	BranchConfigRec brConfigRec;

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public BranchConfigRec getBrConfigRec() {
		return brConfigRec;
	}

	public void setBrConfigRec(BranchConfigRec brConfigRec) {
		this.brConfigRec = brConfigRec;
	}
}
