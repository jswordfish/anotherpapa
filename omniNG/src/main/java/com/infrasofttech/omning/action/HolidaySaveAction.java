package com.infrasofttech.omning.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.HolidayMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.HolidayMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class HolidaySaveAction extends ActionSupport implements
		ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(HolidaySaveAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId = "";
	private String branchCode = "";
	private String loginId = "";
	private String languageCode = "";
	private String errMsg = "";
	private String mode = "";
	HolidayMst holiday = new HolidayMst();

	public String execute() throws Exception {
		try {
			if (request.getSession(false) == null) {
				System.out
						.println("HolidaySaveAction.execute() SESSION EXPIRED");
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
				languageCode = (String) session.getAttribute("languageCode");
				mode = (String) request.getParameter("mode");

				System.out.println("Saving in " + mode + " mode.");
				// Action logic here...
				holiday = (HolidayMst) request.getAttribute("holiday");

				holiday = setValuesToHolidayMst(holiday);
				holiday.setTenantId(tenantId);

				HolidayMstService holidayMstService = (HolidayMstService) SpringUtil
						.getSpringUtil().getService("holidayMstService");

				holidayMstService.saveOrUpdate(holiday);

				retVal = OmniConstants.SUCCESS;
			} // END OF ELSE :: SESSION NOT EXPIRE
		} catch (Exception e) {
			e.printStackTrace();
			retVal = OmniConstants.INPUT;
		} finally {

		}
		return retVal;
	}

	private HolidayMst setValuesToHolidayMst(HolidayMst holiday) {
		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			 
			if (!request.getParameter("holidayDate").isEmpty()
					&& request.getParameter("holidayDate") != null
					&& request.getParameter("holidayDate") != "") {
				try {
					  String fromDate = (String) request.getParameter("holidayDate");
					System.out.println("value of from date>>>>" + fromDate);
					Date date = new SimpleDateFormat("yyyy-MM-dd")
							.parse(fromDate);
					String fromdate1 = new SimpleDateFormat("yyyy-MM-dd")
							.format(date);
					holiday.setHolidayDate((Date) dateFormat
							.parse(fromdate1));
				} catch (Exception e) {
					System.out.println("error while parsing fromDate " + e);
					logger.error("error while parsing fromDate", e);
					e.printStackTrace();
				}
			}

			holiday.setHolidayCode(request.getParameter("holidayCode"));
			holiday.setHolidayDesc(request.getParameter("holidayDesc"));

			// DateFormat dateFormat = new
			// SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			Date createdDate = cal.getTime();
			Date lastModifiedDate = cal.getTime();
			if (mode.equalsIgnoreCase("CREATE")) {
				holiday.setCreatedDate(createdDate);
				holiday.setCreatedBy(loginId);
			} else {
				holiday.setLastModifiedDate(lastModifiedDate);
				holiday.setLastModifiedBy(loginId);
			}
			holiday.setAuthStatus(OmniConstants.AUTH_AUTHORIZED);
			return holiday;
		} catch (OmniNGException e) {
			e.printStackTrace();
			errMsg = e.getMessage();
			retVal = OmniConstants.INPUT;
		}
		return holiday;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public HolidayMst getHoliday() {
		return holiday;
	}

	public void setHoliday(HolidayMst holiday) {
		this.holiday = holiday;
	}

}
