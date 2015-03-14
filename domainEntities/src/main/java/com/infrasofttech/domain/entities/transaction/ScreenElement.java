package com.infrasofttech.domain.entities.transaction;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import com.infrasofttech.domain.entities.Base;


@Entity
@NamedQueries({
	@NamedQuery(name = "ScreenElement.getScreenElement", query = "SELECT s FROM ScreenElement s WHERE s.tenantId=:tenantId "
			+ "  AND s.name=:name") })
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "tenantId", "name"}))
public class ScreenElement extends Base{
	
	

	@Column(nullable = false, length = 60)
	private String name = "";
	
	@Column(nullable = false, length = 60)
	private String displayName = "";

	@Column(nullable = true, length = 400)
	private String value;
	
	@Column(nullable = true, length = 60)
	private String lookupCode = "";
	
	private Boolean isActive = true;
	
	@Transient
	private List<String> lookupValues;//look up values
	
	@Enumerated(EnumType.STRING)
	private ScreenDataType screenDataType = ScreenDataType.String;
	
	@Enumerated(EnumType.STRING)
	private ScreenUIType screenUIType = ScreenUIType.TEXT;
	
	private String voucherAttr = "";
	
	private Boolean isDerived = false;
	
	private String sourceDerivedField = "";
	
	private String derivedFieldIdentifier = "PrdAcctId";
	
	private String derivedFieldIdentifierValue = "";

	public String getName() {
		
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public List<String> getLookupValues() {
		return lookupValues;
	}

	public void setLookupValues(List<String> lookupValues) {
		this.lookupValues = lookupValues;
	}

	
	public ScreenDataType getScreenDataType() {
		return screenDataType;
	}

	public void setScreenDataType(ScreenDataType screenDataType) {
		this.screenDataType = screenDataType;
	}

	public ScreenUIType getScreenUIType() {
		return screenUIType;
	}

	public void setScreenUIType(ScreenUIType screenUIType) {
		this.screenUIType = screenUIType;
	}

	public String getLookupCode() {
		return lookupCode;
	}

	public void setLookupCode(String lookupCode) {
		this.lookupCode = lookupCode;
	}
	
	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public String getVoucherAttr() {
		return voucherAttr;
	}

	public void setVoucherAttr(String voucherAttr) {
		this.voucherAttr = voucherAttr;
	}

	public Boolean getIsDerived() {
		return isDerived;
	}

	public void setIsDerived(Boolean isDerived) {
		this.isDerived = isDerived;
		
		if(this.isDerived){
			setScreenUIType(ScreenUIType.TEXT);
		}
	}

	public String getSourceDerivedField() {
		return sourceDerivedField;
	}

	public void setSourceDerivedField(String sourceDerivedField) {
		this.sourceDerivedField = sourceDerivedField;
	}

	public String getDerivedFieldIdentifier() {
		return derivedFieldIdentifier;
	}

	public void setDerivedFieldIdentifier(String derivedFieldIdentifier) {
		this.derivedFieldIdentifier = derivedFieldIdentifier;
	}

	public String getDerivedFieldIdentifierValue() {
		return derivedFieldIdentifierValue;
	}

	public void setDerivedFieldIdentifierValue(String derivedFieldIdentifierValue) {
		this.derivedFieldIdentifierValue = derivedFieldIdentifierValue;
	}
	
	
}
