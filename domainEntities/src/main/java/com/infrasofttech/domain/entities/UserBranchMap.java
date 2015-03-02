package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

@Entity
@NamedQueries({ @NamedQuery(name = "UserBranch.getBranchUser", query = "SELECT ub FROM UserBranchMap ub WHERE ub.loginId=:loginId "
		+ " AND ub.tenantId=:tenantId AND ub.branchCode=:branchCode ") })
public class UserBranchMap extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(length = 20, nullable = true)
	private String branchCode = "";

	@Column(length = 20, nullable = true)
	private String loginId = "";

	@OneToMany(mappedBy = "userBranchMap", cascade = CascadeType.ALL)
	private Collection<UserBranch_RoleMap> userBranch_RoleMaps = new ArrayList<UserBranch_RoleMap>();

	@Column(nullable = true)
	private Boolean isActive = true;

	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public Collection<UserBranch_RoleMap> getUserBranch_RoleMaps() {
		return userBranch_RoleMaps;
	}

	public void setUserBranch_RoleMaps(
			Collection<UserBranch_RoleMap> userBranch_RoleMaps) {
		this.userBranch_RoleMaps = userBranch_RoleMaps;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
}
