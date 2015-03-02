package com.infrasofttech.omning.action;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.AppConfig;
import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.AppConfigService;
import com.infrasofttech.omning.services.BranchMstService;
import com.infrasofttech.omning.services.LookupValueService;
import com.infrasofttech.omning.utils.ErrorCodes;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AppConfigCRUDAction extends ActionSupport implements  ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(AppConfigCRUDAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	@SuppressWarnings("unused")
	private String branchCode="";
	@SuppressWarnings("unused")
	private String loginId="";
	private String languageCode="en";
	@SuppressWarnings("unused")
	private String errMsg = "";
	private Long setNo;
	
	String effectiveToDate;
	String effectiveFromDate;
	
	AppConfig  appConfig = new AppConfig();
	
	Map<String, String> branches = new HashMap<String, String>();
	
	// Declare lookup MAPS...
	Map<String, String> dateFormat = new HashMap<String, String>();
	Map<String, String> decimalFormat = new HashMap<String, String>();
	Map<String, String> digitSeparator = new HashMap<String, String>();
	Map<String, String> amountFormat = new HashMap<String, String>();
	Map<String, String> numberFormat = new HashMap<String, String>();
	Map<String, String> customerIdLenTypeCode = new HashMap<String, String>();
	Map<String, String> customerIdGenType = new HashMap<String, String>();
	
	Integer customerIdLen;
	private List<AppConfig> appConfigs = new ArrayList<AppConfig>();

	public String execute() throws Exception {
		try{
			if (request.getSession(false) == null)
			{ 
				System.out.println("AppConfigCRUDAction.execute() SESSION EXPIRED");
				//Session expired 
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;	
				session.invalidate(); 
				retVal =  OmniConstants.LOGIN;	  
			} else {
				session = request.getSession();
				tenantId = (String) session.getAttribute("tenantCode");
				/*branchCode = (String) session.getAttribute("branchCode");*/				
				loginId = (String) session.getAttribute("loginId");
				languageCode = (String) session.getAttribute("languageCode");
						
				String mode = request.getParameter("mode");
				String branchCode1 = request.getParameter("branchCode");
				request.setAttribute("mode", mode);

				setLookupValues();
				


				appConfig = new AppConfig();
				AppConfigService appConfigService = (AppConfigService) SpringUtil.getSpringUtil().getService("appConfigService");
				AppConfig entity=(AppConfig)appConfigService.getAppConfigByUniqueComposite(tenantId, branchCode1);
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				if(null==entity){
					
					/*appConfig = new AppConfig();
					effectiveFromDate = dateFormat.format(appConfig.getEffFromDate());
					request.setAttribute("effectiveFromDate", effectiveFromDate);
					effectiveToDate = dateFormat.format(appConfig.getEffToDate());
					request.setAttribute("effectiveToDate", effectiveToDate);*/
					
		
					
				}else{	// UPDATE, DISABLE, ENABLE
					
					appConfig = entity;										
					setNo	 = appConfig.getSetNo();
					
					
				
					appConfigs = appConfigService.getAppConfigBySetNoTenant(tenantId, setNo);
					
				
					
		
					
				}
				
		
				request.setAttribute("appConfig", appConfig);

				retVal = OmniConstants.SUCCESS;
			}
		}catch(Exception e){
			e.printStackTrace();
			throw new OmniNGException();
		}finally{
			
		}
		return retVal;
	}

	private void setLookupValues(){

		// Load all branches of the tenant
		BranchMstService branchMstService = (BranchMstService) SpringUtil.getSpringUtil().getService("branchMstService");
		Map<String, String> branches = new HashMap<String, String>();
		@SuppressWarnings("unchecked")
		List<BranchMst> branchList = branchMstService.getBranches(tenantId);
		for(BranchMst branchMst : branchList){
			branches.put(branchMst.getBranchCode(), branchMst.getBranchName());
		}

		System.out.println("CRUDAppConfig :: "+appConfig.getSetNo());
		dateFormat = getLookupValues("DATEFORMAT",languageCode,tenantId);		
		decimalFormat = getLookupValues("DECIMALFORMAT",languageCode,tenantId);
		digitSeparator = getLookupValues("DIGITFORMAT",languageCode,tenantId);
		amountFormat = getLookupValues("AMOUNTFORMAT",languageCode,tenantId);
		numberFormat = getLookupValues("NUMBERFORMAT",languageCode,tenantId);
		customerIdLenTypeCode = getLookupValues("CUSTIDLENTYPE",languageCode,tenantId);
		customerIdGenType = getLookupValues("CUSTOMERID",languageCode,tenantId);

		
	

		request.setAttribute("branches",branches);
		request.setAttribute("dateFormat", dateFormat);
		request.setAttribute("decimalFormat", decimalFormat);
		request.setAttribute("digitSeparator", digitSeparator);
		request.setAttribute("amountFormat", amountFormat);
		request.setAttribute("numberFormat", numberFormat);
		request.setAttribute("customerIdLen", customerIdLen);
		request.setAttribute("customerIdLenTypeCode", customerIdLenTypeCode);
		request.setAttribute("customerIdGenType", customerIdGenType);
	
	}
	
	private Map<String, String> getLookupValues(String code, String languageCode, String tenantId){
		Map<String, String> keyVal = new HashMap<String, String>();

		//Call LookupValue Service
		LookupValueService obj = (LookupValueService)SpringUtil.getSpringUtil().getService("lookupValueService");
		keyVal = obj.getLookupValues(code, languageCode, tenantId);
		
		return keyVal;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}
	public List<AppConfig> getAppConfigs() {
		return appConfigs;
	}

	public void setAppConfigs(List<AppConfig> appConfigs) {
		this.appConfigs = appConfigs;
	}

}
