package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class PurposeCodeMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	// @ManyToOne
	// @JoinColumn(name = "fkTenantMstPk")
	// TenantMst tenantMst;
	@ManyToMany
	private Collection<BranchMst> branches = new ArrayList<BranchMst>();
	@Column(nullable = true, length = 20)
	private String purposeCode = "";
	@Column(nullable = true, length = 100)
	private String purposeDesc = "";
	@OneToMany(mappedBy = "purposeCode")
	private Collection<PurposeCodeGLMap> purposeCodeGLMaps = new ArrayList<PurposeCodeGLMap>();

	// @Column(nullable = true)
	// private Boolean isActive = true;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Collection<BranchMst> getBranches() {
		return branches;
	}

	public void setBranches(Collection<BranchMst> branches) {
		this.branches = branches;
	}

	public String getPurposeCode() {
		return purposeCode;
	}

	public void setPurposeCode(String purposeCode) {
		this.purposeCode = purposeCode;
	}

	public String getPurposeDesc() {
		return purposeDesc;
	}

	public void setPurposeDesc(String purposeDesc) {
		this.purposeDesc = purposeDesc;
	}

	public Collection<PurposeCodeGLMap> getPurposeCodeGLMaps() {
		return purposeCodeGLMaps;
	}

	public void setPurposeCodeGLMaps(
			Collection<PurposeCodeGLMap> purposeCodeGLMaps) {
		this.purposeCodeGLMaps = purposeCodeGLMaps;
	}

}
