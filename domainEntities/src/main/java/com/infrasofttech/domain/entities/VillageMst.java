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
public class VillageMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true, length = 20)
	private String villageCode = "";

	@Column(nullable = true, length = 50)
	private String villageName = "";

	@OneToMany(mappedBy = "villageMst",  cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<LocationMst> locations = new ArrayList<LocationMst>();

	@ManyToOne(cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "fkMunicipalityPk")
	private MunicipalityMst municipalityMst;

	@ManyToOne( cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "fkDistrictPk")
	private DistrictMst districtMst;

	@Column(nullable = true)
	private Integer population = 0;

	@Column(nullable = true, length = 50)
	private String mandalCode = "";

	@Column(nullable = true, length = 50)
	private String revenueVillageCode = "";

	@Column(nullable = true, length = 50)
	private String blockCode = "";

	@Column(nullable = true, precision = 3)
	private Double agriLandArea = 0D;

	@Column(nullable = true, length = 50)
	private String division = "";

	@Column(nullable = true, length = 50)
	private String subDivisionThana = "";

	@Column(nullable = true, length = 50)
	private String serviceAreaCode = "";

	@Column(nullable = true)
	private Boolean isActive = true;

	public String getVillageCode() {
		return villageCode;
	}

	public void setVillageCode(String villageCode) {
		this.villageCode = villageCode;
	}

	public String getVillageName() {
		return villageName;
	}

	public void setVillageName(String villageName) {
		this.villageName = villageName;
	}

	public Collection<LocationMst> getLocations() {
		return locations;
	}

	public void setLocations(Collection<LocationMst> locations) {
		this.locations = locations;
	}

	public MunicipalityMst getMunicipalityMst() {
		return municipalityMst;
	}

	public void setMunicipalityMst(MunicipalityMst municipalityMst) {
		this.municipalityMst = municipalityMst;
	}

	public DistrictMst getDistrictMst() {
		return districtMst;
	}

	public void setDistrictMst(DistrictMst districtMst) {
		this.districtMst = districtMst;
	}

	public Integer getPopulation() {
		return population;
	}

	public void setPopulation(Integer population) {
		this.population = population;
	}

	public String getMandalCode() {
		return mandalCode;
	}

	public void setMandalCode(String mandalCode) {
		this.mandalCode = mandalCode;
	}

	public String getRevenueVillageCode() {
		return revenueVillageCode;
	}

	public void setRevenueVillageCode(String revenueVillageCode) {
		this.revenueVillageCode = revenueVillageCode;
	}

	public String getBlockCode() {
		return blockCode;
	}

	public void setBlockCode(String blockCode) {
		this.blockCode = blockCode;
	}

	public Double getAgriLandArea() {
		return agriLandArea;
	}

	public void setAgriLandArea(Double agriLandArea) {
		this.agriLandArea = agriLandArea;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getSubDivisionThana() {
		return subDivisionThana;
	}

	public void setSubDivisionThana(String subDivisionThana) {
		this.subDivisionThana = subDivisionThana;
	}

	public String getServiceAreaCode() {
		return serviceAreaCode;
	}

	public void setServiceAreaCode(String serviceAreaCode) {
		this.serviceAreaCode = serviceAreaCode;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
}
