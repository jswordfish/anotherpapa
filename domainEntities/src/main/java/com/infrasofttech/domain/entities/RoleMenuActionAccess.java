package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

import com.infrasofttech.utils.MENUACTIONSTATUS;

@Entity
@NamedQueries({
		@NamedQuery(name = "RMAA.getRMAAByTenantNMenu", query = "SELECT r FROM RoleMenuActionAccess r "
				+ " WHERE r.menuCode=:menuCode AND r.tenantId=:tenantId"),
		@NamedQuery(name = "RMAA.getALLRMAAByTenant", query = "SELECT r FROM RoleMenuActionAccess r "
				+ " WHERE r.tenantId=:tenantId"),
		@NamedQuery(name = "RMAA.getRMAAByTenantAndRoleCodeAndMenuCode", query = "SELECT r FROM RoleMenuActionAccess r "
				+ " WHERE r.tenantId=:tenantId AND r.roleMstCode=:roleMstCode AND r.menuCode=:menuCode"),
		@NamedQuery(name = "RMAA.getALLRMAAByTenantAndRoleCode", query = "SELECT r FROM RoleMenuActionAccess r "
				+ " WHERE r.tenantId=:tenantId AND r.roleMstCode=:roleMstCode") })
public class RoleMenuActionAccess extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	// @ManyToOne(cascade = CascadeType.ALL)
	// @JoinColumn(name = "fkRoleMstPk")
	// private RoleMst roleMst;

	@Column(nullable = true)
	private String roleMstCode = "";

	@Column(nullable = true)
	private String menuCode = "";

	@Column(nullable = true)
	private MENUACTIONSTATUS createAction = MENUACTIONSTATUS.INACTIVE;
	@Column(nullable = true)
	private MENUACTIONSTATUS updateAction = MENUACTIONSTATUS.INACTIVE;
	@Column(nullable = true)
	private MENUACTIONSTATUS deleteAction = MENUACTIONSTATUS.INACTIVE;
	@Column(nullable = true)
	private MENUACTIONSTATUS viewAction = MENUACTIONSTATUS.INACTIVE;
	@Column(nullable = true)
	private MENUACTIONSTATUS searchAction = MENUACTIONSTATUS.INACTIVE;
	@Column(nullable = true)
	private MENUACTIONSTATUS disableAction = MENUACTIONSTATUS.INACTIVE;
	@Column(nullable = true)
	private MENUACTIONSTATUS enableAction = MENUACTIONSTATUS.INACTIVE;
	@Column(nullable = true)
	private MENUACTIONSTATUS downloadAction = MENUACTIONSTATUS.INACTIVE;
	@Column(nullable = true)
	private MENUACTIONSTATUS authorizeAction = MENUACTIONSTATUS.INACTIVE;
	@Column(nullable = true)
	private MENUACTIONSTATUS rejectAction = MENUACTIONSTATUS.INACTIVE;
	@Column(nullable = true)
	private MENUACTIONSTATUS printAction = MENUACTIONSTATUS.INACTIVE;
	@Column(nullable = true)
	private MENUACTIONSTATUS emailAction = MENUACTIONSTATUS.INACTIVE;
	@Column(nullable = true)
	private MENUACTIONSTATUS smsAction = MENUACTIONSTATUS.INACTIVE;

	public String getRoleMstCode() {
		return roleMstCode;
	}

	public void setRoleMstCode(String roleMstCode) {
		this.roleMstCode = roleMstCode;
	}

	public String getMenuCode() {
		return menuCode;
	}

	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}

	public MENUACTIONSTATUS getCreateAction() {
		return createAction;
	}

	public void setCreateAction(MENUACTIONSTATUS createAction) {
		this.createAction = createAction;
	}

	public MENUACTIONSTATUS getUpdateAction() {
		return updateAction;
	}

	public void setUpdateAction(MENUACTIONSTATUS updateAction) {
		this.updateAction = updateAction;
	}

	public MENUACTIONSTATUS getDeleteAction() {
		return deleteAction;
	}

	public void setDeleteAction(MENUACTIONSTATUS deleteAction) {
		this.deleteAction = deleteAction;
	}

	public MENUACTIONSTATUS getViewAction() {
		return viewAction;
	}

	public void setViewAction(MENUACTIONSTATUS viewAction) {
		this.viewAction = viewAction;
	}

	public MENUACTIONSTATUS getSearchAction() {
		return searchAction;
	}

	public void setSearchAction(MENUACTIONSTATUS searchAction) {
		this.searchAction = searchAction;
	}

	public MENUACTIONSTATUS getDisableAction() {
		return disableAction;
	}

	public void setDisableAction(MENUACTIONSTATUS disableAction) {
		this.disableAction = disableAction;
	}

	public MENUACTIONSTATUS getEnableAction() {
		return enableAction;
	}

	public void setEnableAction(MENUACTIONSTATUS enableAction) {
		this.enableAction = enableAction;
	}

	public MENUACTIONSTATUS getDownloadAction() {
		return downloadAction;
	}

	public void setDownloadAction(MENUACTIONSTATUS downloadAction) {
		this.downloadAction = downloadAction;
	}

	public MENUACTIONSTATUS getAuthorizeAction() {
		return authorizeAction;
	}

	public void setAuthorizeAction(MENUACTIONSTATUS authorizeAction) {
		this.authorizeAction = authorizeAction;
	}

	public MENUACTIONSTATUS getRejectAction() {
		return rejectAction;
	}

	public void setRejectAction(MENUACTIONSTATUS rejectAction) {
		this.rejectAction = rejectAction;
	}

	public MENUACTIONSTATUS getPrintAction() {
		return printAction;
	}

	public void setPrintAction(MENUACTIONSTATUS printAction) {
		this.printAction = printAction;
	}

	public MENUACTIONSTATUS getEmailAction() {
		return emailAction;
	}

	public void setEmailAction(MENUACTIONSTATUS emailAction) {
		this.emailAction = emailAction;
	}

	public MENUACTIONSTATUS getSmsAction() {
		return smsAction;
	}

	public void setSmsAction(MENUACTIONSTATUS smsAction) {
		this.smsAction = smsAction;
	}
}
