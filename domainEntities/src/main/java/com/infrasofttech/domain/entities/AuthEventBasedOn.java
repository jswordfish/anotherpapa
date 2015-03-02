package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class AuthEventBasedOn extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true, length = 20)
	private String authEventCode = "";

	@Column(nullable = true, length = 20)
	private String basedOnCode = "";

	public String getAuthEventCode() {
		return authEventCode;
	}

	public void setAuthEventCode(String authEventCode) {
		this.authEventCode = authEventCode;
	}

	public String getBasedOnCode() {
		return basedOnCode;
	}

	public void setBasedOnCode(String basedOnCode) {
		this.basedOnCode = basedOnCode;
	}
}
