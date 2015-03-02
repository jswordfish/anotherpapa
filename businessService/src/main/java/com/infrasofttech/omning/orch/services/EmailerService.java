package com.infrasofttech.omning.orch.services;

import java.io.IOException;

import javax.mail.MessagingException;

import com.infrasofttech.exceptions.EmailException;

public interface EmailerService {

	public Boolean sendMailPlainwithAttachment(String tenantCode, String emailConfigType,
			String to, String cc, String bcc, String sub, String emailMsg, String[] attachFiles)
					throws IOException, MessagingException, EmailException;
	public Boolean sendMailHTMLwithoutAttachment(String tenantCode, String emailConfigType, 
			String to, String cc, String bcc, String sub, String emailMsg)
		throws IOException, MessagingException, EmailException; 
	public boolean sendMailPlainwithoutAttachment(String tenantCode, String emailConfigType,String to, 
					String cc, String bcc, String sub, String emailMsg) 
					throws IOException, MessagingException, EmailException;
}
