package com.infrasofttech.domain.entities.transaction;

public enum ScreenDataType {
	String("String"), Number("Number"), Decimal("Decimal"), Date("Date"), Attachment("Attachment"), Float("Float"), Double("Double"), Long("Long"), Integer("Integer");
	
	private String val;
	
	
	private ScreenDataType(String value){
	this.val = value;	
	}


	public String getVal() {
		return val;
	}


	public static ScreenDataType getScreenDataType(String str){
		for(ScreenDataType screenDataType: ScreenDataType.values()){
			if(screenDataType.getVal().equalsIgnoreCase(str)){
				return screenDataType;
			}
		}
		
		return null;
	}
	
	
}
