package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class UserBranchRoleMap extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@ManyToOne
	@JoinColumn(name = "fkUserBranchPk")
	private UserBranchMap userBranchMap;

	@Column(length = 20, nullable = true)
	private String roleCode = "";

	@Column(nullable = true)
	private Boolean isActive = true;

	public UserBranchMap getUserBranchMap() {
		return userBranchMap;
	}

	public void setUserBranchMap(UserBranchMap userBranchMap) {
		this.userBranchMap = userBranchMap;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
}
