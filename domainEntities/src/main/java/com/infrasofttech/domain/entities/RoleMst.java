package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
@NamedQueries({ 
	@NamedQuery(name = "RoleMst.getRoleMstByTenantNRole", query = "SELECT r FROM RoleMst r WHERE r.tenantId=:tenantId AND roleCode=:roleCode AND isActive=true"),
	@NamedQuery(name = "RoleMst.getRoleMstByTenantNRoleNIsActive", query = "SELECT r FROM RoleMst r WHERE r.tenantId=:tenantId AND roleCode=:roleCode AND isActive=false")
	})
public class RoleMst extends Base {
	
	private static final long serialVersionUID = 1701926931204630606L;

	@Column(length = 20, nullable = true)
	private String roleCode = "";

	@Column(length = 50, nullable = true)
	private String roleName = "";

	@Column(nullable = true)
	private Boolean isActive = true;

	@Column(nullable = true, length = 30)
	private String authStatus = "";

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public String getAuthStatus() {
		return authStatus;
	}

	public void setAuthStatus(String authStatus) {
		this.authStatus = authStatus;
	}
}
