/**
 * 
 */
package com.infrasofttech.omning.action;

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

/**
 * @author mahesh.laddha
 * 
 */
public class HolidayBranchMapEnableAction extends ActionSupport implements
		ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(HolidayBranchMapEnableAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId = "";
	@SuppressWarnings("unused")
	private String branchCode = "";
	@SuppressWarnings("unused")
	private String loginId = "";
	private String errMsg = "";

	private HolidayBranchMap holidayBranchMap = new HolidayBranchMap();

	public String execute() throws Exception {
		try {
			if (request.getSession(false) == null) {
				System.out
						.println("HolidayBranchMapDisableAction.execute() SESSION EXPIRED");
				// Session expired
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;
				session.invalidate();
				retVal = OmniConstants.LOGIN;
			} else {

				session = request.getSession(false);
				tenantId = (String) session.getAttribute("tenantCode");
				branchCode = (String) session.getAttribute("branchCode");
				loginId = (String) session.getAttribute("loginId");
				String branchCode = request.getParameter("branchCode");
				String holidayDate = request.getParameter("holidayDate");
				String holidayCode = request.getParameter("holidayCode");
				String mode = request.getParameter("mode");
				HolidayBranchMapService holidayBranchMapService = (HolidayBranchMapService) SpringUtil
						.getSpringUtil().getService("holidayBranchMapService");
				holidayBranchMap = holidayBranchMapService
						.enableHolidayBranchMap(tenantId, branchCode, holidayDate, 
								holidayCode);

				request.setAttribute("mode", mode);
				retVal = OmniConstants.SUCCESS;

			}
		} catch (Exception e) {
			System.out.println("in catch block");
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

	public HolidayBranchMap getHolidayBranchMap() {
		return holidayBranchMap;
	}

	public void setHolidayBranchMap(HolidayBranchMap holidayBranchMap) {
		this.holidayBranchMap = holidayBranchMap;
	}

}
