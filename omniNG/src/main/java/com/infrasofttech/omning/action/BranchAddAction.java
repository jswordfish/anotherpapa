package com.infrasofttech.omning.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.domain.entities.CountryMst;
import com.infrasofttech.domain.entities.DistrictMst;
import com.infrasofttech.domain.entities.ModuleMst;
import com.infrasofttech.domain.entities.StateMst;
import com.infrasofttech.domain.entities.VillageMst;
import com.infrasofttech.omning.services.CountryMstService;
import com.infrasofttech.omning.services.DistrictMstService;
import com.infrasofttech.omning.services.LookupValueService;
import com.infrasofttech.omning.services.ModuleMstService;
import com.infrasofttech.omning.services.StateMstService;
import com.infrasofttech.omning.services.VillageMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BranchAddAction extends ActionSupport implements
		/* ModelDriven<BranchMst>, */ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(BranchAddAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId = "";
	private String branchCode = "";
	private String loginId = "";
	private String languageCode = "en";
	private String errMsg = "";

	Map<String, String> mapBranchType = new HashMap<String, String>();
	Map<String, String> villages = new HashMap<String, String>();
	Map<String, String> districts = new HashMap<String, String>();
	Map<String, String> states = new HashMap<String, String>();
	Map<String, String> countries = new HashMap<String, String>();
	Map<String, String> mapDays = new HashMap<String, String>();
	Map<String, String> mapMonths = new HashMap<String, String>();
	Map<String, String> modules = new HashMap<String, String>();

	BranchMst branchMst = new BranchMst();

	public String execute() throws Exception {
		try {
			if (request.getSession(false) == null) {
				System.out
						.println("RoleMenuMapAddSaveAction.execute() SESSION EXPIRED");
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
				setLookupValues();
				request.setAttribute("branch", branchMst);

				retVal = OmniConstants.SUCCESS;
			} // END OF ELSE :: SESSION NOT EXPIRE
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
//			throw new OmniNGException();
		} finally {

		}
		return retVal;
	}

	private void setBranchValues() {
		branchMst.setBranchCode("");
		branchMst.setBranchRefCode("");
		branchMst.setBranchName("");
		branchMst.setBranchTypeCode("");
		branchMst.setAddress1("");
		branchMst.setAddress2("");
		branchMst.setAddress3("");
		branchMst.setVillageCode("");
		branchMst.setDistrictCode("");
		branchMst.setStateCode("");
		branchMst.setCountryCode("");
		branchMst.setPostalCode("");
		branchMst.setContactPerson("");
		branchMst.setEmailId("");
		branchMst.setTele1("");
		branchMst.setTele2("");
		branchMst.setFaxNumber("");
		branchMst.setBranchDayFromCode("");
		branchMst.setBranchDayToCode("");
		branchMst.setBranchFromTime("");
		branchMst.setBranchToTime("");
		branchMst.setFinYearFromCode("");
		branchMst.setFinYearToCode("");
		branchMst.setWeeklyHalfOff1Code("");
		branchMst.setWeeklyHalfOff2Code("");
		branchMst.setWeeklyOff1Code("");
		branchMst.setWeeklyOff2Code("");
		branchMst.setNonWorkingHalfOffs("");
	}

	@SuppressWarnings("unchecked")
	private void setLookupValues() {
		LookupValueService obj = (LookupValueService) SpringUtil
				.getSpringUtil().getService("lookupValueService");
		mapBranchType = obj.getLookupValues("BRANCHTYPE", languageCode,
				tenantId);
		mapDays = obj.getLookupValues("DAYS", languageCode, tenantId);
		mapMonths = obj.getLookupValues("MONTHS", languageCode, tenantId);

		ModuleMstService moduleMstService = (ModuleMstService) SpringUtil
				.getSpringUtil().getService("moduleMstService");
		List<ModuleMst> moduleList = moduleMstService.findAllByTenant(tenantId);
		for (ModuleMst moduleMst : moduleList) {
			modules.put(moduleMst.getModuleCode(), moduleMst.getModuleName());
		}
		VillageMstService villageMstService = (VillageMstService) SpringUtil.getSpringUtil().getService("villageMstService");

		List<VillageMst> villageList = villageMstService.findAllByTenant(tenantId);
		//findAllByTenant(tenantId);
		System.out.println("1>>" + villageList.size());
		for (VillageMst villageMst : villageList) {
			villages.put(villageMst.getVillageCode(),
					villageMst.getVillageName());
		}

		DistrictMstService districtMstService = (DistrictMstService) SpringUtil
				.getSpringUtil().getService("districtMstService");
		List<DistrictMst> districtList = districtMstService
				.findAllByTenant(tenantId);
		for (DistrictMst districtMst : districtList) {
			districts.put(districtMst.getDistrictCode(),
					districtMst.getDistrictName());
		}

		StateMstService stateMstService = (StateMstService) SpringUtil
				.getSpringUtil().getService("stateMstService");
		List<StateMst> stateList = stateMstService.findAllByTenant(tenantId);
		for (StateMst stateMst : stateList) {
			states.put(stateMst.getStateCode(), stateMst.getStateName());
		}

		CountryMstService countryMstService = (CountryMstService) SpringUtil
				.getSpringUtil().getService("countryMstService");
		List<CountryMst> countryList = countryMstService
				.findAllByTenant(tenantId);
		for (CountryMst countryMst : countryList) {
			countries.put(countryMst.getCountryCode(),
					countryMst.getCountryName());
		}

		request.setAttribute("mapBranchType", mapBranchType);
		request.setAttribute("mapDays", mapDays);
		request.setAttribute("mapMonths", mapMonths);
		request.setAttribute("modules", modules);
		request.setAttribute("villages", villages);
		request.setAttribute("districts", districts);
		request.setAttribute("states", states);
		request.setAttribute("countries", countries);
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getLanguageCode() {
		return languageCode;
	}

	public void setLanguageCode(String languageCode) {
		this.languageCode = languageCode;
	}

	public Map<String, String> getVillages() {
		return villages;
	}

	public void setVillages(Map<String, String> villages) {
		this.villages = villages;
	}

	public Map<String, String> getDistricts() {
		return districts;
	}

	public void setDistricts(Map<String, String> districts) {
		this.districts = districts;
	}

	public Map<String, String> getStates() {
		return states;
	}

	public void setStates(Map<String, String> states) {
		this.states = states;
	}

	public Map<String, String> getCountries() {
		return countries;
	}

	public void setCountries(Map<String, String> countries) {
		this.countries = countries;
	}

	public Map<String, String> getModules() {
		return modules;
	}

	public void setModules(Map<String, String> modules) {
		this.modules = modules;
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

	public Map<String, String> getMapBranchType() {
		return mapBranchType;
	}

	public void setMapBranchType(Map<String, String> mapBranchType) {
		this.mapBranchType = mapBranchType;
	}

	public Map<String, String> getMapDays() {
		return mapDays;
	}

	public void setMapDays(Map<String, String> mapDays) {
		this.mapDays = mapDays;
	}

	public Map<String, String> getMapMonths() {
		return mapMonths;
	}

	public void setMapMonths(Map<String, String> mapMonths) {
		this.mapMonths = mapMonths;
	}

	public BranchMst getBranchMst() {
		return branchMst;
	}

	public void setBranchMst(BranchMst branchMst) {
		this.branchMst = branchMst;
	}

}
