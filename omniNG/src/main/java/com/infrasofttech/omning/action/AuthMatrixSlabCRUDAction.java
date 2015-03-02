package com.infrasofttech.omning.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.AuthEvent;
import com.infrasofttech.domain.entities.AuthMatrix;
import com.infrasofttech.domain.entities.AuthMatrixSlab;
import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.domain.entities.CurrencyMst;
import com.infrasofttech.domain.entities.RoleMst;
import com.infrasofttech.omning.services.AuthEventService;
import com.infrasofttech.omning.services.AuthMatrixService;
import com.infrasofttech.omning.services.AuthMatrixSlabService;
import com.infrasofttech.omning.services.BranchMstService;
import com.infrasofttech.omning.services.CurrencyMstService;
import com.infrasofttech.omning.services.RoleMstService;
import com.infrasofttech.omning.utils.ErrorCodes;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AuthMatrixSlabCRUDAction extends ActionSupport implements
		ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(AuthMatrixSlabCRUDAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId = "";
	private String errMsg = "";

	AuthMatrix authMatrix = new AuthMatrix();

	private List<BranchMst> branches1;
	private List<AuthEvent> authEvent1;
	private List<CurrencyMst> currencyMsts;
	private List<CurrencyMst> currency1;
	private List<RoleMst> roleMsts;
	private List<RoleMst> roleMsts1;
	private List<AuthMatrixSlab> authMatrixSlabs;
	private List<AuthMatrixSlab> authMatrixSlabs1;

	public Map<String, String> authEvents = new HashMap<String, String>();
	public Map<String, String> branches = new HashMap<String, String>();
	public Map<String, String> curencies = new HashMap<String, String>();

	@SuppressWarnings("unchecked")
	@Override
	public String execute() throws Exception {
		try {
			if (request.getSession(false) == null) {
				System.out
						.println("AuthMatrixSlabCRUDAction.execute() SESSION EXPIRED");
				// Session expired
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;
				session.invalidate();
				retVal = OmniConstants.LOGIN;
			} else {
				session = request.getSession();
				tenantId = (String) session.getAttribute("tenantId");
				String mode = request.getParameter("mode");
				String requestId = request.getParameter("id");
				Long id = Long.parseLong(requestId);
				request.setAttribute("mode", mode);

				roleMsts = new ArrayList<RoleMst>();
				RoleMstService roleMstService = (RoleMstService) SpringUtil
						.getSpringUtil().getService("roleMstService");
				roleMsts = roleMstService.findAllByTenant("tenantId");
				roleMsts1 = roleMsts;

				authMatrix = new AuthMatrix();
				AuthMatrixService authMatrixService = (AuthMatrixService) SpringUtil
						.getSpringUtil().getService("authMatrixService");
				AuthMatrix entity = authMatrixService
						.getAuthMatrixByUniqueComposite(id);

				authMatrixSlabs = new ArrayList<AuthMatrixSlab>();
				AuthMatrixSlabService authMatrixSlabService = (AuthMatrixSlabService) SpringUtil
						.getSpringUtil().getService("authMatrixSlabService");
				authMatrixSlabs = authMatrixSlabService
						.findAllByTenant("tenantId");

				authEvent1 = new ArrayList<AuthEvent>();
				AuthEventService authEventService = (AuthEventService) SpringUtil
						.getSpringUtil().getService("authEventService");
				authEvent1 = authEventService.findAllByTenant(tenantId);

				for (AuthEvent authEvent : authEvent1) {
					authEvents.put(authEvent.getAuthEventCode(),
							authEvent.getAuthEventName());
				}

				CurrencyMstService currencyMstService = (CurrencyMstService) SpringUtil
						.getSpringUtil().getService("currencyMstService");
				currency1 = currencyMstService.findAllByTenant("tenantId");
				authMatrixSlabs1 = authMatrixSlabs;
				for (CurrencyMst currencyMst : currency1) {
					curencies.put(currencyMst.getCurrencyISOCode(),
							currencyMst.getCurrencyName());
				}

				branches1 = new ArrayList<BranchMst>();
				BranchMstService branchMstService = (BranchMstService) SpringUtil
						.getSpringUtil().getService("branchMstService");
				branches1 = branchMstService.findAllByTenant(tenantId);

				for (BranchMst branchMst : branches1) {
					branches.put(branchMst.getBranchCode(),
							branchMst.getBranchName());
				}
				if (null == entity) {
					authMatrix = new AuthMatrix();
				} else { // UPDATE, DISABLE, ENABLE
					authMatrix = entity;
				}

				request.setAttribute("authMatrix", authMatrix);

				retVal = OmniConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return retVal;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;

	}

}
