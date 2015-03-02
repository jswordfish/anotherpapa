/**
 * 
 */
package com.infrasofttech.omning.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.MenuMst;
import com.infrasofttech.domain.entities.RoleMenuActionAccess;
import com.infrasofttech.domain.entities.RoleMst;
import com.infrasofttech.omning.services.MenuMstService;
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
public class RoleMenuAddAction extends ActionSupport implements ModelDriven<RoleMenuActionAccess>, ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(RoleMenuAddAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String branchCode="";
	private String loginId="";
	
	private String errMsg = "";
	
	RoleMenuActionAccess roleMenuActionAccess = new RoleMenuActionAccess();
	
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

				//retrieve menu list to display
				//List<MenuMst> menuz = new ArrayList<MenuMst>();  //TODO retrieve from menu service
				
				MenuMstService menuService = (MenuMstService) SpringUtil.getSpringUtil().getService("menuMstService");
				tenantId = (String) request.getSession().getAttribute("tenantCode");
				List<MenuMst> menus = menuService.findAllByTenant(tenantId);
				
				RoleMst roleMst = (RoleMst) request.getSession().getAttribute("role");
				request.setAttribute("role", roleMst);
				
				request.setAttribute("menus",menus);
						
				retVal = OmniConstants.SUCCESS;		
						
			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			
		}finally{
			
		}
		return retVal;
	}
	
	public RoleMenuActionAccess getModel() {
		return roleMenuActionAccess;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		request = arg0;
	}

	
}
