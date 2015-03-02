package com.infrasofttech.omning.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.CustomerMst;
import com.infrasofttech.omning.services.CustomerService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CustomerCRUDAction extends ActionSupport implements  ServletRequestAware { 

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(CustomerCRUDAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	
	private String errMsg = "";
	
	CustomerMst customerMst;
	
	@SuppressWarnings("unchecked")
	public String execute() throws Exception {
		try{
			if (request.getSession(false) == null)
			{ 
				System.out.println("SESSION EXPIRED");
				//Session expired 
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;	
				session.invalidate(); 
				retVal =  OmniConstants.LOGIN;	  
			} else {
				tenantId = (String)request.getSession().getAttribute("tenantCode");
				
				String id = request.getParameter("id");//customer code
				CustomerService customerService = (CustomerService) SpringUtil.getSpringUtil().getService("customerService");
				String disable = request.getParameter("disable");
				
				if(id == null) {
					//create
					customerMst = new CustomerMst();
					request.setAttribute("customer", customerMst);
				}
				else {
					if(disable == null) {
						//edit mode
						customerMst = customerService.getCustomerMstByUniqueComposite(tenantId, id);//id = code
						request.setAttribute("customer", customerMst);
					}
					else {
						//disable mode
						customerMst = customerService.getCustomerMstByUniqueComposite(tenantId, id);//id = code
						customerMst.setIsActive(false);
						customerService.saveOrUpdate(customerMst);
						
					}
					
					
				}

				
				
				retVal = OmniConstants.SUCCESS;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			
		}
		return retVal;
	}
		
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public CustomerMst getCustomerMst() {
		return customerMst;
	}

	public void setCustomerMst(CustomerMst customerMst) {
		this.customerMst = customerMst;
	}

	
}
