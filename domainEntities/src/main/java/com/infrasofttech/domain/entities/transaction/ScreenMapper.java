package com.infrasofttech.domain.entities.transaction;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.infrasofttech.domain.entities.Base;

@Entity
@NamedQueries({
	@NamedQuery(name = "ScreenMapper.getUniqueScreenMapper", query = "SELECT s FROM ScreenMapper s WHERE s.moduleCode=:moduleCode "
			+ " AND s.tenantId=:tenantId AND s.productCode=:productCode AND s.activityCode=:activityCode AND "
			+ " s.branchCode=:branchCode") })
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "tenantId", "moduleCode", "productCode", "activityCode", "branchCode" }))
public class ScreenMapper extends Base {
	
	@Column(nullable = false, length = 60)
	private String moduleCode;
	
	@Column(nullable = false, length = 60)
	private String productCode;
	
	@Column(nullable = false, length = 60)
	private String activityCode;
	
	@Column(nullable = false, length = 60)
	private String branchCode;
	
	@Column(nullable = false, length = 100)
	private String branchName;
	
	@Column(nullable = false, length = 100)
	private String moduleName;
	
	@Column(nullable = false, length = 100)
	private String activityName;
	
	@Column(nullable = false, length = 100)
	private String productName;
	
	
	@OneToOne (cascade=CascadeType.ALL)
	@JoinColumn(name="transactionScreen_ID")
	private Screen transactionScreen;
	
	@OneToOne (cascade=CascadeType.ALL)
	@JoinColumn(name="infoScreen_ID")
	private Screen infoScreen;
	
	@OneToOne (cascade=CascadeType.ALL)
	@JoinColumn(name="balancesScreen_ID")
	private Screen balancesScreen;
	
	@Column(nullable = true)
	private Boolean isActive = true;

	public String getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getActivityCode() {
		return activityCode;
	}

	public void setActivityCode(String activityCode) {
		this.activityCode = activityCode;
	}

	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public Screen getTransactionScreen() {
		return transactionScreen;
	}

	public void setTransactionScreen(Screen transactionScreen) {
		this.transactionScreen = transactionScreen;
	}

	public Screen getInfoScreen() {
		return infoScreen;
	}

	public void setInfoScreen(Screen infoScreen) {
		this.infoScreen = infoScreen;
	}

	public Screen getBalancesScreen() {
		return balancesScreen;
	}

	public void setBalancesScreen(Screen balancesScreen) {
		this.balancesScreen = balancesScreen;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getActivityName() {
		return activityName;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
	
	

}
