package com.infrasofttech.omning.orch.services.impl;

public class EmailProp {

	public EmailProp() {
	System.out.println("EmailProp.EmailProp()");
	}
	
	private String tenantCode="";
	private String emailHost="";
	private String fromUser="";
	private String fromPwd="";
	private String smptPort="";
	private Boolean smtpAuth=true;
	private Boolean smtpStartTLSEnabled=true;
	private Boolean smtpEHLO=true;
	private String transportProtocol="";
	
	public String getTransportProtocol() {
		return transportProtocol;
	}
	public void setTransportProtocol(String transportProtocol) {
		this.transportProtocol = transportProtocol;
	}
	public String getTenantCode() {
		return tenantCode;
	}
	public void setTenantCode(String tenantCode) {
		this.tenantCode = tenantCode;
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
	public String getSmptPort() {
		return smptPort;
	}
	public void setSmptPort(String smptPort) {
		this.smptPort = smptPort;
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
}
