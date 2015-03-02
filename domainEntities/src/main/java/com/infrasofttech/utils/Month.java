package com.infrasofttech.utils;

public enum Month {
	
	JANUARY("January"),
	FEBRUARY("February"), 
	MARCH("March"), 
	APRIL("April"), 
	MAY("May"), 
	JUNE("June"), 
	JULY("July"), 
	AUGUST("August"), 
	SEPTEMBER("September"), 
	OCTOBER("October"), 
	NOVEMBER("November"), 
	DECEMBER("December");

	private String id;

    private Month(String id)
    {
        this.id = id;
    }

    public String getId()
    {
        return id;
    }

}
