package com.infrasofttech.utils;

public class RoleAccessControl {

	private String roleCode;
	private String moduleCode;
	private String sectionCode;
	private String menuCode;
	private String[] actionCodes;
	
	public RoleAccessControl(){
	}
	
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	public String getModuleCode() {
		return moduleCode;
	}
	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}
	public String getSectionCode() {
		return sectionCode;
	}
	public void setSectionCode(String sectionCode) {
		this.sectionCode = sectionCode;
	}
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	public String[] getActionCodes() {
		return actionCodes;
	}
	public void setActionCodes(String[] actionCodes) {
		this.actionCodes = actionCodes;
	}
	
	
}
