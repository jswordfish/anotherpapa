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

import com.infrasofttech.omning.services.LookupValueService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LookupListAction extends ActionSupport implements
		ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(LookupListAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId = "";
	private String languageCode = "en";

	private String errMsg = "";
	Map<String, String> lookupValuesMap = new HashMap<String, String>();
	// List<LookupValue> lookupValues = new ArrayList<LookupValue>();
	String lookupCode = request.getParameter("lookupCode");

	@SuppressWarnings("unchecked")
	public String execute() throws Exception {
		System.out.println("inside lookupCode...................");
		System.out.println("LookUpCode:" + lookupCode);
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

				// Action logic here...
				LookupValueService lookupValueService = (LookupValueService) SpringUtil
						.getSpringUtil().getService("lookupValueService");
				lookupValuesMap = lookupValueService.getLookupValues(
						lookupCode, languageCode, tenantId);
				System.out.println("Before Loop.....");
				for (Map.Entry<String, String> entry : lookupValuesMap
						.entrySet()) {
					System.out.println("Key: " + entry.getKey());
					System.out.println("Value: " + entry.getValue());

				}
				request.setAttribute("lookupValue", lookupValuesMap);
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

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public Map<String, String> getLookupValuesMap() {
		return lookupValuesMap;
	}

	public void setLookupValuesMap(Map<String, String> lookupValuesMap) {
		this.lookupValuesMap = lookupValuesMap;
	}

}
