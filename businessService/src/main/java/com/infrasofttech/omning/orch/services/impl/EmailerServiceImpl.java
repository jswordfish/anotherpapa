package com.infrasofttech.omning.orch.services.impl;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.domain.entities.EmailConfig;
import com.infrasofttech.exceptions.EmailException;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.orch.services.EmailerService;
import com.infrasofttech.omning.services.EmailConfigService;

@Service("emailerService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class EmailerServiceImpl implements EmailerService {

	private static final Logger logger = Logger.getLogger(EmailerServiceImpl.class);
	
	@Autowired
	EmailConfigService emailConfigService;
	
	private	String userName;
	private	String passWord;
	private	String port;
	private	boolean smtpAuth;
	private	boolean smtpStarttls;
	private String smtpHost;
	private String transportProtocol;
	Session mailSession = null;
	//private EmailConfig emailConfig=new EmailConfig();

	/********************** MAIL SERVER AUTHENTICATOR CLASS************************************/
	private class MailAuthenticator extends javax.mail.Authenticator {
		String userName;String passWord;
		public MailAuthenticator(String userName, String passWord) {
			super();this.userName = userName;this.passWord = passWord;
		}
		public PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(userName, passWord);
		}
	}

	/********************** EMAIL SERVER CONNECTION************************************/
	private Message getEmailServerConnection(String tenantId, String emailConfigCode) throws MessagingException, IOException{
		EmailConfig emailConfig = emailConfigService.getEmailConfigByUniqueComposite(tenantId, emailConfigCode);
		if(emailConfig!=null){
		userName =emailConfig.getFromUser();//"nazneen.ansari@infrasofttech.com";// AppCachingServlet.mapEmailProp.get(tenantCode).get(emailConfigCode).get("FROMUSER");
		System.out.println("userName>>>>>>>>>>>"+userName);
		passWord 			= emailConfig.getFromPwd();//"Anznn#79";//AppCachingServlet.mapEmailProp.get(tenantCode).get(emailConfigCode).get("FROMPWD");
		System.out.println("password"+passWord);
		smtpHost 			= emailConfig.getEmailHost();//"infrasofttech-com-smtp.mail.lotuslive.com";//AppCachingServlet.mapEmailProp.get(tenantCode).get(emailConfigCode).get("EMAILHOST");
		System.out.println("smtpHost"+smtpHost);
		port 				=emailConfig.getSmtpPort();// "465";//AppCachingServlet.mapEmailProp.get(tenantCode).get(emailConfigCode).get("SMTPPORT");
		System.out.println("port>>>>"+port);
		transportProtocol	= emailConfig.getTransportProtocol();//"smtps";//AppCachingServlet.mapEmailProp.get(tenantCode).get(emailConfigCode).get("TRANSPORTPROTOCOL");
		System.out.println("transportProtocol"+transportProtocol);
		smtpAuth 			= true;//AppCachingServlet.mapEmailProp.get(tenantCode).get(emailConfigCode).get("SMTPAUTH");
		smtpStarttls 		= true;//AppCachingServlet.mapEmailProp.get(tenantCode).get(emailConfigCode).get("SMTPSTARTTLS");
        
		//--------------------------------------------------------------------------------------------\\
		Properties properties = new Properties();
		properties.put("userName", userName);
		properties.put("passWord", passWord);
		properties.put("hostName", smtpHost);
		properties.put("port", port);
		properties.put("transportProtocol", transportProtocol);
		properties.put("smtpAuth", smtpAuth);
		properties.put("smtpStarttls", smtpStarttls);
		
		
		try {Authenticator auth = new Authenticator() {
            //override the getPasswordAuthentication method
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, passWord);
            }
        };
		
			mailSession = Session.getDefaultInstance(properties, auth);
		}catch(Exception e) {
			//TODO Throw new EmailException
			e.printStackTrace();
		}
		finally {}
		}
		mailSession.setDebug(true);
		
		Message msg = new MimeMessage(mailSession);
		return msg;
	}

	/********************** TO SEND A HTML EMAIL WITH ATTACHMENT @throws EmailException ************************************/
