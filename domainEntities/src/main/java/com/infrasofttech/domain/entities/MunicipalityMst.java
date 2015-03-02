package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class MunicipalityMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true, length = 20)
	private String municipalityCode = "";

	@Column(nullable = true, length = 100)
	private String municipalityName = "";

	@OneToMany(mappedBy = "municipalityMst", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private Collection<VillageMst> villages = new ArrayList<VillageMst>();

	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "fkDistrictPk")
	private DistrictMst districtMst;

	@Column(nullable = true)
	private Boolean isActive = true;

	public String getMunicipalityCode() {
		return municipalityCode;
	}

	public void setMunicipalityCode(String municipalityCode) {
		this.municipalityCode = municipalityCode;
	}

	public String getMunicipalityName() {
		return municipalityName;
	}

	public void setMunicipalityName(String municipalityName) {
		this.municipalityName = municipalityName;
	}

	public Collection<VillageMst> getVillages() {
		return villages;
	}

	public void setVillages(Collection<VillageMst> villages) {
		this.villages = villages;
	}

	public DistrictMst getDistrictMst() {
		return districtMst;
	}

	public void setDistrictMst(DistrictMst districtMst) {
		this.districtMst = districtMst;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
}
