package com.infrasofttech.utils;

public enum MENUACTIONSTATUS {

	ACTIVE("ACTIVE"), INACTIVE("INACTIVE"), DISABLED("DISABLED");
	
	String code;
	
	MENUACTIONSTATUS(String code){
		this.code = code;
	}

	public String getCode() {
		return code;
	}
	
	
}
