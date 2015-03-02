package com.infrasofttech.omning.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.DeDupConfig;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.LookupValueService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DeDupConfigCRUDAction extends ActionSupport implements
		ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(DeDupConfigCRUDAction.class);
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

	DeDupConfig deDupConfig = new DeDupConfig();

	// Declare lookup MAPS...
	Map<String, String> deDup = new HashMap<String, String>();

	public String execute() throws Exception {
		try {
			if (request.getSession(false) == null) {
				System.out
						.println("DeDupConfigCRUDAction.execute() SESSION EXPIRED");
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

				request.setAttribute("mode", mode);

				setLookupValues();

				deDupConfig = new DeDupConfig();

				request.setAttribute("deDupConfig", deDupConfig);

				retVal = OmniConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new OmniNGException();

		} finally {

		}
		return retVal;
	}

	private void setLookupValues() {

		deDup = getLookupValues("DEDUP", languageCode, tenantId);

		request.setAttribute("deDup", deDup);
	}

	private Map<String, String> getLookupValues(String code,
			String languageCode, String tenantId) {
		Map<String, String> keyVal = new HashMap<String, String>();

		LookupValueService obj = (LookupValueService) SpringUtil
				.getSpringUtil().getService("lookupValueService");
		keyVal = obj.getLookupValues(code, languageCode, tenantId);

		return keyVal;
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

	public DeDupConfig getDeDupConfig() {
		return deDupConfig;
	}

	public void setDeDupConfig(DeDupConfig deDupConfig) {
		this.deDupConfig = deDupConfig;
	}

}
