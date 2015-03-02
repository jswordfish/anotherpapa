/**
 * 
 */
package com.infrasofttech.omning.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.HolidayMst;
import com.infrasofttech.omning.services.HolidayMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author mahesh.laddha
 * 
 */
public class HolidayEnableAction extends ActionSupport implements
		ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(HolidayDisableAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	@SuppressWarnings("unused")
	private String tenantId = "";
	@SuppressWarnings("unused")
	private String branchCode = "";
	@SuppressWarnings("unused")
	private String loginId = "";
	private String errMsg = "";
	private HolidayMst holidayMst = new HolidayMst();

	public String execute() throws Exception {
		try {
			if (request.getSession(false) == null) {
				System.out
						.println("HolidayDisableAction.execute() SESSION EXPIRED");
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
				String holidayCode = request.getParameter("holidayCode");
				String mode = request.getParameter("mode");
				HolidayMstService holidayMstService = (HolidayMstService) SpringUtil
						.getSpringUtil().getService("holidayMstService");
				holidayMst = holidayMstService.enableHoliday(tenantId,
						holidayCode);

				request.setAttribute("mode", mode);
				retVal = OmniConstants.SUCCESS;
			}
		} catch (Exception e) {

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

	public HolidayMst getHolidayMst() {
		return holidayMst;
	}

	public void setHolidayMst(HolidayMst holidayMst) {
		this.holidayMst = holidayMst;
	}

}
