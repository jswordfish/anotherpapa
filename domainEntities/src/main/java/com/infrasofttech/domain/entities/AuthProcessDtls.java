package com.infrasofttech.domain.entities;

import com.infrasofttech.domain.entities.Base;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class AuthProcessDtls extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@ManyToOne
	@JoinColumn(name = "fkAuthProcessPk")
	private AuthProcess authProcess;

	@Column(nullable = true)
	private Long checkerId = 0L;

	@Column(nullable = true, length = 30)
	private String checkerCode = "";

	@Temporal(TemporalType.TIMESTAMP)
	private Date checkerDateTime;

	@Column(nullable = true, length = 30)
	private String checkerAuthStatusCode = "";

	@Column(nullable = true, length = 30)
	private String checkerAuthStatusReasonCode = "";

	@Column(nullable = true, length = 200)
	private String roleCode = "";

	@Column(nullable = true)
	private Integer checkerRank = 0;

	@Column(nullable = true)
	private Boolean isActive = true;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public AuthProcess getAuthProcess() {
		return authProcess;
	}

	public void setAuthProcess(AuthProcess authProcess) {
		this.authProcess = authProcess;
	}

	public Long getCheckerId() {
		return checkerId;
	}

	public void setCheckerId(Long checkerId) {
		this.checkerId = checkerId;
	}

	public String getCheckerCode() {
		return checkerCode;
	}

	public void setCheckerCode(String checkerCode) {
		this.checkerCode = checkerCode;
	}

	public Date getCheckerDateTime() {
		return checkerDateTime;
	}

	public void setCheckerDateTime(Date checkerDateTime) {
		this.checkerDateTime = checkerDateTime;
	}

	public String getCheckerAuthStatusCode() {
		return checkerAuthStatusCode;
	}

	public void setCheckerAuthStatusCode(String checkerAuthStatusCode) {
		this.checkerAuthStatusCode = checkerAuthStatusCode;
	}

	public String getCheckerAuthStatusReasonCode() {
		return checkerAuthStatusReasonCode;
	}

	public void setCheckerAuthStatusReasonCode(
			String checkerAuthStatusReasonCode) {
		this.checkerAuthStatusReasonCode = checkerAuthStatusReasonCode;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public Integer getCheckerRank() {
		return checkerRank;
	}

	public void setCheckerRank(Integer checkerRank) {
		this.checkerRank = checkerRank;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

}
