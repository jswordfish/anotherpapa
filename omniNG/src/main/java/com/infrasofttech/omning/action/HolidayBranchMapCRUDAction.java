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

import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.domain.entities.HolidayBranchMap;
import com.infrasofttech.domain.entities.HolidayMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.BranchMstService;
import com.infrasofttech.omning.services.HolidayBranchMapService;
import com.infrasofttech.omning.services.HolidayMstService;
import com.infrasofttech.omning.services.LookupValueService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class HolidayBranchMapCRUDAction extends ActionSupport implements
		ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(HolidayBranchMapCRUDAction.class);
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
	List<HolidayBranchMap> holidayBranchMaps = new ArrayList<HolidayBranchMap>();
	HolidayBranchMap holidayBranchMap = new HolidayBranchMap();
	List<HolidayMst> holidays;
	private Map<String, String> branches = new HashMap<String, String>();

	@SuppressWarnings("unchecked")
	public String execute() throws Exception {
		try {
			if (request.getSession(false) == null) {
				System.out
						.println("HolidayBranchMapCRUDAction.execute() SESSION EXPIRED");
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
				String branchCode = request.getParameter("branchCode");
				String holidayCode = request.getParameter("holidayCode");
				String setNo1 = request.getParameter("setNo");
				String holidayDate = request.getParameter("holidayDate");
				request.setAttribute("mode", mode);

				setLookupValues();

				HolidayMstService holidayMstService = (HolidayMstService) SpringUtil
						.getSpringUtil().getService("holidayMstService");
				holidays = holidayMstService.findAllByTenant(tenantId);
				System.out.println("size of holidays 1::::" + holidays.size());
				holidayBranchMap = new HolidayBranchMap();
				HolidayBranchMapService holidayBranchMapService = (HolidayBranchMapService) SpringUtil
						.getSpringUtil().getService("holidayBranchMapService");

				HolidayBranchMap entity = holidayBranchMapService
						.getHolidayBranchMapByUniqueComposite(tenantId,
								branchCode, holidayDate, holidayCode);
				if (null == entity) {
					holidayBranchMap = new HolidayBranchMap();

				} else { // UPDATE, DISABLE, ENABLE
					System.out.println("entity not null"
							+ holidayBranchMap.getBranchCode());
					holidayBranchMaps = holidayBranchMapService
							.getHolidayBranchMapBysetNo(
									holidayBranchMap.getTenantId(),
									holidayBranchMap.getSetNo());

					holidayBranchMap = entity;

					request.setAttribute("holidayBranchMap", holidayBranchMap);
					request.setAttribute("branches", branches);

				}

				BranchMstService branchMstService = (BranchMstService) SpringUtil
						.getSpringUtil().getService("branchMstService");
				@SuppressWarnings("unchecked")
				List<BranchMst> branchList = branchMstService
						.findAllByTenant(tenantId);
				for (BranchMst branchMst : branchList) {
					branches.put(branchMst.getBranchCode(),
							branchMst.getBranchName());
				}
				request.setAttribute("branches", branches);
				request.setAttribute("holidays", holidays);
				request.setAttribute("holidayBranchMap", holidayBranchMap);
				System.out.println("size of holidays 1::::" + holidays.size());
				retVal = OmniConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			throw new OmniNGException();
		} finally {

		}
		return retVal;
	}

	private void setLookupValues() {

		LookupValueService obj = (LookupValueService) SpringUtil
				.getSpringUtil().getService("lookupValueService");

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

	public HolidayBranchMap getHolidayBranchMap() {
		return holidayBranchMap;
	}

	public void setHolidayBranchMap(HolidayBranchMap holidayBranchMap) {
		this.holidayBranchMap = holidayBranchMap;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

	public Map<String, String> getBranches() {
		return branches;
	}

	public void setBranches(Map<String, String> branches) {
		this.branches = branches;
	}

	public List<HolidayMst> getHolidays() {
		return holidays;
	}

	public void setHolidays(List<HolidayMst> holidays) {
		this.holidays = holidays;
	}

}
