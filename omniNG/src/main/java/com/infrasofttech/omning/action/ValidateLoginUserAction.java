package com.infrasofttech.omning.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.beans.LoginBean;
import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.domain.entities.UserBranchMap;
import com.infrasofttech.domain.entities.UserMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.orch.services.LoginService;
import com.infrasofttech.omning.services.BranchMstService;
import com.infrasofttech.omning.services.UserMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ValidateLoginUserAction extends ActionSupport implements ServletRequestAware, ModelDriven<LoginBean> {

	private static final long serialVersionUID = 1L;
	// Input parameters from login.JSP
	private String tenantGrpCode="";
	private String tenantCode="";
	private String languageCode="";
	private String branchCode="";

	private String loginId="";
	private String errMsg = "";
	// Output parameters to LoginPwd.JSP
	private String userName;
	private String branchName;
	private int jspErr = 0;
	private UserMst userMst;
	private BranchMst branchMst;
	
	// private String mlvToken = "";
	private LoginBean loginBean = new LoginBean();

	private String retVal=OmniConstants.LOGIN;
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	private static final Logger logger = Logger.getLogger(ValidateLoginUserAction.class);

	@SuppressWarnings("unused")
	@Override
	public String execute() throws OmniNGException, ClassNotFoundException {

		LoginService loginService = (LoginService) SpringUtil.getSpringUtil().getService("loginService");
		UserMstService userMstService = (UserMstService) SpringUtil.getSpringUtil().getService("userMstService");
		BranchMstService branchMstService =  (BranchMstService) SpringUtil.getSpringUtil().getService("branchMstService");
		
		try{
			if (request.getSession(false) == null)
			{ 
				//Session expired 
				System.out.println("Session Expired");
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;	
				retVal =  OmniConstants.LOGIN;	
				
			} else {  // Session is NOT expired
				
				Class.forName("com.mysql.jdbc.Driver");
				
				tenantGrpCode = (String) request.getSession().getAttribute("tenantGrpCode");
				tenantCode = (String) request.getSession().getAttribute("tenantCode");
				languageCode = (String)request.getParameter("languageCode");
				branchCode = (String)request.getParameter("branchCode");
				loginId = (String)request.getParameter("loginId");
	
				if(null==tenantCode || tenantCode.trim().length()==0 || 
				   null==languageCode || languageCode.trim().length()==0 ||
				   null==branchCode || branchCode.trim().length()==0 || 
				   null==loginId || loginId.trim().length()==0) {
					
					errMsg="Input value is missing. All values are mandatory!";
					retVal = OmniConstants.LOGIN;
					return retVal;
				}
				
				System.out.println("tenantCode, languageCode, branchCode, loginId::" + 
						tenantCode+", "+languageCode+", "+branchCode+", "+loginId);

				session = request.getSession(true);
				session.setAttribute("tenantCode", tenantCode);
				session.setAttribute("tenantGrpCode", tenantGrpCode);
				session.setAttribute("branchCode", branchCode);
				session.setAttribute("loginId", loginId);

				if (null == languageCode ||  languageCode.trim() == "") {  // Double check for language!!!
					languageCode = "en";
				}
				session.setAttribute("languageCode", languageCode);

				branchMst = (BranchMst)branchMstService.getBranchMst(tenantCode, branchCode);

				// fetch rolecode based on loginId
				userMst = userMstService.getUserBasedOnLogin(tenantCode, loginId);
				String roleCode = userMst.getRoleCode();
				System.out.println("Role Code for user: "+loginId+" is: "+ roleCode);
	
				// Verify User Branch Mapping
				if(roleCode.equalsIgnoreCase("INFRAADMIN")) {
					/**
					 * Don't do verification of Branch Mapping, since user in the role 
					 * of INFRAADMIN can login based on any branch selected on the login page
					 */
				} else { // For user's with other roles verify their mapping exists with the branch
					UserBranchMap userBranchMap = loginService.getUserBranchMap(tenantCode, branchCode, loginId);
					if(null == userBranchMap) {	// User and Branch Mapping does not exists !!!
						
						errMsg = "User is not mapped to the branch";
						retVal = OmniConstants.LOGIN;
						return retVal;
					}
				}
			
				// Fetch all user details and branch details based on loginId and branchCode
				Boolean allowConcurrentLogin = userMst.getAllowConcurrentLogin();
				Boolean isUserLocked = userMst.getIsUserLocked();
				Boolean isUserLoggedIn = userMst.getIsUserLoggedin();
				
				// If user is locked go back or move ahead...
				if (isUserLocked == false) { // User is NOT locked
					isUserLoggedIn = userMst.getIsUserLoggedin();
				
					if(!isUserLoggedIn) { // User is NOT logged in OR has no active concurrent session
	
						fetchUserDetailsInSession(userMst, branchMst);
						retVal = OmniConstants.SUCCESS;
						
					} else {  // User has an active concurrent session
						if (allowConcurrentLogin != false) {    // User CAN login concurrently
							
							fetchUserDetailsInSession(userMst, branchMst);
							retVal = OmniConstants.SUCCESS;
							
						} else {  // User CANNOT login concurrently
							System.out.println("Concurrent Logins NOT Allowed!");
							errMsg = ErrorCodes.USERCONCURRENTLOGIN;
							logger.warn(errMsg);
							retVal = OmniConstants.LOGIN;
						}
					}
				} else { // User is Locked
					errMsg = "User " + loginId + " is Locked. Contact Administrator!";
					logger.info(errMsg);
					retVal = OmniConstants.LOGIN;
					return retVal;
				}
			}  // Session is NOT Expired
		}catch(Exception e) {
			e.printStackTrace();
			retVal = OmniConstants.LOGIN;
		}finally {
			
		}
		return retVal;
	} // END OF ACTION EXECUTE
	
	private void fetchUserDetailsInSession(UserMst userMst, BranchMst branchMst){
		String hPwd="";
		String hPwdSalt="";
		String userDisplayName="";
		String branchName="";
		
		hPwd = userMst.getPwd();
		hPwdSalt = userMst.getPwdSalt();
		branchName = branchMst.getBranchName();
		
		if (null != userMst.getUserDisplayName() && userMst.getUserDisplayName().trim().length() > 0 ) {
			userDisplayName = userMst.getUserDisplayName();
		} else if(null != userMst.getUserFName() && userMst.getUserFName().trim().length() > 0) {
			userDisplayName = userMst.getUserFName();
		} else {
			userDisplayName = loginId;
		}
	
		//Set the values in Session/Request Attributes
		
		request.getSession().setAttribute("userDisplayName", userDisplayName);
		request.getSession().setAttribute("branchName", branchName);
		
		request.setAttribute("hPwd", hPwd);
		request.setAttribute("hPwdSalt", hPwdSalt);
	}			
	
	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public LoginBean getModel() {
		return loginBean;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}

	public LoginBean getLoginBean() {
		return loginBean;
	}

	public void setLoginBean(LoginBean loginBean) {
		this.loginBean = loginBean;
	}
}
