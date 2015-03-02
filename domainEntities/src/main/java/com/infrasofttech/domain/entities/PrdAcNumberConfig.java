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
@NamedQueries({
	@NamedQuery(name="PrdAcNumberConfig.getPrdAcNumberConfig", 
			query="SELECT p FROM PrdAcNumberConfig p WHERE p.tenantId=:tenantId AND "
			+ " p.moduleCode=:moduleCode AND p.productCode=:productCode AND "
			+ " p.isActive=true")
,

@NamedQuery(name="PrdAcNumberConfig.getproductByModule", 
query="SELECT p FROM ProductMst p WHERE p.tenantId=:tenantId AND "
+ " p.moduleCode=:moduleCode  AND " 
+ " p.isActive=true"),
	@NamedQuery(name = "PrdAcNumberConfig.getDisabledPrdAcNo", query = "SELECT p FROM PrdAcNumberConfig p WHERE p.tenantId=:tenantId AND "
			+ " p.moduleCode=:moduleCode AND "
			+ " p.productCode=:productCode AND"
			+ " p.isActive=false")
		
})
@Table(uniqueConstraints=@UniqueConstraint(columnNames = {"tenantId", "moduleCode", "productCode"})) 
public class PrdAcNumberConfig extends Base{

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true)
	private String moduleCode="";

	@Column(nullable = true)
	private String productCode="";
	
	@Column(nullable = true)
	private Integer totalAccountLen=0;

	@Column(nullable = true)
	private Integer totalSubAccountLen=0;
	
//	@OneToMany(fetch=FetchType.EAGER)
//	private Collection<ProductMst> products = new ArrayList<ProductMst>();

	@Column(nullable = true)
	private Boolean branchYN=false;

	@Column(nullable = true)
	private Integer branchRank=0;

	@Column(nullable = true)
	private Integer branchLen=0;

	@Column(nullable = true)
	private Boolean currencyYN=false;

	@Column(nullable = true)
	private Integer currencyRank=0;

	@Column(nullable = true)
	private Integer currencyLen=0;

	@Column(nullable = true)
	private Boolean productYN=false;

	@Column(nullable = true)
	private Integer productRank=0;

	@Column(nullable = true)
	private Integer productLen=0;

	@Column(nullable = true)
	private Boolean customerYN=false;

	@Column(nullable = true)
	private Integer customerRank=0;

	@Column(nullable = true)
	private Integer customerLen=0;

	@Column(nullable = true)
	private Boolean accountYN=false;

	@Column(nullable = true)
	private Integer accountRank=0;

	@Column(nullable = true)
	private Integer accountLen=0;

	@Column(nullable = true)
	private Boolean subAccountYN=false;

	@Column(nullable = true)
	private Integer subAccountRank=0;

	@Column(nullable = true)
	private Integer subAccountLen=0;

	@Temporal(TemporalType.DATE)
	private Date effFromDate;

	@Temporal(TemporalType.DATE)
	private Date effTillDate;
	
	@Column(nullable = true)
	private String sepr="";

	@Column(nullable = true)
	private Boolean isActive = true;

	@Column(nullable = true, length=30)
	private String authStatus="";

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

	public Integer getTotalAccountLen() {
		return totalAccountLen;
	}

	public void setTotalAccountLen(Integer totalAccountLen) {
		this.totalAccountLen = totalAccountLen;
	}

	public Integer getTotalSubAccountLen() {
		return totalSubAccountLen;
	}

	public void setTotalSubAccountLen(Integer totalSubAccountLen) {
		this.totalSubAccountLen = totalSubAccountLen;
	}

	public Boolean getBranchYN() {
		return branchYN;
	}

	public void setBranchYN(Boolean branchYN) {
		this.branchYN = branchYN;
	}

	public Integer getBranchRank() {
		return branchRank;
	}

	public void setBranchRank(Integer branchRank) {
		this.branchRank = branchRank;
	}

	public Integer getBranchLen() {
		return branchLen;
	}

	public void setBranchLen(Integer branchLen) {
		this.branchLen = branchLen;
	}

	public Boolean getCurrencyYN() {
		return currencyYN;
	}

	public void setCurrencyYN(Boolean currencyYN) {
		this.currencyYN = currencyYN;
	}

	public Integer getCurrencyRank() {
		return currencyRank;
	}

	public void setCurrencyRank(Integer currencyRank) {
		this.currencyRank = currencyRank;
	}

	public Integer getCurrencyLen() {
		return currencyLen;
	}

	public void setCurrencyLen(Integer currencyLen) {
		this.currencyLen = currencyLen;
	}

	public Boolean getProductYN() {
		return productYN;
	}

	public void setProductYN(Boolean productYN) {
		this.productYN = productYN;
	}

	public Integer getProductRank() {
		return productRank;
	}

	public void setProductRank(Integer productRank) {
		this.productRank = productRank;
	}

	public Integer getProductLen() {
		return productLen;
	}

	public void setProductLen(Integer productLen) {
		this.productLen = productLen;
	}

	public Boolean getCustomerYN() {
		return customerYN;
	}

	public void setCustomerYN(Boolean customerYN) {
		this.customerYN = customerYN;
	}

	public Integer getCustomerRank() {
		return customerRank;
	}

	public void setCustomerRank(Integer customerRank) {
		this.customerRank = customerRank;
	}

	public Integer getCustomerLen() {
		return customerLen;
	}

	public void setCustomerLen(Integer customerLen) {
		this.customerLen = customerLen;
	}

	public Boolean getAccountYN() {
		return accountYN;
	}

	public void setAccountYN(Boolean accountYN) {
		this.accountYN = accountYN;
	}

	public Integer getAccountRank() {
		return accountRank;
	}

	public void setAccountRank(Integer accountRank) {
		this.accountRank = accountRank;
	}

	public Integer getAccountLen() {
		return accountLen;
	}

	public void setAccountLen(Integer accountLen) {
		this.accountLen = accountLen;
	}

	public Boolean getSubAccountYN() {
		return subAccountYN;
	}

	public void setSubAccountYN(Boolean subAccountYN) {
		this.subAccountYN = subAccountYN;
	}

	public Integer getSubAccountRank() {
		return subAccountRank;
	}

	public void setSubAccountRank(Integer subAccountRank) {
		this.subAccountRank = subAccountRank;
	}

	public Integer getSubAccountLen() {
		return subAccountLen;
	}

	public void setSubAccountLen(Integer subAccountLen) {
		this.subAccountLen = subAccountLen;
	}

	public Date getEffFromDate() {
		return effFromDate;
	}

	public void setEffFromDate(Date effFromDate) {
		this.effFromDate = effFromDate;
	}

	public Date getEffTillDate() {
		return effTillDate;
	}

	public void setEffTillDate(Date effTillDate) {
		this.effTillDate = effTillDate;
	}

	public String getSepr() {
		return sepr;
	}

	public void setSepr(String sepr) {
		this.sepr = sepr;
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
