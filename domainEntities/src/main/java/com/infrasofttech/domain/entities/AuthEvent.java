package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
// @NamedQueries({ @NamedQuery(name = "authEvent.getListById", query =
// "select ") })
public class AuthEvent extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@OneToMany(mappedBy = "authEvent")
	@Fetch(FetchMode.SELECT)
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<AuthMatrix> authMatrix = new ArrayList<AuthMatrix>();

	@Column(nullable = true, length = 20)
	private String authEventCode = "";

	@Column(nullable = true, length = 30)
	private String authEventName = "";

	@Column(nullable = true, length = 200)
	private String authEventAction = "";

	@Column(nullable = true)
	private Boolean isActive = true;

	public Collection<AuthMatrix> getAuthMatrix() {
		return authMatrix;
	}

	public void setAuthMatrix(Collection<AuthMatrix> authMatrix) {
		this.authMatrix = authMatrix;
	}

	public String getAuthEventCode() {
		return authEventCode;
	}

	public void setAuthEventCode(String authEventCode) {
		this.authEventCode = authEventCode;
	}

	public String getAuthEventName() {
		return authEventName;
	}

	public void setAuthEventName(String authEventName) {
		this.authEventName = authEventName;
	}

	public String getAuthEventAction() {
		return authEventAction;
	}

	public void setAuthEventAction(String authEventAction) {
		this.authEventAction = authEventAction;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
}
