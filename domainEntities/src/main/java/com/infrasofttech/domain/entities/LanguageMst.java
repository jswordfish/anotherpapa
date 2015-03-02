package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@NamedQueries({
		@NamedQuery(name = "LanguageMst.getlanguage", query = "SELECT l FROM LanguageMst l WHERE l.languageCode=:languageCode "
				+ " AND l.tenantId=:tenantId AND l.isActive=true") })
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "tenantId",
		"languageCode" }))
public class LanguageMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(length = 20, nullable = true, unique = true)
	private String languageCode = ""; // en, hn

	@Column(length = 50, nullable = true, unique = false)
	private String languageName = "";

	@Column(nullable = true)
	private Boolean isActive = true;

	public String getLanguageCode() {
		return languageCode;
	}

	public void setLanguageCode(String languageCode) {
		this.languageCode = languageCode;
	}

	public String getLanguageName() {
		return languageName;
	}

	public void setLanguageName(String languageName) {
		this.languageName = languageName;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
}
