/**
 * 
 */
package com.infrasofttech.omning.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.GLMst;
import com.infrasofttech.domain.entities.RoleMenuActionAccess;
import com.infrasofttech.omning.services.GLMstService;
import com.infrasofttech.omning.services.RoleMenuActionAccessService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class GLMstListAction extends ActionSupport implements  ServletRequestAware { 

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(GLMstListAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String roleCode="";
	private String menuCode="";
	private String loginId="";
	private String branchCode="";
	private String languageCode="";
	
	private String errMsg = "";
	
	List<GLMst> glList = new ArrayList<GLMst>();
	
	
	@SuppressWarnings("unchecked")
	public String execute() throws Exception {
		System.out.println("In EXEcute");
		try {
			if (request.getSession() == null) {
				System.out.println("SESSION EXPIRED");
				// Session expired
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;
				session.invalidate();
				retVal = OmniConstants.LOGIN;
			} else {
				
				System.out.println("IN else");
				tenantId = (String) request.getSession().getAttribute(
						"tenantCode");

				roleCode = (String) request.getSession().getAttribute(
						"roleCode");
				// Action logic here...
				RoleMenuActionAccessService roleMenuActionAccessService = (RoleMenuActionAccessService) SpringUtil
						.getSpringUtil().getService(
								"roleMenuActionAccessService");
				System.out.println("tenanat"+tenantId);
				if(null==tenantId){
					tenantId="001";
					System.out.println("tenanatis null"+tenantId);
				}
				GLMstService glMstService = (GLMstService) SpringUtil
						.getSpringUtil().getService("glMstService");
				glList = glMstService.findAllByTenant(tenantId);
				request.setAttribute("glList",glList);
				if (null != request.getParameter("menuCode") ) {
					menuCode = request.getParameter("menuCode");
					request.setAttribute("menuCode", menuCode);
					RoleMenuActionAccess roleMenuActionAccess = roleMenuActionAccessService
							.getRoleMenuActionAccess(tenantId, roleCode,
									menuCode);
					if (null != roleMenuActionAccess) {
						request.setAttribute("roleMenuActionAccess",
								roleMenuActionAccess);
						request.getSession(false).setAttribute("roleMenuActionAccess",
								roleMenuActionAccess);
					}
				}

				retVal = OmniConstants.SUCCESS;
			}
		} catch (Exception e) {
		System.out.println("in Catch!!!!!!!!1");
			e.printStackTrace();
		} finally {

		}
		return retVal;
	}
		
	
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

	
	
}
