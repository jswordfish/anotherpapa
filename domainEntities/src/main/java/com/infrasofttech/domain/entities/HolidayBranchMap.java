package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@NamedQueries({
		@NamedQuery(name = "HolidayBranchMap.getHolidayBranchMap", query = "SELECT hb FROM HolidayBranchMap hb WHERE hb.tenantId=:tenantId AND "
				+ " hb.branchCode=:branchCode AND"
				+ " hb.holidayDate=:holidayDate AND"
				+ " hb.holidayCode=:holidayCode AND" + " hb.isActive=true"),

		@NamedQuery(name = "HolidayBranchMap.getHolidayBranchMapBySetNo", query = "SELECT hb FROM HolidayBranchMap hb WHERE hb.tenantId=:tenantId AND "
				+ " hb.setNo=:setNo AND" + " hb.isActive=true"),

		@NamedQuery(name = "HolidayBranchMap.getEnabledHolidayBranchMap", query = "SELECT hb FROM HolidayBranchMap hb WHERE hb.tenantId=:tenantId AND "
				+ " hb.branchCode=:branchCode AND"
				+ " hb.holidayDate=:holidayDate AND"
				+ " hb.holidayCode=:holidayCode AND" + " hb.isActive=false")

})
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "tenantId",
		"branchCode", "holidayDate", "holidayCode" }))
public class HolidayBranchMap extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true)
	private Long setNo;

	@Column(length = 20, nullable = true)
	private String branchCode = "";

	@Column(nullable = true, length = 20)
	private String holidayCode = "";

	@Column(nullable = true, length = 20)
	private String holidayDate = "";

	@Column(nullable = true)
	private Boolean isActive = true;

	@Column(nullable = true, length = 30)
	private String authStatus = "";

	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public Long getSetNo() {
		return setNo;
	}

	public void setSetNo(Long setNo) {
		this.setNo = setNo;
	}

	public String getHolidayCode() {
		return holidayCode;
	}

	public void setHolidayCode(String holidayCode) {
		this.holidayCode = holidayCode;
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

	public String getHolidayDate() {
		return holidayDate;
	}

	public void setHolidayDate(String holidayDate) {
		this.holidayDate = holidayDate;
	}

}
