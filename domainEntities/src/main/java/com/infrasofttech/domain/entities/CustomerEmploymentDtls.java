package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;

import org.hibernate.annotations.CollectionId;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

@Entity
public class CustomerEmploymentDtls extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true, length = 20)
	private String professionType = "";

	@Column(nullable = true, length = 20)
	private String empNumber = "";

	@Column(nullable = true, length = 20)
	private String department = "";

	@Column(nullable = true, length = 20)
	private String designation = "";

	@Column(nullable = true, length = 10)
	private Integer yearsInService = 0;

	@Column(nullable = true, length = 20)
	private String DOR = "";

	@Column(nullable = true, length = 20)
	private double annualIncome = 0D;

	@Column(nullable = true, length = 20)
	private String accountType = "";

	@Column(nullable = true, length = 20)
	private String bankCode = "";

	@Column(nullable = true, length = 20)
	private String bankName = "";

	@Column(nullable = true, length = 20)
	private long accountNumber = 0L;

	@ElementCollection
	@JoinTable(name = "EMPLOYMENT_ADDRESS", joinColumns = @JoinColumn(name = "EMPLOYMENT_ID"))
	@GenericGenerator(name = "hilo-gen", strategy = "hilo")
	@CollectionId(columns = { @Column(name = "Id") }, generator = "hilo-gen", type = @Type(type = "long"))
	private Collection<Address> employmentAddresses = new ArrayList<Address>();

	public String getProfessionType() {
		return professionType;
	}

	public void setProfessionType(String professionType) {
		this.professionType = professionType;
	}

	public String getEmpNumber() {
		return empNumber;
	}

	public void setEmpNumber(String empNumber) {
		this.empNumber = empNumber;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public Integer getYearsInService() {
		return yearsInService;
	}

	public void setYearsInService(Integer yearsInService) {
		this.yearsInService = yearsInService;
	}

	public String getDOR() {
		return DOR;
	}

	public void setDOR(String dOR) {
		DOR = dOR;
	}

	public double getAnnualIncome() {
		return annualIncome;
	}

	public void setAnnualIncome(double annualIncome) {
		this.annualIncome = annualIncome;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public long getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(long accountNumber) {
		this.accountNumber = accountNumber;
	}

	public Collection<Address> getEmploymentAddresses() {
		return employmentAddresses;
	}

	public void setEmploymentAddresses(Collection<Address> employmentAddresses) {
		this.employmentAddresses = employmentAddresses;
	}
}
