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
import com.infrasofttech.omning.orch.services.LoginService;
import com.infrasofttech.omning.services.UserBranchMapService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author mahesh.laddha
 *
 */
public class HomePageAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(HomePageAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
//	private String tenantId="";
//	private String branchCode="";
//	private String loginId="";
	
	private String errMsg = "";
	
	public String execute() throws Exception {
		try{
			if (request.getSession() == null)
			{ 
				System.out.println("RoleMenuMapAddSaveAction.execute() SESSION EXPIRED");
				//Session expired 
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;	
				session.invalidate(); 
				retVal =  OmniConstants.LOGIN;	  
			} else {
				session = request.getSession();
				String tenantId = (String) session.getAttribute("tenantCode");
				String branchCode = (String) session.getAttribute("branchCode");
				String loginId = (String) session.getAttribute("loginId");
				String languageCode = (String) session.getAttribute("languageCode");
				UserBranchMapService userBranchMapService = (UserBranchMapService) SpringUtil.getSpringUtil().getService("userBranchMapService");
				String roleCode = userBranchMapService.getRoleCode(tenantId, branchCode, loginId);
				LoginService obj =(LoginService) SpringUtil.getSpringUtil().getService("loginService");

				List<MenuMst> menuList = obj.getUserMenuList(tenantId, languageCode, roleCode);
				if(null==menuList || menuList.size()==0) {
					errMsg="No Menu are mapped to your role. Contact Administrator!";
					retVal = OmniConstants.LOGIN;
				}else {
					session.setAttribute("displayMenuz", menuList);
					errMsg="";
					retVal =  OmniConstants.SUCCESS;
				}
			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			request.setAttribute("errMsg", errMsg);
		}
		return retVal;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}
}
