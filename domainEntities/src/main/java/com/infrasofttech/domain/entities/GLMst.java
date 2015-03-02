package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@NamedQueries({
	@NamedQuery(name = "GLMst.getGLMst", query = "SELECT g FROM GLMst g WHERE g.glCode=:glCode "
			+ " AND g.tenantId=:tenantId AND g.fyCode=:fyCode"),
			@NamedQuery(name = "GLMst.getGlCode", query = "SELECT g FROM GLMst g WHERE g.glCode=:glCode "
			+ " AND g.tenantId=:tenantId "),
			@NamedQuery(name = "GLMst.getAllGLMstByTenant", 
			query = "SELECT g FROM GLMst g WHERE  g.tenantId=:tenantId AND g.isActive=true")
	
})
	
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "tenantId",
	"glCode","fyCode" }))
public class GLMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true, length = 30)
	private String glCode = "";

	@Column(nullable = true, length = 50)
	private String glName = "";

	@Column(nullable = true, length = 50)
	private String glType = ""; 
	
	@Column(nullable = true, length = 30)
	private String glCategory = ""; // from Lookup - Internal / External

	@Column(nullable = true, length = 10)
	private String currencyCode = ""; // drop down from DB

	@Column(nullable = true)
	private Boolean isActive = true;

	@Column(nullable = true, length = 30)
	private String authStatus = "";
	
	@Column(nullable = true, length = 30)
	private String fyCode = "";

	public String getGlCode() {
		return glCode;
	}

	public void setGlCode(String glCode) {
		this.glCode = glCode;
	}

	public String getGlName() {
		return glName;
	}

	public void setGlName(String glName) {
		this.glName = glName;
	}

	public String getGlType() {
		return glType;
	}

	public void setGlType(String glType) {
		this.glType = glType;
	}

	public String getGlCategory() {
		return glCategory;
	}

	public void setGlCategory(String glCategory) {
		this.glCategory = glCategory;
	}

	public String getCurrencyCode() {
		return currencyCode;
	}

	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public String getAuthStatus() {
		return authStatus;
	}

	public void setAuthStatus(String authStatus) {
		this.authStatus = authStatus;
	}

	public String getFyCode() {
		return fyCode;
	}

	public void setFyCode(String fyCode) {
		this.fyCode = fyCode;
	}
	
}
