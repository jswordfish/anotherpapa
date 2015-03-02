package com.infrasofttech.utils;

public enum AUTHMODE {


	SELF("SELF"), MKRCKR("MKRCKR"), MULTI("MULTI");
	
	String code;
	
	AUTHMODE(String code){
		this.code = code;
	}

	public String getCode() {
		return code;
	}
	
	
}