/*	public Boolean sendMailHTMLwithAttachment(String tenantCode, String emailConfigType, 
				String to, String cc, String bcc, String sub, String emailMsg, String[] attachFiles) 
													throws IOException, MessagingException, EmailException {

		//getEmailServerConnection(tenantCode, emailConfigType);
		Boolean result = false;
		Transport transport = null;
		try {
			Message msg = getEmailServerConnection(tenantCode, emailConfigType);
			transport = mailSession.getTransport(transportProtocol.toLowerCase());
			
			// If To & Cc are empty, return back with error. Either of them should be present.
			if(null == to && null == cc) {
				result = false;
				throw new EmailException("No receipients provided");
			} else {
				if(to.length() > 0) {
					msg.setRecipient(Message.RecipientType.TO , new InternetAddress(to));
				}
				
				if(cc.length() > 0) {
					msg.setRecipient(Message.RecipientType.CC , new InternetAddress(cc));
				}
				
				if(bcc.length() > 0) {
					msg.setRecipient(Message.RecipientType.BCC , new InternetAddress(bcc));
				}
				
				if(sub.length() > 0) {
					msg.setSubject(sub);
				}

				msg.setSentDate(new Date());

				if(emailMsg.length() > 0) {
					msg.setText(emailMsg);
				}

				MimeBodyPart messageBodyPart = new MimeBodyPart();
				messageBodyPart.setContent(emailMsg, "text/html; charset=UTF-8");
	
				Multipart multipart = new MimeMultipart();
				multipart.addBodyPart(messageBodyPart);

				// ATTACH FILE
				if (attachFiles != null && attachFiles.length > 0) {
					for (String filePath : attachFiles) {
						MimeBodyPart attachPart = new MimeBodyPart();
						try {
							attachPart.attachFile(filePath);
						} catch (IOException ex) {
							ex.printStackTrace();
						}
						multipart.addBodyPart(attachPart);
					}
	
					// sets the multi-part as e-mail's content
					msg.setContent(multipart);
					transport.connect(smtpHost, userName, passWord);
					transport.sendMessage(msg, msg.getAllRecipients());
				}
				result = true;
			}
		}
		catch (MessagingException e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			result = false;
		}finally {
			transport.close();
		}
		return result;
	}
*/
	/********************** TO SEND A PLAIN EMAIL WITH ATTACHMENT ************************************/
	public Boolean sendMailPlainwithAttachment(String tenantCode, String emailConfigType,
			String to, String cc, String bcc, String sub, String emailMsg, String[] attachFiles) 
							throws IOException, MessagingException, EmailException {
		

		//getEmailServerConnection(tenantCode, emailConfigType);
		Boolean result = false;
		Transport transport = null;
		try {
			Message msg = getEmailServerConnection(tenantCode, emailConfigType);
			transport = mailSession.getTransport(transportProtocol.toLowerCase());
			
			// If To & Cc are empty, return back with error. Either of them should be present.
			if(null == to && null == cc) {
				result = false;
				throw new EmailException("No receipients provided");
			} else {
				if(to.length() > 0) {
					msg.setRecipient(Message.RecipientType.TO , new InternetAddress(to));
				}
				
				if(cc.length() > 0) {
					msg.setRecipient(Message.RecipientType.CC , new InternetAddress(cc));
				}
				
				if(bcc.length() > 0) {
					msg.setRecipient(Message.RecipientType.BCC , new InternetAddress(bcc));
				}
				
				if(sub.length() > 0) {
					msg.setSubject(sub);
				}

				msg.setSentDate(new Date());

				if(emailMsg.length() > 0) {
					msg.setText(emailMsg);
				}

				MimeBodyPart messageBodyPart = new MimeBodyPart();
				messageBodyPart.setContent(emailMsg, "text/plain; charset=UTF-8");
	
				Multipart multipart = new MimeMultipart();
				multipart.addBodyPart(messageBodyPart);

				// ATTACH FILE
				if (attachFiles != null && attachFiles.length > 0) {
					for (String filePath : attachFiles) {
						MimeBodyPart attachPart = new MimeBodyPart();
						try {
							attachPart.attachFile(filePath);
						} catch (IOException ex) {
							ex.printStackTrace();
						}
						multipart.addBodyPart(attachPart);
					}
	
					// sets the multi-part as e-mail's content
					msg.setContent(multipart);
					transport.connect(smtpHost, userName, passWord);
					transport.sendMessage(msg, msg.getAllRecipients());
				}
				result = true;
			}
		}
		catch (MessagingException e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			result = false;
		}finally {
			transport.close();
		}
		return result;
	}

	/********************** TO SEND A HTML WITHOUT ATTACHMENT ************************************/
				// sendMailHTMLwithoutAttachment("01","NEWUSER", "to", "cc", "","",""); 
	public Boolean sendMailHTMLwithoutAttachment(String tenantCode, String emailConfigType, 
				String to, String cc, String bcc, String sub, String emailMsg) 
								throws IOException, MessagingException, EmailException {		
		
		//getEmailServerConnection(tenantCode, emailConfigType);
		Boolean result = false;
		Transport transport = null;
		try {
			Message msg = getEmailServerConnection(tenantCode, emailConfigType);
			transport = mailSession.getTransport(transportProtocol.toLowerCase());
			
			// If To & Cc are empty, return back with error. Either of them should be present.
			if(null == to && null == cc) {
				result = false;
				throw new EmailException("No receipients provided");
			} else {
				if(to.length() > 0) {
					msg.setRecipient(Message.RecipientType.TO , new InternetAddress(to));
				}
				
				if(cc.length() > 0) {
					msg.setRecipient(Message.RecipientType.CC , new InternetAddress(cc));
				}
				
				if(bcc.length() > 0) {
					msg.setRecipient(Message.RecipientType.BCC , new InternetAddress(bcc));
				}
				
				if(sub.length() > 0) {
					msg.setSubject(sub);
				}

				msg.setSentDate(new Date());

				if(emailMsg.length() > 0) {
					msg.setText(emailMsg);
				}

				MimeBodyPart messageBodyPart = new MimeBodyPart();
				messageBodyPart.setContent(emailMsg, "text/html; charset=UTF-8");
	
				Multipart multipart = new MimeMultipart();
				multipart.addBodyPart(messageBodyPart);

				result = true;
			}
		}
		catch (MessagingException e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			result = false;
		}finally {
			if(transport!=null) {
				transport.close();
			}
		}
		return result;
	}

	/********************** TO SEND A plain mail WITHOUT ATTACHMENT ************************************/
