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

@Entity
@NamedQueries({ @NamedQuery(name = "AppConfig.getAppConfig", query = "SELECT p FROM AppConfig p WHERE p.tenantId=:tenantId AND p.branchCode=:branchCode AND p.isActive=true"),
	            @NamedQuery(name = "AppConfig.getAppConfigBySetNoTenant", query = "SELECT p FROM AppConfig p WHERE p.tenantId=:tenantId AND p.setNo=:setNo AND p.isActive=true"),
	            @NamedQuery(name = "AppConfig.getAppConfigByIsActiveFalse", query = "SELECT p FROM AppConfig p WHERE p.tenantId=:tenantId AND p.branchCode=:branchCode AND p.isActive=false")})
			  	
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "tenantId",
		"branchCode" }))
public class AppConfig extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	/*Calendar cal = Calendar.getInstance();
	Date currFromDate = cal.getTime();*/
	
	@Column(nullable = true, length = 20)
	private String branchCode = "";

	@Temporal(TemporalType.DATE)
	private Date effFromDate;//=currFromDate;

	@Temporal(TemporalType.DATE)
	private Date effToDate;
	
	@Column(nullable = true, length = 20)
	private Long setNo;
	
	@Column(nullable = true, length = 20)
	private String dateFormatStr = "";

	@Column(nullable = true, length = 20)
	private String numberFormatStr = "";

	@Column(nullable = true, length = 20)
	private String amountFormatStr = "";

	@Column(nullable = true, length = 20)
	private String decimalCharacter = "";

	@Column(nullable = true, length = 20)
	private String digitSeparator = "";

	@Column(nullable = true)
	private Integer paginationSize = 10;

	@Column(nullable = true)
	private Integer CustomerIdLen = 0;

	@Column(nullable = true, length = 20)
	private String CustomerIdLenTypeCode = ""; // from lookup (system)

	@Column(nullable = true, length = 20)
	private String customerIdGenType = "";

	@Column(nullable = true)
	private Boolean isActive = true;

	@Column(nullable = true, length = 30)
	private String authStatus = "";


	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public String getDateFormatStr() {
		return dateFormatStr;
	}

	public void setDateFormatStr(String dateFormatStr) {
		this.dateFormatStr = dateFormatStr;
	}

	public String getNumberFormatStr() {
		return numberFormatStr;
	}

	public void setNumberFormatStr(String numberFormatStr) {
		this.numberFormatStr = numberFormatStr;
	}

	public String getAmountFormatStr() {
		return amountFormatStr;
	}

	public void setAmountFormatStr(String amountFormatStr) {
		this.amountFormatStr = amountFormatStr;
	}

	public String getDecimalCharacter() {
		return decimalCharacter;
	}

	public void setDecimalCharacter(String decimalCharacter) {
		this.decimalCharacter = decimalCharacter;
	}

	public String getDigitSeparator() {
		return digitSeparator;
	}

	public void setDigitSeparator(String digitSeparator) {
		this.digitSeparator = digitSeparator;
	}

	public Integer getCustomerIdLen() {
		return CustomerIdLen;
	}

	public void setCustomerIdLen(Integer customerIdLen) {
		CustomerIdLen = customerIdLen;
	}

	public String getCustomerIdLenTypeCode() {
		return CustomerIdLenTypeCode;
	}

	public void setCustomerIdLenTypeCode(String customerIdLenTypeCode) {
		CustomerIdLenTypeCode = customerIdLenTypeCode;
	}


	public Long getSetNo() {
		return setNo;
	}

	public void setSetNo(Long setNo) {
		this.setNo = setNo;
	}

	public String getCustomerIdGenType() {
		return customerIdGenType;
	}

	public void setCustomerIdGenType(String customerIdGenType) {
		this.customerIdGenType = customerIdGenType;
	}

	public Integer getPaginationSize() {
		return paginationSize;
	}

	public void setPaginationSize(Integer paginationSize) {
		this.paginationSize = paginationSize;
	}

	public String getAuthStatus() {
		return authStatus;
	}

	public void setAuthStatus(String authStatus) {
		this.authStatus = authStatus;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public Date getEffFromDate() {
			
		return effFromDate ;
	}

	public void setEffFromDate(Date effFromDate) {
		this.effFromDate = effFromDate;
	}

	public Date getEffToDate() {
		/*Calendar cal1 = Calendar.getInstance();
		cal1.set(2099, 11, 31);
		Date currToDate = cal1.getTime();*/
		return effToDate;//=currToDate;
		
	}

	public void setEffToDate(Date effToDate) {
		this.effToDate = effToDate;
	}


}
