package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
@NamedQueries({ @NamedQuery(name = "ModuleMst.getModuleMst", query = "SELECT m FROM ModuleMst m WHERE m.moduleCode=:moduleCode AND m.tenantId=:tenantId"
		+ " AND isActive=true ") })
public class ModuleMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(length = 20, nullable = true)
	private String moduleCode = "";
	@Column(length = 100, nullable = true)
	private String moduleName = "";
	@Column(length = 200, nullable = true)
	private String moduleDesc = "";

	@Column(nullable = true)
	private Boolean isActive = true;

	public String getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getModuleDesc() {
		return moduleDesc;
	}

	public void setModuleDesc(String moduleDesc) {
		this.moduleDesc = moduleDesc;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
}
