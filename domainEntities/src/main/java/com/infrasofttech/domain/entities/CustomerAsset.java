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
public class CustomerAsset extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true, length = 30)
	private String regNumber = "";
	@Column(nullable = true, length = 30)
	private String plotNumber = "";
	@Column(nullable = true, precision = 3)
	private double areaSize = 0D;
	@Column(nullable = true, precision = 2)
	private double areaRate = 0D;
	@Column(nullable = true, precision = 2)
	private double approxMonetaryValue;
	@Column(nullable = true, length = 200)
	private String remarks1 = "";
	@Column(nullable = true)
	private Boolean osLoanYN = false;
	@Column(nullable = true, precision = 2)
	private double osAmount = 0D;

	@ElementCollection
	@JoinTable(name = "CUSTOMER_ASSET_ADDRESS", joinColumns = @JoinColumn(name = "ASSET_ID"))
	@GenericGenerator(name = "hilo-gen", strategy = "hilo")
	@CollectionId(columns = { @Column(name = "Id") }, generator = "hilo-gen", type = @Type(type = "long"))
	private Collection<Address> customerAssetAddresses = new ArrayList<Address>();

	public String getRegNumber() {
		return regNumber;
	}

	public void setRegNumber(String regNumber) {
		this.regNumber = regNumber;
	}

	public String getPlotNumber() {
		return plotNumber;
	}

	public void setPlotNumber(String plotNumber) {
		this.plotNumber = plotNumber;
	}

	public double getAreaSize() {
		return areaSize;
	}

	public void setAreaSize(double areaSize) {
		this.areaSize = areaSize;
	}

	public double getAreaRate() {
		return areaRate;
	}

	public void setAreaRate(double areaRate) {
		this.areaRate = areaRate;
	}

	public double getApproxMonetaryValue() {
		return approxMonetaryValue;
	}

	public void setApproxMonetaryValue(double approxMonetaryValue) {
		this.approxMonetaryValue = approxMonetaryValue;
	}

	public String getRemarks1() {
		return remarks1;
	}

	public void setRemarks1(String remarks1) {
		this.remarks1 = remarks1;
	}

	public Boolean getOsLoanYN() {
		return osLoanYN;
	}

	public void setOsLoanYN(Boolean osLoanYN) {
		this.osLoanYN = osLoanYN;
	}

	public double getOsAmount() {
		return osAmount;
	}

	public void setOsAmount(double osAmount) {
		this.osAmount = osAmount;
	}

	public Collection<Address> getCustomerAssetAddresses() {
		return customerAssetAddresses;
	}

	public void setCustomerAssetAddresses(
			Collection<Address> customerAssetAddresses) {
		this.customerAssetAddresses = customerAssetAddresses;
	}
}
