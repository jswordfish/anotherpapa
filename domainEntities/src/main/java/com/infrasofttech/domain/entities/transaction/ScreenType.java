package com.infrasofttech.domain.entities.transaction;

public enum ScreenType {
INFO("INFO"), BALANCE("BALANCE"), TRANSACTION("TRANSACTION");
	
	private String val;
	
	
	private ScreenType(String value){
	this.val = value;	
	}


	public String getVal() {
		return val;
	}
}
