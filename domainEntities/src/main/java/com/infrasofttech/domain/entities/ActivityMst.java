package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
public class ActivityMst extends Base {

	private static final long serialVersionUID = 1L;

	@Column(nullable = true)
	private String activityCode = "";
	@Column(nullable = true)
	private String activityDesc = "";
	@Column(nullable = true)
	private String drCr = "";
	@Column(nullable = true)
	private String finNonFin = "";
	@Column(nullable = true)
	private Boolean isActive = true;

	@Column(length = 20, nullable = true)
	private String moduleCode = "";

	@OneToMany(mappedBy = "activityMst")
	private Collection<ActivityStatusMst> activityStatus = new ArrayList<ActivityStatusMst>();

	public String getActivityCode() {
		return activityCode;
	}

	public void setActivityCode(String activityCode) {
		this.activityCode = activityCode;
	}

	public String getActivityDesc() {
		return activityDesc;
	}

	public void setActivityDesc(String activityDesc) {
		this.activityDesc = activityDesc;
	}

	public String getDrCr() {
		return drCr;
	}

	public void setDrCr(String drCr) {
		this.drCr = drCr;
	}

	public String getFinNonFin() {
		return finNonFin;
	}

	public void setFinNonFin(String finNonFin) {
		this.finNonFin = finNonFin;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public String getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}

	public Collection<ActivityStatusMst> getActivityStatus() {
		return activityStatus;
	}

	public void setActivityStatus(Collection<ActivityStatusMst> activityStatus) {
		this.activityStatus = activityStatus;
	}
}
