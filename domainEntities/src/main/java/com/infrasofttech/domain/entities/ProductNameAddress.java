package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class ProductNameAddress extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable = true, length = 30)
	private String cateogry = "";
	@Column(nullable = true, length = 50)
	private String catType = "";
	@Column(nullable = true, length = 200)
	private String catDesc = "";
	@Column(nullable = true)
	private Integer minNumber = 0;
	@Column(nullable = true)
	private Integer maxNumber = 0;

	// @ManyToMany(mappedBy = "prdNameAddresses",cascade=CascadeType.ALL)
	// private Collection<ProductMst> productMsts = new ArrayList<ProductMst>();

	@Column(nullable = true)
	private Boolean isActive = true;

	public String getCateogry() {
		return cateogry;
	}

	public void setCateogry(String cateogry) {
		this.cateogry = cateogry;
	}

	public String getCatType() {
		return catType;
	}

	public void setCatType(String catType) {
		this.catType = catType;
	}

	public String getCatDesc() {
		return catDesc;
	}

	public void setCatDesc(String catDesc) {
		this.catDesc = catDesc;
	}

	public Integer getMinNumber() {
		return minNumber;
	}

	public void setMinNumber(Integer minNumber) {
		this.minNumber = minNumber;
	}

	public Integer getMaxNumber() {
		return maxNumber;
	}

	public void setMaxNumber(Integer maxNumber) {
		this.maxNumber = maxNumber;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
}
