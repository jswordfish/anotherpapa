package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;

import com.infrasofttech.domain.entities.Base;

@Entity
public class AuthStatus extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true, length = 20)
	private String authStatusCode = "";

	@Column(nullable = true, length = 10)
	private String languageCode = "";

	@Column(nullable = true, length = 50)
	private String authStatusDisplayName = "";

	@Column(nullable = true)
	private Boolean isActive = true;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAuthStatusCode() {
		return authStatusCode;
	}

	public void setAuthStatusCode(String authStatusCode) {
		this.authStatusCode = authStatusCode;
	}

	public String getLanguageCode() {
		return languageCode;
	}

	public void setLanguageCode(String languageCode) {
		this.languageCode = languageCode;
	}

	public String getAuthStatusDisplayName() {
		return authStatusDisplayName;
	}

	public void setAuthStatusDisplayName(String authStatusDisplayName) {
		this.authStatusDisplayName = authStatusDisplayName;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

}
