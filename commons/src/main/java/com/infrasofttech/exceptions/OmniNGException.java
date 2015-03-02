package com.infrasofttech.exceptions;

public class OmniNGException extends RuntimeException {

	private static final long serialVersionUID = 1L;
	
	String error;
	
	Throwable t;

	public OmniNGException() {
	}

	public OmniNGException(String err) {
		this.error = err;
	}

	public OmniNGException(String err, Throwable t) {
		this.error = err;
		this.t = t;
	}

}