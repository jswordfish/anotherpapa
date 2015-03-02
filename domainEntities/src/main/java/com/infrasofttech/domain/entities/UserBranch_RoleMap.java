package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
@NamedQueries({ @NamedQuery(name = "UserBranch_RoleMap.getUserBranch_RoleMap", query = "SELECT u FROM UserBranch_RoleMap u WHERE u.tenantId=:tenantId "
		+ " AND u.roleCode=:roleCode AND u.isActive=true")
})
public class UserBranch_RoleMap extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@ManyToOne
	@JoinColumn(name = "fkUserBranchPk")
	private UserBranchMap userBranchMap;

	@Column(length = 20, nullable = true)
	private String roleCode = "";

	@Column(nullable = true)
	private Boolean isActive = true;

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public UserBranchMap getUserBranchMap() {
		return userBranchMap;
	}

	public UserBranchMap setUserBranchMap(UserBranchMap userBranchMap) {
		return this.userBranchMap = userBranchMap;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public String setRoleCode(String roleCode) {
		return this.roleCode = roleCode;
	}

	public UserBranch_RoleMap() {
		// TODO Auto-generated constructor stub
	}

	public UserBranch_RoleMap(UserBranchMap userBranchMap, String roleCode) {
		super();
		this.userBranchMap = userBranchMap;
		this.roleCode = roleCode;
	}

}
