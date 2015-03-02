package com.infrasofttech.omning.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;




import com.infrasofttech.domain.entities.CropTypeParam;
import com.infrasofttech.domain.entities.RoleMenuActionAccess;
import com.infrasofttech.omning.services.CropTypeParamService;
import com.infrasofttech.omning.services.RoleMenuActionAccessService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.utils.ErrorCodes;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CropTypeParamListAction extends ActionSupport implements
		ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(CropTypeParamListAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId = "";
	private String roleCode = "";
	private String menuCode = "";

	private String errMsg = "";

	List<CropTypeParam> cropTypes = new ArrayList<CropTypeParam>();

	@SuppressWarnings("unchecked")
	public String execute() throws Exception {
		try {
			if (request.getSession(false) == null) {
				System.out.println("SESSION EXPIRED");
				// Session expired
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;
				session.invalidate();
				retVal = OmniConstants.LOGIN;
			} else {
				tenantId = (String) request.getSession().getAttribute(
						"tenantCode");		
				roleCode = (String) request.getSession().getAttribute(
						"roleCode");
				
				CropTypeParamService cropTypeParamService = (CropTypeParamService) SpringUtil
						.getSpringUtil().getService("cropTypeParamService");				
				cropTypes = cropTypeParamService.findAllByTenant(tenantId);
				request.setAttribute("cropTypes", cropTypes);
				
				
				/***********RoleBased Access Rights************/
				
				RoleMenuActionAccessService roleMenuActionAccessService = (RoleMenuActionAccessService) SpringUtil
						.getSpringUtil().getService("roleMenuActionAccessService");				
				if (null != request.getParameter("menuCode") ) {
					menuCode = request.getParameter("menuCode");
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
				/***********RoleBased Access Rights************/
				
				retVal = OmniConstants.SUCCESS;
			}
		} catch (Exception e) {
		System.out.println("::::"+e.getMessage());
			e.printStackTrace();
		} finally {

		}
		return retVal;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public String getMenuCode() {
		return menuCode;
	}

	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}

	

}
