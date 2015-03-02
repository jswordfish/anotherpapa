package com.infrasofttech.omning.utils;

public final class ErrorCodes {

	/**
	 * User Authentication
	 */
	public static final String NOSUCHBRANCH = "Login Failure";
	public static final String NOSUCHUSER = "Login Failure";
	public static final String INVALIDLOGIN = "Login Failure";
	public static final String CURRENTPWDNOTMATCH = "Current Password is Wrong";
	public static final String USERLOCKED = "User is Locked! Contact Administrator.";
	public static final String USERCONCURRENTLOGIN = "Concurrent Logins NOT Allowed!";
	public static final String INVALIDPWD = "Login Failure";
	public static final String USERINACTIVE = "Login Failure";
	public static final String PWDEXPIRE = "Password expired!";
	public static final String SESSIONEXPIRE = "Session Expire";
	public static final String ILLEGALACCESS = "Illegal Access";

	public static final String USERACCESSCTRLCACHESUCCESS = "Success";
	public static final String USERACCESSCTRLCACHEFAILURE = "Failure";
	public static final String ROLECODEALLREADYEXIST = "Role Code All Ready Exist !";
	public static final String LOGINIDEXISTS = "Login Id Already Exists";
	public static final String NOSUCHAUTHMATRIX = "No Record Found";
	public static final String RECORDSAVED = "Record Saved Successfully!";
	// Define Exception Codes - Security, Business

	/**
	 * Data Persistence
	 */
	public static final String SAVEERROR = "Error in Saving Data";

	/**
	 * General
	 */
	public static final String SUCCESS = "Success";
}
