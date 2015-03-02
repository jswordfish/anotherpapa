package com.infrasofttech.omning.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.CustomerParameter;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CustParamPgDisplayAction extends ActionSupport implements ServletRequestAware {
	
	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(CustParamSaveAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext
		.getContext().get(ServletActionContext.HTTP_REQUEST);
	
	private String retVal = OmniConstants.LOGIN;
	private String tenantId = "";
	private String loginId = "";
	private String branchCode = "";
	private String languageCode = "";
	private String errMsg = "";
	
	CustomerParameter customerParameter = new CustomerParameter();
	
	@SuppressWarnings("unchecked")
	public String execute() throws Exception {
	
		try {
			if (request.getSession(false) == null) {
				System.out
						.println("AuthMatrixCRUDAction.execute() SESSION EXPIRED");
				// Session expired
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;
				session.invalidate();
				retVal = OmniConstants.LOGIN;
			} else {
				session = request.getSession();
				tenantId = (String) session.getAttribute("tenantId");
				loginId = (String) session.getAttribute("loginId");
				branchCode = (String) session.getAttribute("branchCode");
				languageCode = (String) session.getAttribute("languageCode");
				String mode = request.getParameter("mode");

				String customerCode = "";
				customerCode = (String)request.getParameter("customerCode");
				request.setAttribute("mode", mode);

				customerParameter = new CustomerParameter();
				
				request.setAttribute("customerParameter", customerParameter);
				retVal = OmniConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
			errMsg="Error in Displaying the Customer Parameter Page!!!";
			logger.error(errMsg + "\n" + e.getMessage() + "\n" + e.getStackTrace().toString());
			throw new OmniNGException();
		} finally {
			request.setAttribute("errMsg", errMsg);
		}

		return retVal;
	}
	
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}
	
}
