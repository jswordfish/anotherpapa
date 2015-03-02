package com.infrasofttech.omning.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.exceptions.OmniNGException;

import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CustomerSignPhotoMgmtAction extends ActionSupport implements /*ModelDriven<BranchMst>,*/ ServletRequestAware{
	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(CustomerSignPhotoMgmtAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String branchCode="";
	private String loginId="";
	private String languageCode="en";
	private String errMsg = "";
	private String buttonValue;
	public String execute() throws Exception {
		try{
			if (request.getSession(false) == null)
			{ 
				System.out.println("CustomerSignPhotoMgmtAction.execute() SESSION EXPIRED");
				//Session expired 
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;	
				session.invalidate(); 
				retVal =  OmniConstants.LOGIN;	  
			} else {
				session = request.getSession(false);
				tenantId = (String) session.getAttribute("tenantCode");
				branchCode = (String) session.getAttribute("branchCode");
				loginId = (String) session.getAttribute("loginId");
				retVal=OmniConstants.SUCCESS;
			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			e.printStackTrace();
			throw new OmniNGException();
		}finally{
			
		}
		return retVal;
	}
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
		
	}
	public String getButtonValue() {
		return buttonValue;
	}
	public void setButtonValue(String buttonValue) {
		this.buttonValue = buttonValue;
	}

}
