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

import com.infrasofttech.domain.entities.AppConfig;
import com.infrasofttech.domain.entities.RoleMst;
import com.infrasofttech.omning.services.AppConfigService;
import com.infrasofttech.omning.services.RoleMstService;
import com.infrasofttech.omning.utils.SpringUtil;
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
public class RoleDisableAction extends ActionSupport implements  ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(RoleDisableAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String branchCode="";
	private String loginId="";
	
	private String vTokenReq = "";
	private String vTokenSession = "";
	private String errMsg = "";
	private RoleMst roleMst = new RoleMst();
	public String execute() throws Exception {
		try{
			if (request.getSession(false) == null)
			{ 
				System.out.println("RoleDisableAction.execute() SESSION EXPIRED");
				//Session expired 
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;	
				session.invalidate(); 
				retVal =  OmniConstants.LOGIN;	  
			} else {
				System.out.println("RoleDisableAction.execute()");
				tenantId = (String)request.getSession().getAttribute("tenantCode");
				String loginId = (String)request.getAttribute("loginId");
			
				
				RoleMstService roleMstService = (RoleMstService) SpringUtil.getSpringUtil().getService("roleMstService");
				
				if(request.getParameter("roleCode") != null){
					try{
					String roleCode = request.getParameter("roleCode");
					roleMst = (RoleMst) roleMstService.getRoleMstByUniqueComposite(tenantId, roleCode);
					if(roleMst!=null){
						roleMst.setIsActive(false);
						roleMstService.saveOrUpdate(roleMst);
					}
					else{
						System.out.println("error while disbling Role");
					}
					}
					catch(NumberFormatException e){
						System.out.println("RoleDisableAction CATCH");
						e.printStackTrace();
					}
				}
				
				
				retVal = OmniConstants.SUCCESS;
			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			
		}finally{
			
		}
		return retVal;
	}
	
	
	public void setServletRequest(HttpServletRequest arg0) {}

	
}
