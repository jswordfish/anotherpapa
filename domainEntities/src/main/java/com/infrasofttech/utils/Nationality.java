package com.infrasofttech.utils;

public enum Nationality {

	INDIAN("Indian"),
	NONRESIDENTINDIAN("Non Resident Indian"), 
	FOREIGNER("Foreigner");
	
	private String i;
	
	private Nationality() {
		
	}
	private Nationality(String i)
    {
        this.i = i;
    }
		



}
