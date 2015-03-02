package com.infrasofttech.omning.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.LookupCode;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.LookupCodeService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LookupCRUDAction extends ActionSupport implements
		ServletRequestAware {
	private static final long serialVersionUID = -5539422250920232971L;

	private static final Logger logger = Logger.getLogger(LookupCRUDAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	@SuppressWarnings("unused")
	private String branchCode="";
	@SuppressWarnings("unused")
	private String loginId="";
	private String languageCode="en";
	@SuppressWarnings("unused")
	private String errMsg = "";
	
	LookupCode lookupCode = new LookupCode();
	List<LookupCode> lookupCodeList;

	Map<String, String> lookUpCodes = new HashMap<String, String>();
	

	public String execute() throws Exception {
		try{
			if (request.getSession(false) == null)
			{ 
				System.out.println("LookupCRUDAction.execute() SESSION EXPIRED");
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
				String mode = request.getParameter("mode");
				
				request.setAttribute("mode", mode);
				
				LookupCodeService lookupCodeService = (LookupCodeService) SpringUtil.getSpringUtil().getService("lookupCodeService");
				lookupCodeList=lookupCodeService.getLookupCodeList(tenantId);
				
				//LookupCode entity = (LookupCode) lookupCodeService.getLookupCodeListOnId(tenantId, lookUpCode);
				
				for (LookupCode lookupCode : lookupCodeList) {
					lookUpCodes.put(lookupCode.getLookupCode(),
							lookupCode.getLookupCodeDesc());
					System.out.println("LookupCode :"
							+lookupCode.getLookupCode());
				}
				
				/*if(null==entity){
					lookupCode = new LookupCode();
				}else{	// UPDATE, DISABLE, ENABLE
					lookupCode = entity;
				}*/
				
				request.setAttribute("lookupCodes", lookUpCodes);
				request.setAttribute("lookupCode", lookupCode);

				retVal = OmniConstants.SUCCESS;
			}
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



}
