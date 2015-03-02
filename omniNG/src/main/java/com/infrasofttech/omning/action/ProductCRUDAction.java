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
import com.infrasofttech.domain.entities.GLMst;
import com.infrasofttech.domain.entities.ModuleMst;
import com.infrasofttech.domain.entities.ProductMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.CurrencyMstService;
import com.infrasofttech.omning.services.GLMstService;
import com.infrasofttech.omning.services.LookupValueService;
import com.infrasofttech.omning.services.ModuleMstService;
import com.infrasofttech.omning.services.ProductMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ProductCRUDAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(ProductCRUDAction.class);
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
	
	ProductMst product = new ProductMst();

	// Declare lookup MAPS...
	Map<String, String> currencies = new HashMap<String, String>();
	Map<String, String> custInt = new HashMap<String, String>();
	Map<String, String> acOpenLvl = new HashMap<String, String>();
	Map<String, String> vcrEntryLvl = new HashMap<String, String>();
	Map<String, String> modules = new HashMap<String, String>();
	Map<String, String> depositTypes = new HashMap<String, String>();
	Map<String, String> assetLiability = new HashMap<String, String>();
	Map<String, String> finNonFin = new HashMap<String, String>();
	Map<String, String> condAssetGL = new HashMap<String, String>();
	Map<String, String> condLiabilityGL = new HashMap<String, String>();
	Map<String, String> reconTypes = new HashMap<String, String>();
	Map<String, String> prdStatus = new HashMap<String, String>();
	Map<String, String> generalLadgers = new HashMap<String, String>();
	
	public String execute() throws Exception {
		try{
			if (request.getSession(false) == null)
			{ 
				System.out.println("ProductCRUDAction.execute() SESSION EXPIRED");
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
				String mode = request.getParameter("mode");
				String productCode = request.getParameter("productCode");
				String moduleCode = request.getParameter("moduleCode");
				
				request.setAttribute("mode", mode);


				setLookupValues();
				
//				System.out.println(">"+mode+","+productCode+","+moduleCode+"<");
//				if(null==product.getAutoGenAcNoYN()){
//					System.out.println("Auto Gen Ac No: NULL Mila");
//				}else{
//					System.out.println("Auto Gen Ac No:>"+ product.getAutoGenAcNoYN() +"<");
//				}
				product = new ProductMst();
				ProductMstService productMstService = (ProductMstService) SpringUtil.getSpringUtil().getService("productMstService");
				ProductMst entity = productMstService.getProductMstByUniqueComposite(tenantId, moduleCode, productCode);
				if(null==entity){
					product = new ProductMst();
				}else{	// UPDATE, DISABLE, ENABLE
					product = entity;
				}
				


				request.setAttribute("product", product);

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
		
		custInt = getLookupValues("CUSTINT",languageCode,tenantId);
		acOpenLvl = getLookupValues("ACCTOPENLEVEL",languageCode,tenantId);
		vcrEntryLvl = getLookupValues("VCRENTRYLEVEL",languageCode,tenantId);
		depositTypes = getLookupValues("TYPEOFDEPOSIT",languageCode,tenantId);
		assetLiability = getLookupValues("ASSETLIABILITY",languageCode,tenantId);
		finNonFin = getLookupValues("FINNONFIN",languageCode,tenantId);
		condAssetGL = getLookupValues("ASSETLIABILITY",languageCode,tenantId);
		condLiabilityGL = getLookupValues("ASSETLIABILITY",languageCode,tenantId);
		reconTypes = getLookupValues("RECONTYPE",languageCode,tenantId);
		prdStatus = getLookupValues("PRODSTATUS",languageCode,tenantId);

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
		for(ModuleMst moduleMst : moduleList){
			modules.put(moduleMst.getModuleCode(), moduleMst.getModuleName());
		}
		// Load all GL of the tenant
		GLMstService glMstService = (GLMstService) SpringUtil.getSpringUtil().getService("glMstService");
		@SuppressWarnings("unchecked")
		List<GLMst> glMstList = glMstService.getGLList(tenantId);
		System.out.println("Product GLSize ::"+glMstList.size());
		for(GLMst glMst : glMstList){
			generalLadgers.put(glMst.getGlCode(), glMst.getGlName());
		}
		
		

		request.setAttribute("currencies", currencies);
		request.setAttribute("custInt", custInt);
		request.setAttribute("acOpenLvl", acOpenLvl);
		request.setAttribute("vcrEntryLvl", vcrEntryLvl);
		request.setAttribute("modules", modules);
		request.setAttribute("depositTypes", depositTypes);
		request.setAttribute("assetLiability", assetLiability);
		request.setAttribute("finNonFin", finNonFin);
		request.setAttribute("condAssetGL", condAssetGL);
		request.setAttribute("condLiabilityGL", condLiabilityGL);
		request.setAttribute("reconTypes", reconTypes);
		request.setAttribute("prdStatus", prdStatus);
		request.setAttribute("generalLadgers", generalLadgers);
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
