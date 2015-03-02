package com.infrasofttech.domain.entities.transaction;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Transient;

import com.infrasofttech.domain.entities.Base;

@Entity
public class ScreenElement extends Base{
	
	

	@Column(nullable = false, length = 60)
	private String name;
	
	@Column(nullable = false, length = 60)
	private String displayName;

	@Column(nullable = true, length = 400)
	private String value;
	
	@Column(nullable = true, length = 60)
	private String lookupCode;
	
	@Transient
	private List<String> lookupValues;//look up values
	
	@Enumerated(EnumType.STRING)
	private ScreenDataType screenDataType = ScreenDataType.String;
	
	@Enumerated(EnumType.STRING)
	private ScreenUIType screenUIType = ScreenUIType.TEXT;

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
	

}
