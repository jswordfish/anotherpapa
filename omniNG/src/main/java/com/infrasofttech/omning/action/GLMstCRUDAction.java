package com.infrasofttech.omning.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.CurrencyMst;
import com.infrasofttech.domain.entities.FinancialYear;
import com.infrasofttech.domain.entities.GLMst;
import com.infrasofttech.domain.entities.ModuleMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.CurrencyMstService;
import com.infrasofttech.omning.services.FinancialYearService;
import com.infrasofttech.omning.services.GLMstService;
import com.infrasofttech.omning.services.LookupValueService;
import com.infrasofttech.omning.services.ModuleMstService;
import com.infrasofttech.omning.utils.ErrorCodes;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class GLMstCRUDAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(GLMstCRUDAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	@SuppressWarnings("unused")
	private String branchCode="";
	@SuppressWarnings("unused")
	private String loginId="";
	private String languageCode="";
	@SuppressWarnings("unused")
	private String errMsg = "";
	
	GLMst glMst= new GLMst();
	// Declare lookup MAPS...
	Map<String, String> currencies = new HashMap<String, String>();
	Map<String, String> glType = new HashMap<String, String>();
	Map<String, String> intExt = new HashMap<String, String>();
	Map<String, String> financialYear = new HashMap<String, String>();
	
	public String execute() throws Exception {
		try{
			if (request.getSession(false) == null)
			{ 
				System.out.println("GLMstCRUDAction.execute() SESSION EXPIRED");
				//Session expired 
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;	
				session.invalidate(); 
				retVal =  OmniConstants.LOGIN;	  
			} else {
				session = request.getSession();
				tenantId = (String) session.getAttribute("tenantCode");
				branchCode = (String) session.getAttribute("branchCode");
				loginId = (String) session.getAttribute("loginId");
				languageCode = (String) session.getAttribute("languageCode");
				String mode = request.getParameter("mode");
				String glCode = request.getParameter("glCode");
				String fyCode = request.getParameter("fyCode");
				
				request.setAttribute("mode", mode);
				
				setLookupValues();
				glMst= new GLMst();
				GLMstService glMstService = (GLMstService) SpringUtil.getSpringUtil().getService("glMstService");
				GLMst entity = glMstService.getGLMstByUniqueComposition(tenantId, glCode, fyCode);
				if(null==entity){
					glMst= new GLMst();
				}else{	// UPDATE, DISABLE, ENABLE
					glMst = entity;
				}

				request.setAttribute("glMst", glMst);
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
		//currencies = getLookupValues("currencies",languageCode,tenantId);  //TODO from currency service
		intExt = getLookupValues("GLCATEGORY",languageCode,tenantId);
		

		// Load all Currency of the tenant
		CurrencyMstService currencyMstService = (CurrencyMstService)SpringUtil.getSpringUtil().getService("currencyMstService");
		@SuppressWarnings("unchecked")
		List<CurrencyMst> currencyList = currencyMstService.findAllByTenant(tenantId);
		if(currencyList.size()>0){
		for(CurrencyMst currencyMst : currencyList){
			currencies.put(currencyMst.getCurrencyISOCode() , currencyMst.getCurrencyName());
		}
		}
		else{
			System.out.println("currency list is less than 0");
		}
		
		
		// Load all modules of the tenant
		ModuleMstService moduleMstService = (ModuleMstService) SpringUtil.getSpringUtil().getService("moduleMstService");
		@SuppressWarnings("unchecked")
		List<ModuleMst> moduleList = moduleMstService.findAllByTenant(tenantId);
		if(moduleList.size()>0){
		for(ModuleMst moduleMst : moduleList){
			glType.put(moduleMst.getModuleCode(), moduleMst.getModuleName());
		}
		}else{
			
			System.out.println("moduleList is less than 0");
		}
		
		FinancialYearService financialYearService = (FinancialYearService) SpringUtil.getSpringUtil().getService("financialYearService");
		@SuppressWarnings("unchecked")
		List<FinancialYear> financialYears = financialYearService.findAllByTenant(tenantId);
		if(financialYears.size()>0){
		for(FinancialYear financialYear1 : financialYears){
			financialYear.put(financialYear1.getFyCode(), financialYear1.getFyCode());
		}
		}else{
			
			System.out.println("moduleList is less than 0");
		}
		

		request.setAttribute("currencies", currencies);
		request.setAttribute("glType", glType);
		request.setAttribute("intExt", intExt);
		request.setAttribute("financialYear", financialYear);
		
	}
	
	private Map<String, String> getLookupValues(String code, String languageCode, String tenantId){
		Map<String, String> keyVal = new HashMap<String, String>();
		
		LookupValueService obj = (LookupValueService)SpringUtil.getSpringUtil().getService("lookupValueService");
		keyVal = obj.getLookupValues(code, languageCode, tenantId);

		return keyVal;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

}
