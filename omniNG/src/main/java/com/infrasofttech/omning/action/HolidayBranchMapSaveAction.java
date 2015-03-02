package com.infrasofttech.omning.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.HolidayBranchMap;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.HolidayBranchMapService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class HolidayBranchMapSaveAction extends ActionSupport implements
		ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(HolidayBranchMapSaveAction.class);
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
	private HolidayBranchMap holidayBranchMap = new HolidayBranchMap();
	private List<HolidayBranchMap> holidayBranchMaps = new ArrayList<HolidayBranchMap>();

	public String execute() throws Exception {
		try {
			if (request.getSession(false) == null) {
				System.out
						.println("HolidayBranchMapSaveAction.execute() SESSION EXPIRED");
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
				holidayBranchMap = (HolidayBranchMap) request
						.getAttribute("holidayBranchMap");

				holidayBranchMap = setValuesToHolidayBranchMap(holidayBranchMap);
				Long setNo = (long) (Math.random() * 10000000);
				System.out.println("setNo random" + setNo);
				holidayBranchMap.setSetNo(setNo);
				holidayBranchMap.setTenantId(tenantId);

				HolidayBranchMapService holidayBranchMapService = (HolidayBranchMapService) SpringUtil
						.getSpringUtil().getService("holidayBranchMapService");
				String[] branches = request.getParameterValues("branchCode");
				String[] holidayCodes = request
						.getParameterValues("holidayCode");
				String[] holidayDates = request
						.getParameterValues("holidayDate");

				for (int i = 0; i < branches.length; i++) {
					for (int j = 0; j < holidayCodes.length; j++) {

						System.out.println(branches[i] + "branches[i]");

						holidayBranchMap.setBranchCode(branches[i]);
						holidayBranchMap.setHolidayCode(holidayCodes[j]);
						holidayBranchMap.setHolidayDate(holidayDates[j]);

						holidayBranchMapService.saveOrUpdate(holidayBranchMap);
					}

				}

				retVal = OmniConstants.SUCCESS;
			} // END OF ELSE :: SESSION NOT EXPIRE
		} catch (Exception e) {
			e.printStackTrace();
			retVal = OmniConstants.INPUT;
		} finally {

		}
		return retVal;
	}

	private HolidayBranchMap setValuesToHolidayBranchMap(
			HolidayBranchMap holidayBranchMap) {
		try {

			holidayBranchMap
					.setHolidayCode(request.getParameter("holidayCode"));
			holidayBranchMap.setBranchCode(request.getParameter("branchCode"));

			Calendar cal = Calendar.getInstance();
			Date createdDate = cal.getTime();
			Date lastModifiedDate = cal.getTime();
			if (mode.equalsIgnoreCase("CREATE")) {
				holidayBranchMap.setCreatedDate(createdDate);
				holidayBranchMap.setCreatedBy(loginId);
			} else {
				holidayBranchMap.setLastModifiedDate(lastModifiedDate);
				holidayBranchMap.setLastModifiedBy(loginId);
			}
			holidayBranchMap.setAuthStatus(OmniConstants.AUTH_AUTHORIZED);
			return holidayBranchMap;
		} catch (OmniNGException e) {
			e.printStackTrace();
			errMsg = e.getMessage();
			retVal = OmniConstants.INPUT;
		}
		return holidayBranchMap;
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

	public HolidayBranchMap getHolidayBranchMap() {
		return holidayBranchMap;
	}

	public void setHolidayBranchMap(HolidayBranchMap holidayBranchMap) {
		this.holidayBranchMap = holidayBranchMap;
	}

	public List<HolidayBranchMap> getHolidayBranchMaps() {
		return holidayBranchMaps;
	}

	public void setHolidayBranchMaps(List<HolidayBranchMap> holidayBranchMaps) {
		this.holidayBranchMaps = holidayBranchMaps;
	}

}
