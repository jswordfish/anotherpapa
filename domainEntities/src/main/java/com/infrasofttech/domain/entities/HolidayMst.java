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
		@NamedQuery(name = "HolidayMst.getHolidayMst", query = "SELECT h FROM HolidayMst h WHERE h.tenantId=:tenantId AND "
				+ " h.holidayCode=:holidayCode AND " + " h.isActive=true"),
		@NamedQuery(name = "HolidayMst.getEnabledHoliday", query = "SELECT h FROM HolidayMst h WHERE h.tenantId=:tenantId AND "
				+ " h.holidayCode=:holidayCode  AND " + " h.isActive=false") })
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "tenantId",
		"holidayCode" }))
public class HolidayMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Temporal(TemporalType.DATE)
	private Date holidayDate;

	@Column(nullable = true, length = 20)
	private String holidayCode = "";

	@Column(nullable = true, length = 50)
	private String holidayDesc = "";

	@Column(nullable = true)
	private Boolean isActive = true;

	@Column(nullable = true, length = 30)
	private String authStatus = "";

	public Date getHolidayDate() {
		return holidayDate;
	}

	public void setHolidayDate(Date holidayDate) {
		this.holidayDate = holidayDate;
	}

	public String getHolidayCode() {
		return holidayCode;
	}

	public void setHolidayCode(String holidayCode) {
		this.holidayCode = holidayCode;
	}

	public String getHolidayDesc() {
		return holidayDesc;
	}

	public void setHolidayDesc(String holidayDesc) {
		this.holidayDesc = holidayDesc;
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
