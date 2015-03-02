/**
 * 
 */
package com.infrasofttech.omning.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.AppConfig;
import com.infrasofttech.omning.services.AppConfigService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


public class AppConfigDisableAction extends ActionSupport implements  ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(AppConfigDisableAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String branchCode="";
	private String loginId="";
	private String languageCode="";
	private String errMsg = "";
	private AppConfig appConfig = new AppConfig();
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
				System.out.println("AppConfigDisableAction.execute()");
				tenantId = (String)request.getSession().getAttribute("tenantCode");
				String loginId = (String)request.getAttribute("loginId");
			
				
				AppConfigService appConfigService = (AppConfigService) SpringUtil.getSpringUtil().getService("appConfigService");
				
				if(request.getParameter("branchCode") != null){
					try{
					String branchCd = request.getParameter("branchCode");
					appConfig = (AppConfig) appConfigService.getAppConfigByUniqueComposite(tenantId, branchCd);
					if(appConfig!=null){
						appConfig.setIsActive(false);
						appConfigService.saveOrUpdate(appConfig);
					}
					else{
						System.out.println("error while disbling appConfig");
					}
					}
					catch(NumberFormatException e){
						System.out.println("AppConfigDisableAction CATCH");
						e.printStackTrace();
					}
				}
				//request.setAttribute("appConfig", appConfig);
				
				retVal = OmniConstants.SUCCESS;
			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			e.printStackTrace();
			errMsg = "Error in operation!";
			retVal = OmniConstants.INPUT;
		}finally{
			request.setAttribute("errMsg",  errMsg);
		}
		return retVal;
	}


	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		
	}


	public AppConfig getAppConfig() {
		return appConfig;
	}


	public void setAppConfig(AppConfig appConfig) {
		this.appConfig = appConfig;
	}

	
}
