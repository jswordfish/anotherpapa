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

import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * @author mahesh.laddha
 *
 */
public class LoginProcessAction extends ActionSupport implements ModelDriven<T>, ServletRequestAware {

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
				session = request.getSession(false);
				tenantId = (String) session.getAttribute("tenantId");
				branchCode = (String) session.getAttribute("branchCode");
				loginId = (String) session.getAttribute("loginId");

				vTokenSession = (String) session.getAttribute("vToken");
				vTokenReq = (String)request.getParameter("vToken");
				if(vTokenReq == null || vTokenSession == null){
					errMsg=ErrorCodes.SESSIONEXPIRE;
					session.invalidate();
					retVal = OmniConstants.LOGIN;
				}else{
					if(!vTokenReq.equals(vTokenSession)){ 
						// Both tokens are NOT matching. Logout!!!
						session.invalidate();
						errMsg = ErrorCodes.INVALIDLOGIN;
						retVal = OmniConstants.LOGIN;
					}else{
						//TODO Service reference here...
						// <T> obj =(<T>) SpringUtil.getSpringUtil().getService("...");
						
						// TODO Action logic here...
						
						
						
						
					} // END OF ELSE :: ACTION LOGIC
				} // END OF ELSE :: NOT NULL TOKEN
			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			
		}finally{
			
		}
		return retVal;
	}
	
	public T getModel() {
		// TODO Auto-generated method stub
		return null;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		
	}

	
}
