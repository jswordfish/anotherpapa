/**
 * 
 */
package com.infrasofttech.omning.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.poi.ss.formula.functions.T;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.UserMst;
import com.infrasofttech.omning.services.UserMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * @author mahesh.laddha
 *
 */
public class UserEnableAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(UserEnableAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.INPUT;
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
				System.out.println("userdisable.execute() SESSION EXPIRED");
				//Session expired 
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;	
				session.invalidate(); 
				retVal =  OmniConstants.LOGIN;	  
			} else {
				session = request.getSession();
				tenantId = (String) session.getAttribute("tenantCode");
				branchCode = (String) session.getAttribute("branchCode");
						// TODO Action logic here...
						UserMstService userMstService = (UserMstService) SpringUtil.getSpringUtil().getService("userMstService");
						String loginId = request.getParameter("loginId");
						System.out.println("loginid"+loginId);
						UserMst userMst =userMstService.enableUser(tenantId, loginId);
						if(null!=userMst){
							retVal= OmniConstants.SUCCESS;	
						}
						
						
						
					} // END OF ELSE :: ACTION LOGIC
				
			
			
		}catch(Exception e){
			
			e.printStackTrace();
		}finally{
			
		}
		return retVal;
	}
	
	
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

	
}
