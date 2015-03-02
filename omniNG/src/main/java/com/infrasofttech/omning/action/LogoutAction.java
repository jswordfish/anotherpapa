/**
 * 
 */
package com.infrasofttech.omning.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(LogoutAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String branchCode="";
	private String loginId="";
	
	private String errMsg = "";
	
	public String execute() throws Exception {
		try{
			request.getSession().invalidate();
			if (request.getSession(false) == null)
			{ 
				System.out.println("SESSION EXPIRED");
				//Session expired 
				errMsg = ErrorCodes.SESSIONEXPIRE;	
				logger.info(errMsg);
				session.invalidate(); 
				retVal =  OmniConstants.LOGIN;	  
			} else {
				session = request.getSession(false);
				tenantId = (String) session.getAttribute("tenantId");
				branchCode = (String) session.getAttribute("branchCode");
				loginId = (String) session.getAttribute("loginId");
				logger.info("User " + loginId + " logging out.");
				session.invalidate(); 
				retVal =  OmniConstants.LOGIN;	  
			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			e.printStackTrace();
			errMsg = ErrorCodes.INVALIDLOGIN;
			retVal = OmniConstants.LOGIN;
		}finally{
			request.setAttribute("errMsg",  errMsg);
		}
		return retVal;
	}
	
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}
}
