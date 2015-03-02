package com.infrasofttech.domain.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

@Entity
@NamedQueries({
	@NamedQuery(name = "FY.getFY", query = "SELECT f FROM FinancialYear f WHERE f.fyCode=:fyCode "
			+ " AND f.tenantId=:tenantId AND f.isActive=true")})
	
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "tenantId",
	"fyCode" }))
public class FinancialYear extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true, length = 30)
	private String fyCode = "";

	@Temporal(TemporalType.DATE)
	private Date fyFrom ;

	@Temporal(TemporalType.DATE)
	private Date fyTo ; 
	
	@Column(nullable = true, length = 30)
	private String fyStatus = ""; 

	@Column(nullable = true)
	private Boolean isActive = true;

	public String getFyCode() {
		return fyCode;
	}

	public void setFyCode(String fyCode) {
		this.fyCode = fyCode;
	}

	public Date getFyFrom() {
		return fyFrom;
	}

	public void setFyFrom(Date fyFrom) {
		this.fyFrom = fyFrom;
	}

	public Date getFyTo() {
		return fyTo;
	}

	public void setFyTo(Date fyTo) {
		this.fyTo = fyTo;
	}

	public String getFyStatus() {
		return fyStatus;
	}

	public void setFyStatus(String fyStatus) {
		this.fyStatus = fyStatus;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
	
	
	

}