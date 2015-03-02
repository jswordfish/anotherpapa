package com.infrasofttech.utils;

import java.util.ArrayList;
import java.util.List;

import com.infrasofttech.domain.entities.MenuMst;

public class SetOfSectionMenuz {

	private String tenantId;
	
	private String sectionCode;
	
	private List<MenuMst> menuz = new ArrayList<MenuMst>();

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getSectionCode() {
		return sectionCode;
	}

	public void setSectionCode(String sectionCode) {
		this.sectionCode = sectionCode;
	}

	public List<MenuMst> getMenuz() {
		return menuz;
	}

	public void setMenuz(List<MenuMst> menuz) {
		this.menuz = menuz;
	}
}
