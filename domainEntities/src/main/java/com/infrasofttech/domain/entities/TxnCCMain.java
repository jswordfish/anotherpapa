package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.OneToMany;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
public class TxnCCMain extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(length = 20, nullable = true)
	private String moduleCode = "";

	@Column(length = 20, nullable = true)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private String defKey = "";

	@Column
	private Boolean isActive = true;

	@OneToMany(mappedBy = "txnCCMain", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<TxnCCProducts> products = new ArrayList<TxnCCProducts>();

	@OneToMany(mappedBy = "txnCCMain", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<TxnCCActivities> activities = new ArrayList<TxnCCActivities>();

	@OneToMany(mappedBy = "txnCCMain", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<TxnCCBranches> branches = new ArrayList<TxnCCBranches>();

	@OneToMany(mappedBy = "txnCCMain", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<TxnCCDtls> dtls = new ArrayList<TxnCCDtls>();

	public String getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}

	public String getDefKey() {
		return defKey;
	}

	public void setDefKey(String defKey) {
		this.defKey = defKey;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public Collection<TxnCCProducts> getProducts() {
		return products;
	}

	public void setProducts(Collection<TxnCCProducts> products) {
		this.products = products;
	}

	public Collection<TxnCCActivities> getActivities() {
		return activities;
	}

	public void setActivities(Collection<TxnCCActivities> activities) {
		this.activities = activities;
	}

	public Collection<TxnCCBranches> getBranches() {
		return branches;
	}

	public void setBranches(Collection<TxnCCBranches> branches) {
		this.branches = branches;
	}

	public Collection<TxnCCDtls> getDtls() {
		return dtls;
	}

	public void setDtls(Collection<TxnCCDtls> dtls) {
		this.dtls = dtls;
	}
}
