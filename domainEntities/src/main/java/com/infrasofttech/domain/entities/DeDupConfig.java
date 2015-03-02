package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@NamedQueries({ @NamedQuery(name = "DeDupConfig.getDeDupConfig", query = "SELECT d FROM DeDupConfig d WHERE d.tenantId=:tenantId AND "
		+ " d.refDoc=:refDoc AND d.seqNumVal=:seqNumVal AND "
		+ " d.isActive=true") })
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "tenantId",
		"refDoc", "seqNumVal" }))
public class DeDupConfig extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true, length = 20)
	private String refDoc = "";

	@Column(nullable = true, length = 20)
	private Integer seqNumVal = 0;

	@Column(nullable = true)
	private Boolean mandatoryYN = true;

	@Column(nullable = true)
	private Boolean isActive = true;

	@Column(nullable = true, length = 30)
	private String authStatus = "";

	public String getRefDoc() {
		return refDoc;
	}

	public void setRefDoc(String refDoc) {
		this.refDoc = refDoc;
	}

	public Integer getSeqNumVal() {
		return seqNumVal;
	}

	public void setSeqNumVal(Integer seqNumVal) {
		this.seqNumVal = seqNumVal;
	}

	public Boolean getMandatoryYN() {
		return mandatoryYN;
	}

	public void setMandatoryYN(Boolean mandatoryYN) {
		this.mandatoryYN = mandatoryYN;
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

}
