package com.infrasofttech.omning.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.CustomerMst;
import com.infrasofttech.domain.entities.UserMst;
import com.infrasofttech.omning.services.CustomerService;
import com.infrasofttech.omning.services.UserMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ResetPasswordSaveAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(BranchListAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String branchCode="";
	private String loginId="";
	
	private String errMsg = "";

	UserMst user = new UserMst();
	
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
				tenantId = (String) session.getAttribute("tenantCode");
				branchCode = (String) session.getAttribute("branchCode");
				loginId = (String) session.getAttribute("loginId");
				
				String userLoginId = request.getParameter("resetUserLoginId");
				if(null != userLoginId){
					if(userLoginId.equalsIgnoreCase(loginId)){
						errMsg = "Cannot Reset Own Password";
						retVal = OmniConstants.INPUT;
					}else{
						// Action logic here...
						UserMstService userMstService = (UserMstService) SpringUtil.getSpringUtil().getService("userMstService");
						user = userMstService.resetUserPwd(tenantId, userLoginId);
						retVal = OmniConstants.SUCCESS;
					}
				}else{
					errMsg="Error in Input. Kindly revalidate!";
					retVal=OmniConstants.INPUT;
				}
			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			e.printStackTrace();
			errMsg = "Something wrong in operation, kindly verify the inputs or revisit later!";
			retVal=OmniConstants.INPUT;
		}finally{
			request.setAttribute("errMsg",  errMsg);
		}
		return retVal;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}
}
