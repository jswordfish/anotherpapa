package com.infrasofttech.omning.action;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.ModuleMst;
import com.infrasofttech.domain.entities.PrdAcNumberConfig;
import com.infrasofttech.domain.entities.ProductMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.LookupValueService;
import com.infrasofttech.omning.services.ModuleMstService;
import com.infrasofttech.omning.services.PrdAcNoConfigService;
import com.infrasofttech.omning.services.ProductMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PrdAcNumberConfigCURDAction extends ActionSupport implements /*ModelDriven<BranchMst>,*/ ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(PrdAcNumberConfigCURDAction.class);
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
	
	// Declare lookup MAPS...
	    Map<String, String> sepr = new TreeMap<String, String>();
		
	
	    PrdAcNumberConfig prdAcNumberConfig = new PrdAcNumberConfig();
		Map<String, String> modules = new HashMap<String, String>();
		Map<String, String> products = new HashMap<String, String>();
	
	    public String execute() throws Exception {
			try{
				if (request.getSession(false) == null)
				{ 
					System.out.println("SESSION EXPIRED");
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
					
//					System.out.println(">"+mode+","+productCode+","+moduleCode+"<");
//					if(null==product.getAutoGenAcNoYN()){
//						System.out.println("Auto Gen Ac No: NULL Mila");
//					}else{
//						System.out.println("Auto Gen Ac No:>"+ product.getAutoGenAcNoYN() +"<");
//					}
					prdAcNumberConfig = new PrdAcNumberConfig();
					PrdAcNoConfigService prdAcNoConfigService=(PrdAcNoConfigService) SpringUtil.getSpringUtil().getService("prdAcNoConfigService");
					PrdAcNumberConfig entity = prdAcNoConfigService.getPrdAcNumberConfigByUniqueComposite(tenantId, moduleCode, productCode);
	 
					if(null==entity){
						prdAcNumberConfig = new PrdAcNumberConfig();
						/*SimpleDateFormat sd= new SimpleDateFormat("dd-MMM-yyyy");
						String date = sd.format(prdAcNumberConfig.getEffFromDate());
						Date EffFromdate = sd.parse(date);
						String date1 = sd.format(prdAcNumberConfig.getEffTillDate());
						Date EffTilldate = sd.parse(date1);
						System.out.println("EffFromdate......."+EffFromdate);
						System.out.println("EffTilldate......"+EffTilldate);
						prdAcNumberConfig.setEffFromDate(EffFromdate);
						prdAcNumberConfig.setEffTillDate(EffTilldate);*/
						
					}else{	// ADD, DISABLE, ENABLE
						prdAcNumberConfig = entity;
					}
					request.setAttribute("prdAcNumberConfig", prdAcNumberConfig);

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
		 LookupValueService obj = (LookupValueService) SpringUtil.getSpringUtil().getService("lookupValueService");
		sepr =obj.getLookupValues("SEPR",languageCode,tenantId);  //TODO from currency service
	

		// Load all modules of the tenant
		ModuleMstService moduleMstService = (ModuleMstService) SpringUtil.getSpringUtil().getService("moduleMstService");
		ProductMstService productMstService = (ProductMstService) SpringUtil.getSpringUtil().getService("productMstService");
		@SuppressWarnings("unchecked")
		List<ModuleMst> moduleList = moduleMstService.findAllByTenant(tenantId);
		for(ModuleMst moduleMst : moduleList){
			modules.put(moduleMst.getModuleCode(), moduleMst.getModuleName());
		}
		@SuppressWarnings("unchecked")
		List<ProductMst> productList = productMstService.findAllByTenant(tenantId);
		for(ProductMst productMst : productList){
			products.put(productMst.getProductCode(), productMst.getProductName());
		}
		request.setAttribute("products", products);
		request.setAttribute("modules", modules);
		request.setAttribute("sepr", sepr);
	
	}
	
	
	
	private Map<String, String> getLookupValues(String code, String languageCode, String tenantId){
		Map<String, String> keyVal = new HashMap<String, String>();
		//TODO Call LookupValue Service
		
		keyVal.put("CODE1", "VALUE 1");
		keyVal.put("CODE2", "VALUE 2");
		keyVal.put("CODE3", "VALUE 3");
		
		return keyVal;
	}
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;		
	}
	
}
