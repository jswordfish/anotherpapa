package com.infrasofttech.utils;

public enum MaritalStatus {
	
	MARRIED("Married"),
	UNMARRIED("Unmarried"), 
	DIVORCED("Divorced"), 
	WIDOW("Widow"), 
	WIDOWER("Widower");
	private String i;
	private MaritalStatus(){
		
	}
	private MaritalStatus(String i){
		this.i = i;
	}
}
