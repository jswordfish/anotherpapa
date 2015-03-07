package com.infrasofttech.domain.entities.transaction.runtime;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.infrasofttech.domain.entities.Base;
import com.infrasofttech.domain.entities.transaction.Screen;
import com.infrasofttech.domain.entities.transaction.ScreenMapper;
@Entity
public class ScreenTransaction extends Base{
	
	@ManyToOne(optional=false)
	@JoinColumn(name = "screenId")
	private Screen screen;
	
	private String transactionNumber;
	
	private String productAccountNumber;
	
	@Column(nullable = true)
	private Boolean isActive = true;
	
	@Column(nullable = false, length = 60)
	private String productCode;
	
	@Column(nullable = false, length = 60)
	private String activityCode;
	
	@Column(nullable = false, length = 60)
	private String branchCode;
	
	@Column(nullable = false, length = 60)
	private String moduleCode;
	
	@Column(nullable = false, length = 100)
	private String branchName;
	
	@Column(nullable = false, length = 100)
	private String moduleName;
	
	@Column(nullable = false, length = 100)
	private String activityName;
	
	@Column(nullable = false, length = 100)
	private String productName;
	
	@OneToMany(cascade = CascadeType.ALL)
	private List<ScreenRowTransaction>  rowTransactions = new ArrayList<ScreenRowTransaction>();

	public List<ScreenRowTransaction> getRowTransactions() {
		return rowTransactions;
	}

	public void setRowTransactions(List<ScreenRowTransaction> rowTransactions) {
		this.rowTransactions = rowTransactions;
	}

	public Screen getScreen() {
		return screen;
	}

	public void setScreen(Screen screen) {
		this.screen = screen;
	}

	public String getTransactionNumber() {
		return transactionNumber;
	}

	public void setTransactionNumber(String transactionNumber) {
		this.transactionNumber = transactionNumber;
	}

	public String getProductAccountNumber() {
		return productAccountNumber;
	}

	public void setProductAccountNumber(String productAccountNumber) {
		this.productAccountNumber = productAccountNumber;
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

	public String getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
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
