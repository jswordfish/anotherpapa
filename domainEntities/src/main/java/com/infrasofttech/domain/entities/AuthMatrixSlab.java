package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@NamedQueries({ @NamedQuery(name = "AuthMatrixSlab.getAuthMatrixSlabById", query = "SELECT a FROM AuthMatrixSlab a WHERE a.id=:id") })
public class AuthMatrixSlab extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true)
	private Integer srNo = 0;

	@ManyToOne
	@JoinColumn(name = "fkAuthMatrixPk")
	@LazyCollection(LazyCollectionOption.FALSE)
	private AuthMatrix authMatrix;

	@Column(nullable = true, length = 20)
	private String basedOnCode = ""; // from lookup

	@Column(nullable = true)
	private Double fromRange = 0D;

	@Column(nullable = true)
	private Double toRange = 0D;

	@Column(nullable = true, length = 20)
	private String authType = ""; // from lookup

	@Column(nullable = true, length = 20)
	private String authMode = ""; // from lookup

	@Column(nullable = true)
	private Integer countOfAuthorizers = 0;

	@Column(nullable = true)
	private String currencyISOCode = "";

	@OneToMany(mappedBy = "authMatrixSlab", cascade = CascadeType.ALL)
	@Fetch(FetchMode.SELECT)
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<AuthMatrixSlabUser> authMatrixSlabUsers = new ArrayList<AuthMatrixSlabUser>();

	@Column(nullable = true)
	private Boolean isActive = true;

	public Integer getSrNo() {
		return srNo;
	}

	public void setSrNo(Integer srNo) {
		this.srNo = srNo;
	}

	public AuthMatrix getAuthMatrix() {
		return authMatrix;
	}

	public void setAuthMatrix(AuthMatrix authMatrix) {
		this.authMatrix = authMatrix;
	}

	public String getBasedOnCode() {
		return basedOnCode;
	}

	public void setBasedOnCode(String basedOnCode) {
		this.basedOnCode = basedOnCode;
	}

	public Double getFromRange() {
		return fromRange;
	}

	public void setFromRange(Double fromRange) {
		this.fromRange = fromRange;
	}

	public Double getToRange() {
		return toRange;
	}

	public void setToRange(Double toRange) {
		this.toRange = toRange;
	}

	public String getAuthType() {
		return authType;
	}

	public void setAuthType(String authType) {
		this.authType = authType;
	}

	public String getAuthMode() {
		return authMode;
	}

	public void setAuthMode(String authMode) {
		this.authMode = authMode;
	}

	public Integer getCountOfAuthorizers() {
		return countOfAuthorizers;
	}

	public void setCountOfAuthorizers(Integer countOfAuthorizers) {
		this.countOfAuthorizers = countOfAuthorizers;
	}

	public Collection<AuthMatrixSlabUser> getAuthMatrixSlabUsers() {
		return authMatrixSlabUsers;
	}

	public void setAuthMatrixSlabUsers(
			Collection<AuthMatrixSlabUser> authMatrixSlabUsers) {
		this.authMatrixSlabUsers = authMatrixSlabUsers;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public String getCurrencyISOCode() {
		return currencyISOCode;
	}

	public void setCurrencyISOCode(String currencyISOCode) {
		this.currencyISOCode = currencyISOCode;
	}

}