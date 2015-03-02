package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import com.infrasofttech.domain.entities.Base;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class AuthProcess extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(length = 20, nullable = true)
	private String tenantCode = "";
	@Column(length = 20, nullable = true)
	private String branchCode = "";
	@Column(length = 30, nullable = true)
	private String authEventCode = "";
	@Column(nullable = true)
	private Long authEventRefNo = 0L;
	@Column(length = 50, nullable = true)
	private String authEventRefCode = "";

	@Column(nullable = true)
	private Long makerId = 0L;

	@Column(length = 50, nullable = true)
	private String makerCode = "";

	@Temporal(TemporalType.TIMESTAMP)
	private Date makerDateTime;

	@Column(length = 50, nullable = true)
	private String authStatusCode = ""; // based on languageCode, respective
										// StatusCode will be picked up

	@Column(nullable = true)
	private Integer noOfAuthorizers = 0;

	@OneToMany(mappedBy = "authProcess", cascade = CascadeType.ALL)
	private Collection<AuthProcessDtls> authProcessDtls = new ArrayList<AuthProcessDtls>();

	@Column(nullable = true)
	private Boolean isActive = true;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTenantCode() {
		return tenantCode;
	}

	public void setTenantCode(String tenantCode) {
		this.tenantCode = tenantCode;
	}

	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public String getAuthEventCode() {
		return authEventCode;
	}

	public void setAuthEventCode(String authEventCode) {
		this.authEventCode = authEventCode;
	}

	public Long getAuthEventRefNo() {
		return authEventRefNo;
	}

	public void setAuthEventRefNo(Long authEventRefNo) {
		this.authEventRefNo = authEventRefNo;
	}

	public String getAuthEventRefCode() {
		return authEventRefCode;
	}

	public void setAuthEventRefCode(String authEventRefCode) {
		this.authEventRefCode = authEventRefCode;
	}

	public Long getMakerId() {
		return makerId;
	}

	public void setMakerId(Long makerId) {
		this.makerId = makerId;
	}

	public String getMakerCode() {
		return makerCode;
	}

	public void setMakerCode(String makerCode) {
		this.makerCode = makerCode;
	}

	public Date getMakerDateTime() {
		return makerDateTime;
	}

	public void setMakerDateTime(Date makerDateTime) {
		this.makerDateTime = makerDateTime;
	}

	public String getAuthStatusCode() {
		return authStatusCode;
	}

	public void setAuthStatusCode(String authStatusCode) {
		this.authStatusCode = authStatusCode;
	}

	public Integer getNoOfAuthorizers() {
		return noOfAuthorizers;
	}

	public void setNoOfAuthorizers(Integer noOfAuthorizers) {
		this.noOfAuthorizers = noOfAuthorizers;
	}

	public Collection<AuthProcessDtls> getAuthProcessDtls() {
		return authProcessDtls;
	}

	public void setAuthProcessDtls(Collection<AuthProcessDtls> authProcessDtls) {
		this.authProcessDtls = authProcessDtls;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

}
