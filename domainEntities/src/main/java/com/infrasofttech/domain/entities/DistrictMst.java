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

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
public class DistrictMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true, length = 20)
	private String districtCode = "";

	@Column(nullable = true, length = 50)
	private String districtName = "";

	@OneToMany(mappedBy = "districtMst", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<MunicipalityMst> municipalities = new ArrayList<MunicipalityMst>();

	@OneToMany(mappedBy = "districtMst", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<VillageMst> villages = new ArrayList<VillageMst>();

	@ManyToOne( cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "fkStateMstPk")
	private StateMst stateMst;

	@Column(nullable = true)
	private Boolean isActive = true;

	public String getDistrictCode() {
		return districtCode;
	}

	public void setDistrictCode(String districtCode) {
		this.districtCode = districtCode;
	}

	public String getDistrictName() {
		return districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}

	public Collection<MunicipalityMst> getMunicipalities() {
		return municipalities;
	}

	public void setMunicipalities(Collection<MunicipalityMst> municipalities) {
		this.municipalities = municipalities;
	}

	public Collection<VillageMst> getVillages() {
		return villages;
	}

	public void setVillages(Collection<VillageMst> villages) {
		this.villages = villages;
	}

	public StateMst getStateMst() {
		return stateMst;
	}

	public void setStateMst(StateMst stateMst) {
		this.stateMst = stateMst;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
}
