package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class LoanTypePurposeCodeMap extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@ManyToOne
	@JoinColumn(name = "fkTenantMstPk")
	private TenantMst tenantMst;
	@ManyToMany
	private Collection<BranchMst> branches = new ArrayList<BranchMst>();
	@Column(nullable = true)
	private String loanTypeCode = ""; // from lookup
	@Column(nullable = true)
	private String purposeCode = "";

	public TenantMst getTenantMst() {
		return tenantMst;
	}

	public void setTenantMst(TenantMst tenantMst) {
		this.tenantMst = tenantMst;
	}

	public Collection<BranchMst> getBranches() {
		return branches;
	}

	public void setBranches(Collection<BranchMst> branches) {
		this.branches = branches;
	}

	public String getLoanTypeCode() {
		return loanTypeCode;
	}

	public void setLoanTypeCode(String loanTypeCode) {
		this.loanTypeCode = loanTypeCode;
	}

	public String getPurposeCode() {
		return purposeCode;
	}

	public void setPurposeCode(String purposeCode) {
		this.purposeCode = purposeCode;
	}

}
