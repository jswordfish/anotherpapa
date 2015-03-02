package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.infrasofttech.utils.AUTHMODE;
import com.infrasofttech.utils.MENUACTIONSTATUS;

@Entity
@NamedQueries({
		@NamedQuery(name = "MenuMst.getMenuzByLanguage", query = "SELECT m FROM MenuMst m "
				+ "WHERE m.tenantId=:tenantId AND m.languageCode=:languageCode"),
		@NamedQuery(name = "MenuMst.getMenuzByTenantNLang", query = "SELECT m FROM MenuMst m "
				+ "WHERE m.tenantId=:tenantId AND m.languageCode=:languageCode"),
		@NamedQuery(name = "MenuMst.getMenuMstByMenuCodeNLanguage", query = "SELECT m FROM MenuMst m "
				+ "WHERE m.tenantId=:tenantId AND m.languageCode=:languageCode AND m.menuCode=:menuCode"),
		@NamedQuery(name = "MenuMst.getMenuMstByTenantNMKRCKR", query = "SELECT m FROM MenuMst m "
				+ "WHERE m.tenantId=:tenantId AND m.isMakerChecker=true "),
		@NamedQuery(name = "MenuMst.getMenuMstBytenantNMenuCode", query = "SELECT m FROM MenuMst m "
				+ "WHERE m.tenantId=:tenantId AND m.menuCode=:menuCode")
})
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "tenantId",
		"menuCode", "languageCode" }))
public class MenuMst extends Base implements Comparable<MenuMst> {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(length = 20, nullable = true)
	private String menuCode = ""; // menuCode will remain same across all
									// languageCodes
	
	@Column(length = 100, nullable = true)
	private Boolean isMakerChecker = false; // Authorization Purpose


	@Column(length = 100, nullable = true)
	private String menuName = "";

	@Column(length = 500, nullable = true)
	private String menuFilePath = "";

	@Column(length = 255, nullable = true)
	private String menuIcon = "";

	@Column(nullable = true, length = 10)
	private String languageCode = "";

	@Column(nullable = true, length = 30)
	private String sectionCode = "";

	@Column(nullable = true, length = 30)
	private String sectionDisplayName = "";

	@Column(nullable = true)
	private MENUACTIONSTATUS createAction;
	@Column(nullable = true)
	private MENUACTIONSTATUS updateAction;
	@Column(nullable = true)
	private MENUACTIONSTATUS deleteAction;
	@Column(nullable = true)
	private MENUACTIONSTATUS viewAction;
	@Column(nullable = true)
	private MENUACTIONSTATUS searchAction;
	@Column(nullable = true)
	private MENUACTIONSTATUS disableAction;
	@Column(nullable = true)
	private MENUACTIONSTATUS enableAction;
	@Column(nullable = true)
	private MENUACTIONSTATUS downloadAction;
	@Column(nullable = true)
	private MENUACTIONSTATUS authorizeAction;
	@Column(nullable = true)
	private MENUACTIONSTATUS rejectAction;
	@Column(nullable = true)
	private MENUACTIONSTATUS printAction;
	@Column(nullable = true)
	private MENUACTIONSTATUS emailAction;
	@Column(nullable = true)
	private MENUACTIONSTATUS smsAction;

	@Column(nullable = true, length = 30)
	private AUTHMODE authMode = AUTHMODE.MKRCKR;

	@Column(nullable = true)
	private Boolean isActive = true;

	public AUTHMODE getAuthMode() {
		return authMode;
	}

	public void setAuthMode(AUTHMODE authMode) {
		this.authMode = authMode;
	}

	public String getMenuCode() {
		return menuCode;
	}

	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuFilePath() {
		return menuFilePath;
	}

	public void setMenuFilePath(String menuFilePath) {
		this.menuFilePath = menuFilePath;
	}

	public String getMenuIcon() {
		return menuIcon;
	}

	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}

	public String getLanguageCode() {
		return languageCode;
	}

	public void setLanguageCode(String languageCode) {
		this.languageCode = languageCode;
	}

	public String getSectionCode() {
		return sectionCode;
	}

	public void setSectionCode(String sectionCode) {
		this.sectionCode = sectionCode;
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

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public String getSectionDisplayName() {
		return sectionDisplayName;
	}

	public void setSectionDisplayName(String sectionDisplayName) {
		this.sectionDisplayName = sectionDisplayName;
	}

	public int compareTo(MenuMst arg0) {
		// TODO Auto-generated method stub
		return 0;
	}

}
