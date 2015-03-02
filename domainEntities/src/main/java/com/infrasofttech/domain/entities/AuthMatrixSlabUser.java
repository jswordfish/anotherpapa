package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@NamedQueries({ @NamedQuery(name = "AuthMatrixSlabUser.getAuthMatrixSlabUserById", query = "SELECT a FROM AuthMatrixSlabUser a WHERE a.id=:id") })
public class AuthMatrixSlabUser extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@ManyToOne
	@JoinColumn(name = "fkAuthMatrixSlabPk")
	@LazyCollection(LazyCollectionOption.FALSE)
	private AuthMatrixSlab authMatrixSlab;

	@Column(nullable = true)
	private Integer rank=0;

	@Column(nullable = true, length = 30)
	private String roleCodes=""; // Any one from the (comma separated) multiple
								// roles can authorize a record - Checker

	@Column(nullable = true)
	private Boolean isActive = true;

	public AuthMatrixSlab getAuthMatrixSlab() {
		return authMatrixSlab;
	}

	public void setAuthMatrixSlab(AuthMatrixSlab authMatrixSlab) {
		this.authMatrixSlab = authMatrixSlab;
	}

	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	public String getRoleCodes() {
		return roleCodes;
	}

	public void setRoleCodes(String roleCodes) {
		this.roleCodes = roleCodes;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
}
