package com.infrasofttech.omning.action;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.CustomerParameter;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.CustomerParameterService;
import com.infrasofttech.omning.utils.ErrorCodes;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CustParamSaveAction extends ActionSupport implements ServletRequestAware {
	
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
				CustomerParameterService customerParameterService = (CustomerParameterService) SpringUtil
						.getSpringUtil().getService("customerParameterService");
				CustomerParameter entity = customerParameterService.getCustomerParameter(tenantId, customerCode);
				
				if (null == entity) { // Create
					customerParameter = new CustomerParameter();
					customerParameter.setCreatedBy(loginId);
					Calendar cal = Calendar.getInstance();
					Date createdDate = cal.getTime();
					customerParameter.setCreatedDate(createdDate);
				} else { // UPDATE
					customerParameter = entity;
					customerParameter.setLastModifiedBy(loginId);
					Calendar cal = Calendar.getInstance();
					Date modifiedDate = cal.getTime();
					customerParameter.setLastModifiedDate(modifiedDate);
				}
				//--> Save values from JSP
				customerParameter.setAdjustmentAccount(request.getParameter("adjustmentAccount"));
				customerParameter.setAuthStatus(request.getParameter(OmniConstants.AUTH_AUTHORIZED));
				customerParameter.setCreditAccount(request.getParameter("creditAccount"));
				customerParameter.setCutomerCode(request.getParameter("cutomerCode"));
				customerParameter.setDueDateMonthforTL(request.getParameter("dueDateMonthforTL"));
				customerParameter.setInstrumentAccount(request.getParameter("instrumentAccount"));
				customerParameter.setPenalInterestRate(Double.parseDouble((String)request.getParameter("penalInterestRate")));
				customerParameter.setPostponedAdjustmentTenorYears(Integer.parseInt((String)request.getParameter("postponedAdjustmentTenorYears")));
				customerParameter.setShareCapitalAccount(request.getParameter("shareCapitalAccount"));
				customerParameter.setShareSuspenseAccount(request.getParameter("shareSuspenseAccount"));
				customerParameter.setTenantId(tenantId);
				customerParameter.setYearNumberForHundi(Integer.parseInt((String)request.getParameter("yearNumberForHundi")));
				
				customerParameter = customerParameterService.saveOrUpdate(customerParameter);
				
				request.setAttribute("customerParameter", customerParameter);
				
				if(null==customerParameter) {
					errMsg="Error in Saving!!!";
					retVal = OmniConstants.INPUT;
				}else {
					errMsg="";
					retVal = OmniConstants.SUCCESS;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			errMsg="Error in Saving!!!";
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
