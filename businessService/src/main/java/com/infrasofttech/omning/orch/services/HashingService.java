/**
 * @author Mahesh Laddha
 *
 */

package com.infrasofttech.omning.orch.services;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

public interface HashingService {
	
	public  String generateRandomStrPwd();
	public  boolean sendMailPwd();
	public  String getHashedStrPwd() 	throws NoSuchAlgorithmException, UnsupportedEncodingException;
	public  String getHashedStrPwd(String tenantId,String loginId,String emailConfigType,String emailId,String displayName) 	throws NoSuchAlgorithmException, UnsupportedEncodingException;
	public  String getSaltPwd() throws NoSuchAlgorithmException;
	public  String getHashedSaltPwd() throws NoSuchAlgorithmException, UnsupportedEncodingException;
}
