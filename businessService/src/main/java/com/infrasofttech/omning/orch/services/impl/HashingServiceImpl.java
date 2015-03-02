package com.infrasofttech.omning.orch.services.impl;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.orch.services.EmailerService;
import com.infrasofttech.omning.orch.services.HashingService;

@Service("hashingService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class HashingServiceImpl implements HashingService {

	private static final Logger logger = Logger.getLogger(HashingServiceImpl.class);

	@Autowired
    EmailerService emailerService;
	
	private  SecureRandom random = new SecureRandom();
	private  String cPwd; // system generated Pwd
	private  String saltPwd;
 
	 /*      GET SYSTEM GENERATED  PASSWORD   */
	public  String generateRandomStrPwd() {
		cPwd = new BigInteger(32, random).toString(32);
		return cPwd;
	}
	  
	  /*      EMAIL SYSTEM GENERATED PASSWORD   */
	  
	  public  boolean sendMailPwd(){
		
		  //TODO email the cPwd  
		  
		  return true;
	  }
	  
	  /*      GET HASHED SYSTEM GENERATED PASSWORD   */
	  
	 public  String getHashedStrPwd() 	throws NoSuchAlgorithmException, UnsupportedEncodingException {
        StringBuilder sb = new StringBuilder();
        cPwd = generateRandomStrPwd();
        
        System.out.println("LoginUtil --->system generated pwd ------> : "+cPwd);
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            byte[] bytes = md.digest(cPwd.getBytes("UTF-8"));
            for(int i=0; i< bytes.length ;i++) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
        } 
        catch (NoSuchAlgorithmException e){
        	System.out.println("LoginUtils.getHashedStrPwd() ---->catch()");
        	e.printStackTrace();
        } 
		return sb.toString();
	}

	 public  String getHashedStrPwd(String tenantId,String loginId,String emailConfigType,String emailId,String displayName) 	throws NoSuchAlgorithmException, UnsupportedEncodingException {
		 	StringBuilder sb = new StringBuilder();
        cPwd = generateRandomStrPwd();
        System.out.println("PASSWORD IS :::"+cPwd);
        cPwd="abcd1234";   //TODO temporary password as email is not working
        String hashedPassword = null ;
		String subject="";
		String emailMsge="";
			
		boolean plainwithoutAttachment = false;
		     
		/*try {
			userMst=userMstService.getUserBasedOnLogin(tenantId, loginId);
			emailId= userMst.getEmailId();
			displayName= userMst.getUserDisplayName();
			System.out.println(displayName);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			System.out.println("emailId donot exist");
			e1.printStackTrace();
		}
		  System.out.println("email Id "+emailId);*/
		  emailMsge= "Hi"+displayName+","+"\n"+"LoginId :"+loginId+"\n"+"Password :"+cPwd+"\n";
		  System.out.println("LOGIN ID And PASSWORD   "+emailMsge);
		if(emailId!=null){
				System.out.println("EmailPasswordServiceImpl.mailPassword()-------In IF emailID :"+emailId);
		subject="User is Created!!!";
		//						try {
		//							plainwithoutAttachment = emailerService.sendMailPlainwithoutAttachment(tenantId, emailConfigType, emailId, "", "", subject, emailMsge);
		//						} catch (IOException e1) {
		//							// TODO Auto-generated catch block
		//							e1.printStackTrace();
		//						} catch (MessagingException e1) {
		//							// TODO Auto-generated catch block
		//							e1.printStackTrace();
		//						} catch (EmailException e1) {
		//							
		//							e1.printStackTrace();
		//						}
			
		if(plainwithoutAttachment==true){
			System.out.println("mail sent successfully");
		}
		else{
			System.out.println("failed to send");
			}
		} 
		
		try {
		    MessageDigest md = MessageDigest.getInstance("SHA-512");
		byte[] bytes = md.digest(cPwd.getBytes("UTF-8"));
		    for(int i=0; i< bytes.length ;i++) {
		        sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
		        hashedPassword = sb.toString();
		    }
		} 
		catch (NoSuchAlgorithmException e){
			System.out.println("LoginUtils.getHashedStrPwd() ---->catch()");
			e.printStackTrace();
		} 
		return hashedPassword;
	 }

	 /* GET SALT PASSWORD */
	public  String getSaltPwd() throws NoSuchAlgorithmException {
		
		SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
	    byte[] salt = new byte[8];
	    sr.nextBytes(salt);
	    saltPwd =salt.toString();
	    System.out.println("Salt Pwd :::" + saltPwd);
		return saltPwd;
	}
	
	
  /*      GET HASHED SALT PASSWORD   */
	@Transactional(propagation=Propagation.REQUIRES_NEW)
	public  String getHashedSaltPwd() throws NoSuchAlgorithmException, UnsupportedEncodingException{
		 StringBuilder sb = new StringBuilder();
		 String hasSaltPwd = getSaltPwd();
	        
	        System.out.println("LoginUtil--->hasSaltPwd ------> : "+hasSaltPwd);
	        try {
	            MessageDigest md = MessageDigest.getInstance("SHA-512");
	            byte[] bytes = md.digest(hasSaltPwd.getBytes("UTF-8"));
	            for(int i=0; i< bytes.length ;i++) {
	                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
	            }
	        } 
	        catch (NoSuchAlgorithmException e){
	        	System.out.println("LoginUtils.getHashedStrPwd() ---->catch()");
	        	e.printStackTrace();
	        } 
			return sb.toString();
	}

	/**
	 * main() function is only for testing purpose
	 */
/*	public static void main(String[] args) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		LoginUtils loginUtils = new LoginUtils();
		System.out.println("generateRandomPwd : "+loginUtils.generateRandomStrPwd());
		String str = "infraId";
		System.out.println("----------------------------------------");
		System.out.println(loginUtils.getHashedStrPwd());
		System.out.println("------------------");
		System.out.println(loginUtils.getHashedStrPwd().length());
		System.out.println("------------------");
		System.out.println(loginUtils.getSaltPwd("user"));
		System.out.println("------------------");
		System.out.println("------------------");
		//System.out.println(getHashedSaltPwd loginUtils.hashSaltPwd));
		System.out.println("------------------");
		
	}*/
}
