package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@NamedQueries({
	@NamedQuery(name = "EmailConfig.getEmailConfig", query = "SELECT e FROM EmailConfig e WHERE e.emailConfigCode=:emailConfigCode "
			+ " AND e.tenantId=:tenantId AND e.isActive=true") })
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "tenantId",
	"emailConfigCode" }))
public class EmailConfig extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(length = 20, nullable = true)
	private String emailConfigCode = ""; // from lookupValueCode

	@Column(length = 1000, nullable = true)
	private String emailHost = "";

	@Column(length = 1000, nullable = true)
	private String fromUser = "";

	@Column(length = 1000, nullable = true)
	private String fromPwd = "";

	@Column(length = 1000, nullable = true)
	private String smtpPort = "";

	@Column(length = 100, nullable = true)
	private String transportProtocol = "";

	@Column(nullable = true)
	private Boolean smtpAuth = true;

	@Column(nullable = true)
	private Boolean smtpStartTLSEnabled = true;

	@Column(nullable = true)
	private Boolean smtpEHLO = true;

	@Column(length = 100, nullable = true)
	private String remarks;

	@Column(nullable = true)
	private Boolean isActive = true;

	public String getEmailConfigCode() {
		return emailConfigCode;
	}

	public void setEmailConfigCode(String emailConfigCode) {
		this.emailConfigCode = emailConfigCode;
	}

	public String getEmailHost() {
		return emailHost;
	}

	public void setEmailHost(String emailHost) {
		this.emailHost = emailHost;
	}

	public String getFromUser() {
		return fromUser;
	}

	public void setFromUser(String fromUser) {
		this.fromUser = fromUser;
	}

	public String getFromPwd() {
		return fromPwd;
	}

	public void setFromPwd(String fromPwd) {
		this.fromPwd = fromPwd;
	}

	

	public String getSmtpPort() {
		return smtpPort;
	}

	public void setSmtpPort(String smtpPort) {
		this.smtpPort = smtpPort;
	}

	public String getTransportProtocol() {
		return transportProtocol;
	}

	public void setTransportProtocol(String transportProtocol) {
		this.transportProtocol = transportProtocol;
	}

	public Boolean getSmtpAuth() {
		return smtpAuth;
	}

	public void setSmtpAuth(Boolean smtpAuth) {
		this.smtpAuth = smtpAuth;
	}

	public Boolean getSmtpStartTLSEnabled() {
		return smtpStartTLSEnabled;
	}

	public void setSmtpStartTLSEnabled(Boolean smtpStartTLSEnabled) {
		this.smtpStartTLSEnabled = smtpStartTLSEnabled;
	}

	public Boolean getSmtpEHLO() {
		return smtpEHLO;
	}

	public void setSmtpEHLO(Boolean smtpEHLO) {
		this.smtpEHLO = smtpEHLO;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
}
