package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import com.infrasofttech.utils.InstallmentFrequency;
import com.infrasofttech.utils.Month;

@Entity
public class PurposeCodeGLMap extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	// @ManyToOne
	// @JoinColumn(name = "fkTenantMstPk")
	// TenantMst tenantMst;
	@ManyToMany
	private Collection<BranchMst> branches = new ArrayList<BranchMst>();
	@ManyToOne
	@JoinColumn(name = "fkPurposeCodePk")
	private PurposeCodeMst purposeCode;
	@ManyToOne
	@JoinColumn(name = "fkProductCodePk")
	private ProductMst productMst;

	@Column(nullable = true)
	private Long GLCodeFK = 0L;

	@Column(nullable = true)
	private InstallmentFrequency installmentFrequency;
	@Column(nullable = true)
	private double shareCapitalPerc = 0D;
	@Column(nullable = true)
	private Boolean sharePercYN = false;
	@Column(nullable = true)
	private String scrutinyType = ""; // Code will be read from look ups
	@Column(nullable = true)
	private double minAmount = 0D;
	@Column(nullable = true)
	private String prefixHundi = "";
	@Column(nullable = true)
	private String minInvolveType = ""; // Code will be read from look ups
	@Column(nullable = true)
	private Boolean plrLinkYN = false;
	@ManyToOne
	@JoinColumn(name = "fkBorrowingPrdCodePk")
	private ProductMst borrowingPrdCode;
	@Column(nullable = true)
	private Month dueDateMonth;
	@Column(nullable = true)
	private Boolean societyMemberYN = false;
	@Column(nullable = true)
	private Boolean farmerInsuranceYN = false;
	@Column(nullable = true)
	private Boolean fixedSubsidyYN = false;
	@Column(nullable = true)
	private Boolean cropTypeYN = false;
	@Column(nullable = true)
	private double subsidyPerc = 0D;
	@Column(nullable = true)
	private Boolean subsidyYN = false;
	@Column(nullable = true)
	private double fixedSubsidyAmount = 0D;
	@Column(nullable = true)
	private double subsidyMaxAmount = 0D;

	public Collection<BranchMst> getBranches() {
		return branches;
	}

	public void setBranches(Collection<BranchMst> branches) {
		this.branches = branches;
	}

	public PurposeCodeMst getPurposeCode() {
		return purposeCode;
	}

	public void setPurposeCode(PurposeCodeMst purposeCode) {
		this.purposeCode = purposeCode;
	}

	public ProductMst getProductMst() {
		return productMst;
	}

	public void setProductMst(ProductMst productMst) {
		this.productMst = productMst;
	}

	public Long getGLCodeFK() {
		return GLCodeFK;
	}

	public void setGLCodeFK(Long gLCodeFK) {
		GLCodeFK = gLCodeFK;
	}

	public InstallmentFrequency getInstallmentFrequency() {
		return installmentFrequency;
	}

	public void setInstallmentFrequency(
			InstallmentFrequency installmentFrequency) {
		this.installmentFrequency = installmentFrequency;
	}

	public double getShareCapitalPerc() {
		return shareCapitalPerc;
	}

	public void setShareCapitalPerc(double shareCapitalPerc) {
		this.shareCapitalPerc = shareCapitalPerc;
	}

	public Boolean getSharePercYN() {
		return sharePercYN;
	}

	public void setSharePercYN(Boolean sharePercYN) {
		this.sharePercYN = sharePercYN;
	}

	public String getScrutinyType() {
		return scrutinyType;
	}

	public void setScrutinyType(String scrutinyType) {
		this.scrutinyType = scrutinyType;
	}

	public double getMinAmount() {
		return minAmount;
	}

	public void setMinAmount(double minAmount) {
		this.minAmount = minAmount;
	}

	public String getPrefixHundi() {
		return prefixHundi;
	}

	public void setPrefixHundi(String prefixHundi) {
		this.prefixHundi = prefixHundi;
	}

	public String getMinInvolveType() {
		return minInvolveType;
	}

	public void setMinInvolveType(String minInvolveType) {
		this.minInvolveType = minInvolveType;
	}

	public Boolean getPlrLinkYN() {
		return plrLinkYN;
	}

	public void setPlrLinkYN(Boolean plrLinkYN) {
		this.plrLinkYN = plrLinkYN;
	}

	public ProductMst getBorrowingPrdCode() {
		return borrowingPrdCode;
	}

	public void setBorrowingPrdCode(ProductMst borrowingPrdCode) {
		this.borrowingPrdCode = borrowingPrdCode;
	}

	public Month getDueDateMonth() {
		return dueDateMonth;
	}

	public void setDueDateMonth(Month dueDateMonth) {
		this.dueDateMonth = dueDateMonth;
	}

	public Boolean getSocietyMemberYN() {
		return societyMemberYN;
	}

	public void setSocietyMemberYN(Boolean societyMemberYN) {
		this.societyMemberYN = societyMemberYN;
	}

	public Boolean getFarmerInsuranceYN() {
		return farmerInsuranceYN;
	}

	public void setFarmerInsuranceYN(Boolean farmerInsuranceYN) {
		this.farmerInsuranceYN = farmerInsuranceYN;
	}

	public Boolean getFixedSubsidyYN() {
		return fixedSubsidyYN;
	}

	public void setFixedSubsidyYN(Boolean fixedSubsidyYN) {
		this.fixedSubsidyYN = fixedSubsidyYN;
	}

	public Boolean getCropTypeYN() {
		return cropTypeYN;
	}

	public void setCropTypeYN(Boolean cropTypeYN) {
		this.cropTypeYN = cropTypeYN;
	}

	public double getSubsidyPerc() {
		return subsidyPerc;
	}

	public void setSubsidyPerc(double subsidyPerc) {
		this.subsidyPerc = subsidyPerc;
	}

	public Boolean getSubsidyYN() {
		return subsidyYN;
	}

	public void setSubsidyYN(Boolean subsidyYN) {
		this.subsidyYN = subsidyYN;
	}

	public double getFixedSubsidyAmount() {
		return fixedSubsidyAmount;
	}

	public void setFixedSubsidyAmount(double fixedSubsidyAmount) {
		this.fixedSubsidyAmount = fixedSubsidyAmount;
	}

	public double getSubsidyMaxAmount() {
		return subsidyMaxAmount;
	}

	public void setSubsidyMaxAmount(double subsidyMaxAmount) {
		this.subsidyMaxAmount = subsidyMaxAmount;
	}

}
