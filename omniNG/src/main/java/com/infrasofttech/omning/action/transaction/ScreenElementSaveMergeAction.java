package com.infrasofttech.omning.action.transaction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.transaction.ScreenDataType;
import com.infrasofttech.domain.entities.transaction.ScreenElement;
import com.infrasofttech.domain.entities.transaction.ScreenUIType;
import com.infrasofttech.omning.transaction.services.ScreenElementService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ScreenElementSaveMergeAction extends ActionSupport implements  ServletRequestAware { 

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(TxnClientConfigCRUDAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String languageCode="";
	private String branchCode="";
	private String loginId="";
	
	private String errMsg = "";
	
	Map<String, String> branches = new HashMap<String, String>();
	Map<String, String> modules = new HashMap<String, String>();
	Map<String, String> products = new HashMap<String, String>();
	Map<String, String> activities = new HashMap<String, String>();
	
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
				branchCode = (String)request.getSession().getAttribute("branchCode");
				languageCode = (String)request.getSession().getAttribute("languageCode");
				loginId = (String)request.getSession().getAttribute("loginID");
			
				//Screen screenMapperService = (ScreenMapperService) SpringUtil.getSpringUtil().getService("screenMapperService");
				String id = request.getParameter("id");
				
				
				ScreenElementService screenElementService = (ScreenElementService) SpringUtil.getSpringUtil().getService("screenElementService");
				
				String name = request.getParameter("name");
				String displayName = request.getParameter("displayName");
				
				String lookupCode = request.getParameter("lookupCode");
				String dataType = request.getParameter("dataType");
				String uiType = request.getParameter("uiType");
				ScreenElement screenElement = (ScreenElement) request.getSession().getAttribute("screenElement");
				screenElement.setName(name);
				screenElement.setTenantId(tenantId);
				screenElement.setLookupCode(lookupCode);
				screenElement.setDisplayName(displayName);
				screenElement.setScreenDataType(ScreenDataType.getScreenDataType(dataType));
				
				screenElement.setScreenUIType(ScreenUIType.getScreenUIType(uiType));
				screenElementService.saveOrUpdate(screenElement);
				
				List<ScreenElement> elements = screenElementService.findAllByTenant(tenantId);
				request.setAttribute("screenElements", elements);
				
				
				retVal = OmniConstants.SUCCESS;
			}
		}catch(Exception e){
			logger.error("can not save screen mapper", e);
			e.printStackTrace();
			retVal = OmniConstants.FAILURE;
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
}
