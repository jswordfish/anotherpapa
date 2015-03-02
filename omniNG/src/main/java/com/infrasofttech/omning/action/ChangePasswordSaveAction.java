package com.infrasofttech.omning.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;


import com.infrasofttech.domain.entities.UserMst;

import com.infrasofttech.omning.services.UserMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ChangePasswordSaveAction extends ActionSupport implements ServletRequestAware {

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
				String hashedSaltPwd = (String) session.getAttribute("hashedSaltPwd");
				session.setAttribute("hashedSaltPwd", null);
				System.out.println("salt:::::::::"+hashedSaltPwd);
				System.out.println("AddChangePasswordSaveAction.execute()");

				/**************** next password date *********/
				/*DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd ");
				Date date = new Date();
				System.out.println("date :" + dateFormat.format(date));
				Date dateAftr45Days = DateUtils.addDays(date, 45);
				String tempDate = dateFormat.format(dateAftr45Days);
				nextPwdChgOn = dateFormat.parse(tempDate);
				System.out.println("nextPwdChgOn :" + nextPwdChgOn);*/

				
				// Action logic here...
				UserMstService userMstService = (UserMstService) SpringUtil.getSpringUtil().getService("userMstService");
				String oldPwdWithSalt = (String)request.getParameter("oldPwd");
				System.out.println("pwassword with salt"+oldPwdWithSalt);
				String newPwdWithSalt = (String)request.getParameter("newPwd");
				String verifyPwdWithSalt = (String)request.getParameter("verifyPwd");
				String o1[] = oldPwdWithSalt.split(hashedSaltPwd);
				String n1[]= newPwdWithSalt.split(hashedSaltPwd);
				String v1[]= verifyPwdWithSalt.split(hashedSaltPwd);
				
				String newPwd=n1[0];
				String oldPwd = o1[0];
				String verifyPwd=v1[0];
				
				System.out.println("pasword without salt "+oldPwd);
				
				if(null != newPwd && null != verifyPwd && null != oldPwd &&	newPwd.length() >= 8 ){
					if(newPwd.equals(verifyPwd)){
							user = userMstService.changePwd(tenantId, loginId, oldPwd, newPwd);
							errMsg="";
							retVal=OmniConstants.SUCCESS;
					}else{
						errMsg = "New and Verify passwords do not match, kindly verify the inputs!";
						retVal = OmniConstants.INPUT;
					}
				}else{
					errMsg = "Inputs cannot be blank or less than 8 characters, kindly verify the inputs!";
					retVal = OmniConstants.INPUT;
				}
			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			e.printStackTrace();
			errMsg = "Kindly verify the inputs!\n" + e;
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
