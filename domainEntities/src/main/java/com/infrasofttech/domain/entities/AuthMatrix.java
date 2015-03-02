package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@NamedQueries({ @NamedQuery(name = "AuthMatrix.getAuthMatrixByTenant", query = "SELECT a FROM AuthMatrix a WHERE a.id=:id") })
// @NamedQuery(name = "AuthMatrix.getId", query =
// "SELECT a.id FROM AuthMatrix a ORDER BY a.id DESC")
public class AuthMatrix extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true, length = 30)
	private String authMatrixName = "";

	@ManyToOne
	@JoinColumn(name = "fkAuthEventPk")
	private AuthEvent authEvent;

	@ManyToMany
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<BranchMst> branches = new ArrayList<BranchMst>();

	@ManyToMany
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<CurrencyMst> currencies = new ArrayList<CurrencyMst>();

	@Temporal(TemporalType.DATE)
	private Date effFrom;

	@Temporal(TemporalType.DATE)
	private Date effTill;

	@OneToMany(mappedBy = "authMatrix")
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<AuthMatrixSlab> authMatrixSlabs = new ArrayList<AuthMatrixSlab>();

	@Column(nullable = true)
	private Boolean isActive = true;

	@Column(nullable = true, length = 30)
	private String authStatus = "";

	public String getAuthMatrixName() {
		return authMatrixName;
	}

	public void setAuthMatrixName(String authMatrixName) {
		this.authMatrixName = authMatrixName;
	}

	public AuthEvent getAuthEvent() {
		return authEvent;
	}

	public void setAuthEvent(AuthEvent authEvent) {
		this.authEvent = authEvent;
	}

	public Collection<BranchMst> getBranches() {
		return branches;
	}

	public void setBranches(Collection<BranchMst> branches) {
		this.branches = branches;
	}

	public Collection<CurrencyMst> getCurrencies() {
		return currencies;
	}

	public void setCurrencies(Collection<CurrencyMst> currencies) {
		this.currencies = currencies;
	}

	public Date getEffFrom() {
		return effFrom;
	}

	public void setEffFrom(Date effFrom) {
		this.effFrom = effFrom;
	}

	public Date getEffTill() {
		return effTill;
	}

	public void setEffTill(Date effTill) {
		this.effTill = effTill;
	}

	public Collection<AuthMatrixSlab> getAuthMatrixSlabs() {
		return authMatrixSlabs;
	}

	public void setAuthMatrixSlabs(Collection<AuthMatrixSlab> authMatrixSlabs) {
		this.authMatrixSlabs = authMatrixSlabs;
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
