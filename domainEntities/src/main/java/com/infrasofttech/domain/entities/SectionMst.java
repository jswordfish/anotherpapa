package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
@NamedQueries({
		@NamedQuery(name = "SectionMst.getSectionsByTenantNLang", query = "SELECT s FROM SectionMst s WHERE s.tenantId=:tenantId AND s.languageCode=:languageCode"),
		@NamedQuery(name = "SectionMst.getSectionsByTenantNLangNCode", query = "SELECT s FROM SectionMst s WHERE s.tenantId=:tenantId "
				+ " AND s.languageCode=:languageCode AND s.sectionCode=:sectionCode") })
public class SectionMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(length = 20, nullable = true)
	private String sectionCode = ""; // sectionCode will remain same across all
										// languageCodes

	@Column(length = 50, nullable = true)
	private String sectionName = "";

	@Column(length = 10, nullable = true)
	private String languageCode = "";

	@Column(length = 255, nullable = true)
	private String sectionIcon = "";

	@Column(nullable = true)
	private Boolean isActive = true;

	public String getSectionCode() {
		return sectionCode;
	}

	public void setSectionCode(String sectionCode) {
		this.sectionCode = sectionCode;
	}

	public String getSectionName() {
		return sectionName;
	}

	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}

	public String getLanguageCode() {
		return languageCode;
	}

	public void setLanguageCode(String languageCode) {
		this.languageCode = languageCode;
	}

	public String getSectionIcon() {
		return sectionIcon;
	}

	public void setSectionIcon(String sectionIcon) {
		this.sectionIcon = sectionIcon;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
}
