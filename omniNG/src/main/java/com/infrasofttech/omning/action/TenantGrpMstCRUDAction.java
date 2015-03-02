package com.infrasofttech.omning.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.infrasofttech.domain.entities.TenantGrpMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.TenantGrpMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class TenantGrpMstCRUDAction extends ActionSupport implements
		ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(TenantGrpMstCRUDAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId = "";
	@SuppressWarnings("unused")
	private String branchCode = "";
	@SuppressWarnings("unused")
	private String loginId = "";
	private String languageCode = "en";
	@SuppressWarnings("unused")
	private String errMsg = "";

	TenantGrpMst tenantGrpMst = new TenantGrpMst();

	public String execute() throws Exception {
		try {
			if (request.getSession(false) == null) {
				System.out
						.println("TenantGrpMstCRUDAction.execute() SESSION EXPIRED");
				// Session expired
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;
				session.invalidate();
				retVal = OmniConstants.LOGIN;
			} else {
				session = request.getSession();
				tenantId = (String) session.getAttribute("tenantCode");
				branchCode = (String) session.getAttribute("branchCode");
				loginId = (String) session.getAttribute("loginId");
				String mode = request.getParameter("mode");
				String tenantGrpCode = request.getParameter("tenantGrpCode");

				request.setAttribute("mode", mode);

				tenantGrpMst = new TenantGrpMst();
				TenantGrpMstService tenantGrpMstService = (TenantGrpMstService) SpringUtil
						.getSpringUtil().getService("tenantGrpMstService");
				TenantGrpMst entity = tenantGrpMstService
						.getTenantGrpMstByUniqueComposite(tenantGrpCode);

				if (null == entity) {
					tenantGrpMst = new TenantGrpMst();
				} else { // UPDATE, DISABLE, ENABLE
					tenantGrpMst = entity;
				}

				request.setAttribute("tenantGrpMst", tenantGrpMst);

				retVal = OmniConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new OmniNGException();
		} finally {

		}
		return retVal;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

	public TenantGrpMst getTenantGrpMst() {
		return tenantGrpMst;
	}

	public void setTenantGrpMst(TenantGrpMst tenantGrpMst) {
		this.tenantGrpMst = tenantGrpMst;
	}

}
