package com.infrasofttech.omning.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.HolidayMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.HolidayMstService;
import com.infrasofttech.omning.utils.ErrorCodes;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class HolidayCRUDAction extends ActionSupport implements
/* ModelDriven<BranchMst>, */ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(HolidayCRUDAction.class);
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

	HolidayMst holiday = new HolidayMst();

	public String execute() throws Exception {

		try {
			if (request.getSession(false) == null) {
				System.out.println("HolidayCRUDAction.execute() SESSION EXPIRED");
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
				String holidayCode = request.getParameter("holidayCode");
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date holidayDate = new Date();
				if (null!=request.getParameter("holidayDate")){
					if(!request.getParameter("holidayDate").isEmpty()
						&& request.getParameter("holidayDate") != "") {
						try {
							 String fromDate = request.getParameter("holidayDate");
							 System.out.println("value of from date>>>>" + fromDate);
							 holidayDate = new SimpleDateFormat("yyyy-MM-dd").parse(fromDate);
							String fromdate1 = new SimpleDateFormat("yyyy-MM-dd")
									.format(holidayDate);
							holiday.setHolidayDate((Date) dateFormat
									.parse(fromdate1));
						} catch (Exception e) {
							System.out.println("error while parsing fromDate " + e);
							logger.error("error while parsing fromDate", e);
							e.printStackTrace();
						}
					}
				}else{
					 holidayDate=new Date();
				}
				
				request.setAttribute("mode", mode);
				holiday = new HolidayMst();

				HolidayMstService holidayMstService = (HolidayMstService) SpringUtil
						.getSpringUtil().getService("holidayMstService");
				HolidayMst entity = holidayMstService.getHolidayMstByUniqueComposite(tenantId, holidayCode);

				if (null == entity) {
					holiday = new HolidayMst();
				} else { // UPDATE, DISABLE, ENABLE
					holiday = entity;
				}

				request.setAttribute("holiday", holiday);

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

}
