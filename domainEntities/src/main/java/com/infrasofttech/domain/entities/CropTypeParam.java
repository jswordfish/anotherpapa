package com.infrasofttech.domain.entities;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

import com.infrasofttech.utils.OmniConstants;


@Entity


@NamedQueries({ @NamedQuery(name = "CropTypeParam.getUniqueCropType", query = "SELECT c FROM CropTypeParam c WHERE c.tenantId=:tenantId AND c.cropType=:cropType AND c.fromDate=:fromDate AND c.isActive=true"),
   
    @NamedQuery(name = "CropTypeParam.getDisableCropType", query = "SELECT c FROM CropTypeParam c WHERE c.tenantId=:tenantId AND c.cropType=:cropType AND fromDate=:fromDate AND c.isActive=false")})
  	
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "tenantId",
"cropType" , "fromDate"}))
public class CropTypeParam extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(length = 20, nullable = true)
	private String cropType = "";

	@Temporal(TemporalType.DATE)
	private Date fromDate ;

	@Temporal(TemporalType.DATE)
	private Date toDate ;

	@Column(length = 20, nullable = true)
	private String currencyCode = ""; 
	
	@Column(length = 20, nullable = true)
	private Double ammount =0.0d;
	
	
	@Column(length = 100, nullable = true)
	private String month = "";

	@Column(length = 20, nullable = true)
	private Integer year ;
	@Column(nullable = true)
	private Boolean isActive = true;

	@Column(nullable = true, length = 50)
	private String authStatus = OmniConstants.AUTH_AUTHORIZED;

	
	public String getCropType() {
		return cropType;
	}

	public void setCropType(String cropType) {
		this.cropType = cropType;
	}

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	public Date getToDate() {
		return toDate;
	}

	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}


	public String getCurrencyCode() {
		return currencyCode;
	}

	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}

	public Double getAmmount() {
		return ammount;
	}

	public void setAmmount(Double ammount) {
		this.ammount = ammount;
	}


	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
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



