package com.infrasofttech.domain.entities;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class LocationMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true, length = 20)
	private String locationCode = "";

	@Column(nullable = true, length = 50)
	private String locationName = "";

	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "fkVillagePk")
	private VillageMst villageMst;

	@Column(nullable = true)
	private Boolean isActive = true;

	public String getLocationCode() {
		return locationCode;
	}

	public void setLocationCode(String locationCode) {
		this.locationCode = locationCode;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public VillageMst getVillageMst() {
		return villageMst;
	}

	public void setVillageMst(VillageMst villageMst) {
		this.villageMst = villageMst;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
}
