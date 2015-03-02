package com.infrasofttech.domain.entities.transaction;

public enum ScreenDataType {
	String("String"), Number("Number"), Decimal("Decimal"), Date("Date"), Attachment("Attachment");
	
	private String val;
	
	
	private ScreenDataType(String value){
	this.val = value;	
	}


	public String getVal() {
		return val;
	}


	
	
	
}
