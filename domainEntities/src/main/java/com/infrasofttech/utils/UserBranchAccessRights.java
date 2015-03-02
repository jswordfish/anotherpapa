package com.infrasofttech.utils;

import java.util.ArrayList;
import java.util.List;

public class UserBranchAccessRights {

	private String loginId;
	private String branchCode;
	private List<RoleAccessControl> roleAccessControls=new ArrayList<RoleAccessControl>();
	
	public UserBranchAccessRights(){
	}
	
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public List<RoleAccessControl> getRoleAccessControls() {
		return roleAccessControls;
	}

	public void setRoleAccessControls(List<RoleAccessControl> roleAccessControls) {
		this.roleAccessControls = roleAccessControls;
	}
	
	
	
}