public boolean sendMailPlainwithoutAttachment(String tenantCode, String emailConfigType,String to, String cc, String bcc, String sub, String emailMsg) throws IOException, MessagingException, EmailException {
		Transport transport= null;
		//getEmailServerConnection(emailConfig);
		Boolean result = false;

		try {
			
			Message msg = getEmailServerConnection(tenantCode, emailConfigType);
			transport = mailSession.getTransport(transportProtocol.toLowerCase());
			
			// If To & Cc are empty, return back with error. Either of them should be present.
			if(null == to && null == cc) {
				return false;
			} else {
				if(to.length()>0) {
					msg.setRecipient(Message.RecipientType.TO , new InternetAddress(to));
				}
				
				if(cc.length()>0) {
					msg.setRecipient(Message.RecipientType.CC , new InternetAddress(cc));
				}
				
				if(bcc.length()>0) {
					msg.setRecipient(Message.RecipientType.BCC , new InternetAddress(bcc));
				}
				
				if(sub.length()>0) {
					msg.setSubject(sub);
				}
				msg.setSentDate(new Date());

				if(emailMsg.length()>0) {
					msg.setText(emailMsg);
				}
				
				MimeBodyPart messageBodyPart = new MimeBodyPart();
				messageBodyPart.setContent(emailMsg, "text/plain; charset=UTF-8");
				System.out.println("email 1");
				// creates multi-part
				Multipart multipart = new MimeMultipart();
				multipart.addBodyPart(messageBodyPart);
				System.out.println("email 2");
				// sets the multi-part as e-mail's content
				msg.setContent(multipart);
				System.out.println("3");
				//transport.connect(smtpHost, userName, passWord);
				System.out.println("4");
				//transport.sendMessage(msg,msg.getAllRecipients());
				System.out.println("5");
				result = true;
			}
		}
		catch (MessagingException e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			result = false;
		}finally {
			if(transport!=null) {
				transport.close();
			}
		}
		return result;
	}
}
