package com.infrasofttech.omning.action;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.CustomerContact;
import com.infrasofttech.domain.entities.CustomerMst;
import com.infrasofttech.omning.services.CustomerService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CustomerKYCAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(BranchListAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String branchCode="";
	private String loginId="";
	
	private String vTokenReq = "";
	private String vTokenSession = "";
	private String errMsg = "";
	
	
	
	public String execute() throws Exception {
		try{
			if (request.getSession(false) == null)
			{ 
				System.out.println("RoleMenuMapAddSaveAction.execute() SESSION EXPIRED");
				//Session expired 
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;	
				session.invalidate(); 
				retVal =  OmniConstants.LOGIN;	  
			} else {
				session = request.getSession();
				tenantId = (String) session.getAttribute("tenantCode");
				branchCode = (String) session.getAttribute("branchCode");
				loginId = (String) session.getAttribute("loginId");
				//Save customer first screen
				
				String mode = request.getParameter("mode");
				if(mode == null) {
					retVal = OmniConstants.LOGIN;
					return retVal;
				}
				CustomerService customerService = (CustomerService) SpringUtil.getSpringUtil().getService("customerService");
				CustomerMst customer = null;
				
				if(mode.equalsIgnoreCase("CREATE")) {
					customer = saveOrUpdateCustomer(request, null);
				}
				else if(mode.equalsIgnoreCase("UPDATE")) {
					customer = (CustomerMst) request.getAttribute("customer");
				}
				else if(mode.equalsIgnoreCase("DISABLE")) {
					String id = request.getParameter("id");
					if(id != null) {
						CustomerMst customerMst = (CustomerMst) customerService.find(new Long(id));
						customerMst.setIsActive(false);
						customerMst = customerService.saveOrUpdate(customerMst);
					}
					//return
				}
				else {
					retVal = OmniConstants.LOGIN;
					return retVal;
				}
				
				
				
				
				request.setAttribute("customer", customer);
				request.setAttribute("customerKYCDocs", customer.getCustomerKYCDocs());
				
						
				retVal = OmniConstants.SUCCESS;

			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			
		}
		
		return retVal;
	}
	
	private CustomerMst saveOrUpdateCustomer(HttpServletRequest request, CustomerMst customerMst) throws NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, InstantiationException, ParseException {
		if(customerMst == null) {
			customerMst = new CustomerMst();
		}
		
		Enumeration<String> params = request.getParameterNames();
		while(params.hasMoreElements()) {
			String param = params.nextElement();
			String value = request.getParameter("param");
			if(param.contains("customer.noOfChildren")) {
				if(value != null) {
					customerMst.setNoOfChildren(new Integer(value));
				}
				
			}
			else if(param.contains("customer.customerAmtLimit")) {
				if(value != null) {
					customerMst.setCustomerAmtLimit(new Double(value));
				}
			}
			else if(param.contains("dob")) {
				if(value != null) {
					Date date = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH).parse(value);
					customerMst.setCustomerDOB(date);
				}
				
			}
			else if(param.contains("customerSince")) {
				if(value != null) {
					Date date = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH).parse(value);
					customerMst.setCustomerSince(date);
				}
			}
			else if(param.contains("customer.") && !(param.contains("customer.CustomerContact."))) {
				String var = param.substring(("customer.".length() - 1), param.length());
				Method method = CustomerMst.class.getMethod("set"+var, String.class);
				method.invoke(customerMst, value);
			}
			else if(param.contains("customer.CustomerContact.")) {
				CustomerContact customerContact = null;//customerMst.getCustomerContact();
				String var = param.substring(("customer.CustomerContact.".length() - 1), param.length());
				Method method = CustomerContact.class.getMethod("set"+var, String.class);
				method.invoke(customerMst, value);
			}
			
		}
		return customerMst;
	}
	

	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		request = arg0;
	}

	
}
