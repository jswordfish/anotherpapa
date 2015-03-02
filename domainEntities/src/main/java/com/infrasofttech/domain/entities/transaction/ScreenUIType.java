package com.infrasofttech.domain.entities.transaction;

public enum ScreenUIType {

TEXT("TEXT"), TEXTAREA("TEXTAREA"), CHECKBOX("CHECKBOX"), RADIO("RADIO"), SINGLE_SELECT_DROPDOWN("DROPDOWN"), MULTI_SELECT_DROPDOWN("MULTI_SELECT_DROPDOWN");
	
	private String val;
	
	
	private ScreenUIType(String value){
	this.val = value;	
	}


	public String getVal() {
		return val;
	}
}
