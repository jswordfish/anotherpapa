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
import com.infrasofttech.domain.entities.CurrencyMst;
import com.infrasofttech.domain.entities.CustomerMst;
import com.infrasofttech.domain.entities.ModuleMst;
import com.infrasofttech.domain.entities.PrdAcNoMst;
import com.infrasofttech.domain.entities.ProductMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.BranchMstService;
import com.infrasofttech.omning.services.CurrencyMstService;
import com.infrasofttech.omning.services.CustomerService;
import com.infrasofttech.omning.services.LookupValueService;
import com.infrasofttech.omning.services.ModuleMstService;
import com.infrasofttech.omning.services.PrdAcNoMstService;
import com.infrasofttech.omning.services.ProductMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PrdAcNoCRUDAction extends ActionSupport implements /*ModelDriven<BranchMst>,*/ ServletRequestAware {

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
	
	PrdAcNoMst prdAcNo = new PrdAcNoMst();

	// Declare lookup MAPS...
	Map<String, String> branches = new HashMap<String, String>();
	Map<String, String> modules = new HashMap<String, String>();
	Map<String, String> products = new HashMap<String, String>();
	Map<String, String> currencies = new HashMap<String, String>();
	Map<String, String> acType = new HashMap<String, String>();
	Map<String, String> modeOfOprn = new HashMap<String, String>();
	Map<String, String> acStatus = new HashMap<String, String>();
	Map<String, String> minorType = new HashMap<String, String>();
	Map<String, String> freezeType = new HashMap<String, String>();
	Map<String, String> memberType = new HashMap<String, String>();

	public String execute() throws Exception {
		try{
			if (request.getSession(false) == null)
			{ 
				System.out.println("RoleMenuMapAddSaveAction.execute() SESSION EXPIRED");
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
				String acBranchCode = request.getParameter("branchCode");
				String customerNumber = request.getParameter("customerNumber");
				String customerName = request.getParameter("customerName");
				if(null != customerNumber && customerNumber.length() > 0){
					CustomerService customerService = (CustomerService)SpringUtil.getSpringUtil().getService("customerService");
					CustomerMst customer = customerService.getCustomerMstByUniqueComposite(tenantId, customerNumber);
					if(null != customer){
						customerName = customer.getCustomerFName();
					}
				}
				
				String accountNumber = request.getParameter("accountNumber");
				
				request.setAttribute("mode", mode);

				setLookupValues();
				
				prdAcNo = new PrdAcNoMst();
				PrdAcNoMstService prdAcNoMstService = (PrdAcNoMstService) SpringUtil.getSpringUtil().getService("prdAcNoMstService");
				PrdAcNoMst entity = prdAcNoMstService.
						getPrdAcNoByUniqueComposite(tenantId, acBranchCode, moduleCode, productCode, customerNumber, accountNumber);
				if(null==entity){
					prdAcNo = new PrdAcNoMst();
				}else{	// UPDATE, DISABLE, ENABLE
					prdAcNo = entity;
				}
				request.setAttribute("prdAcNo", prdAcNo);
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
		try{
			Map<String, String> acType = new HashMap<String, String>();
			Map<String, String> modeOfOprn = new HashMap<String, String>();
			Map<String, String> acStatus = new HashMap<String, String>();
			Map<String, String> minorType = new HashMap<String, String>();
			Map<String, String> freezeType = new HashMap<String, String>();
			Map<String, String> memberType = new HashMap<String, String>();

			LookupValueService obj = (LookupValueService)SpringUtil.getSpringUtil().getService("lookupValueService");

		//	currencies = obj.getLookupValues("CURRENCY", languageCode, tenantId);
			acType = obj.getLookupValues("ACCOUNTTYPE", languageCode, tenantId);
			modeOfOprn = obj.getLookupValues("MODEOFOPERATION", languageCode, tenantId);
			acStatus = obj.getLookupValues("ACCOUNTSTATUS", languageCode, tenantId);
			minorType = obj.getLookupValues("MINORTYPE", languageCode, tenantId);
			freezeType = obj.getLookupValues("FREEZETYPE", languageCode, tenantId);
			memberType = obj.getLookupValues("MEMBERTYPE", languageCode, tenantId);

			// Load all branches of the tenant
			BranchMstService branchMstService = (BranchMstService) SpringUtil.getSpringUtil().getService("branchMstService");
			@SuppressWarnings("unchecked")
			List<BranchMst> branchList = branchMstService.findAllByTenant(tenantId);
			for(BranchMst branchMst : branchList){
				branches.put(branchMst.getBranchCode(), branchMst.getBranchName());
			}
			CurrencyMstService currencyMstService = (CurrencyMstService) SpringUtil.getSpringUtil().getService("currencyMstService");
			@SuppressWarnings("unchecked")
			List<CurrencyMst> currencyList = currencyMstService.findAllByTenant(tenantId);
			for(CurrencyMst currencyMst : currencyList){
				currencies.put(currencyMst.getCurrencyISOCode(), currencyMst.getCurrencyName());
			}
			
			// Load all modules of the tenant
			ModuleMstService moduleMstService = (ModuleMstService) SpringUtil.getSpringUtil().getService("moduleMstService");
			@SuppressWarnings("unchecked")
			List<ModuleMst> moduleList = moduleMstService.findAllByTenant(tenantId);
			for(ModuleMst moduleMst : moduleList){
				modules.put(moduleMst.getModuleCode(), moduleMst.getModuleName());
			}
	
			// Load all products of the tenant of the module
			ProductMstService productMstService = (ProductMstService) SpringUtil.getSpringUtil().getService("productMstService");
			@SuppressWarnings("unchecked")
			List<ProductMst> productList = productMstService.findAllByTenant(tenantId);
			for(ProductMst productMst : productList){
				products.put(productMst.getProductCode(), productMst.getProductName());
			}
			
			//--------------		
			request.setAttribute("branches", branches);
			request.setAttribute("modules", modules);
			request.setAttribute("products", products);
			request.setAttribute("currencies", currencies);
			request.setAttribute("acType", acType);
			request.setAttribute("modeOfOprn", modeOfOprn);
			request.setAttribute("acStatus", acStatus);
			request.setAttribute("minorType", minorType);
			request.setAttribute("freezeType", freezeType);
			request.setAttribute("memberType", memberType);
		}catch(NullPointerException e){
			errMsg="Error with data at back end!";
			retVal=OmniConstants.FAILURE;
		}catch(OmniNGException e){
			errMsg="";
			retVal=OmniConstants.FAILURE;
		}
	}
	
//	private Map<String, String> getLookupValues(String code, String languageCode, String tenantId){
//		Map<String, String> keyVal = new HashMap<String, String>();
//		//TODO Call LookupValue Service
//		
//		keyVal.put("CODE1", "VALUE 1");
//		keyVal.put("CODE2", "VALUE 2");
//		keyVal.put("CODE3", "VALUE 3");
//		
//		return keyVal;
//	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

}
