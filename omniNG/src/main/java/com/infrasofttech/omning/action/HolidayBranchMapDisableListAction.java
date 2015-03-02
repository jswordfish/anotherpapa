package com.infrasofttech.omning.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.HolidayBranchMap;
import com.infrasofttech.omning.services.HolidayBranchMapService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class HolidayBranchMapDisableListAction extends ActionSupport implements
		ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(HolidayDisableListAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId = "";

	private String errMsg = "";

	List<HolidayBranchMap> holidayBranchMaps = new ArrayList<HolidayBranchMap>();

	@SuppressWarnings("unchecked")
	public String execute() throws Exception {
		try {
			if (request.getSession() == null) {
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
				HolidayBranchMapService holidayBranchMapService = (HolidayBranchMapService) SpringUtil
						.getSpringUtil().getService("holidayBranchMapService");
				holidayBranchMaps = holidayBranchMapService
						.findDisabled(tenantId);

				retVal = OmniConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return retVal;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public List<HolidayBranchMap> getHolidayBranchMaps() {
		return holidayBranchMaps;
	}

	public void setHolidayBranchMaps(List<HolidayBranchMap> holidayBranchMaps) {
		this.holidayBranchMaps = holidayBranchMaps;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

}
