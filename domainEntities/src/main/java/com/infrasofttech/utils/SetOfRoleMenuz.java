package com.infrasofttech.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.infrasofttech.domain.entities.MenuMst;

public class SetOfRoleMenuz {

	private String tenantId;

	private String languageCode;
	
	private String roleCode;
	
	private Map<String, List<MenuMst>> mSectionMenuz = new HashMap<String, List<MenuMst>>();

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getLanguageCode() {
		return languageCode;
	}

	public void setLanguageCode(String languageCode) {
		this.languageCode = languageCode;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public Map<String, List<MenuMst>> getmSectionMenuz() {
		return mSectionMenuz;
	}

	public void setmSectionMenuz(Map<String, List<MenuMst>> mSectionMenuz) {
		this.mSectionMenuz = mSectionMenuz;
	}
	
	public Map<String, List<MenuMst>> getMenuz(String tenantId, String languageCode, String roleCode){
		//TODO ...
		return mSectionMenuz;
	}
}
