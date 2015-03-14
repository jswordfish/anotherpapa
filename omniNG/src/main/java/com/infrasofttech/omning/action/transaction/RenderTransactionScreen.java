package com.infrasofttech.omning.action.transaction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.ActivityMst;
import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.domain.entities.ModuleMst;
import com.infrasofttech.domain.entities.ProductMst;
import com.infrasofttech.domain.entities.transaction.ScreenMapper;
import com.infrasofttech.omning.services.ActivityMstService;
import com.infrasofttech.omning.services.BranchMstService;
import com.infrasofttech.omning.services.LookupValueService;
import com.infrasofttech.omning.services.ModuleMstService;
import com.infrasofttech.omning.services.ProductMstService;
import com.infrasofttech.omning.transaction.services.ScreenMapperService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RenderTransactionScreen extends ActionSupport implements  ServletRequestAware { 

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(TxnClientConfigCRUDAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String languageCode="";
	private String branchCode="";
	private String loginId="";
	
	private String errMsg = "";
	
	Map<String, String> branches = new HashMap<String, String>();
	Map<String, String> modules = new HashMap<String, String>();
	Map<String, String> products = new HashMap<String, String>();
	Map<String, String> activities = new HashMap<String, String>();
	
	@SuppressWarnings("unchecked")
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
				tenantId = (String)request.getSession().getAttribute("tenantCode");
				branchCode = (String)request.getSession().getAttribute("branchCode");
				languageCode = (String)request.getSession().getAttribute("languageCode");
				loginId = (String)request.getSession().getAttribute("loginID");
				
				String bookedType = request.getParameter("bookedType");
				String productAccId = request.getParameter("productAccId");
				String custAccId = request.getParameter("custAccId");
				
				String transId = request.getParameter("transId");
					if(transId != null){
						request.setAttribute("transId", transId);
					}
				
				request.getSession().setAttribute("bookedType", bookedType);
				request.getSession().setAttribute("productAccId", productAccId);
				request.getSession().setAttribute("custAccId", custAccId);
				
				
				long id = new Long(request.getParameter("id"));
				
				ScreenMapperService screenMapperService = (ScreenMapperService) SpringUtil.getSpringUtil().getService("screenMapperService");
				ScreenMapper screenMapper = (ScreenMapper) screenMapperService.find(id);
				request.getSession().setAttribute("screenMapper", screenMapper);

				retVal = OmniConstants.SUCCESS;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{

		}
		return retVal;
	}
	
private void setLookupValues() {
		
		LookupValueService obj = (LookupValueService)SpringUtil.getSpringUtil().getService("lookupValueService");
		obj.getLookupValues("CURRENCY", languageCode, tenantId);

		BranchMstService branchMstService = (BranchMstService) SpringUtil.getSpringUtil().getService("branchMstService");
		@SuppressWarnings("unchecked")
		List<BranchMst> branchList = branchMstService.findAllByTenant(tenantId);
		for(BranchMst branchMst : branchList){
			branches.put(branchMst.getBranchCode(), branchMst.getBranchName());
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
		
		// Load all products of the tenant of the module
		ActivityMstService activityMstService = (ActivityMstService) SpringUtil.getSpringUtil().getService("activityMstService");
		@SuppressWarnings("unchecked")
		List<ActivityMst> activityList = activityMstService.findAllByTenant(tenantId);
		for(ActivityMst activityMst : activityList){
			activities.put(activityMst.getActivityCode(), activityMst.getActivityDesc());
		}
		
		if(activities != null && activities.size() == 0) {
			activities = new HashMap<String, String>();
			activities.put("a01", "a01");
			activities.put("a02", "a02");
			activities.put("a02", "a02");
		}
		//--------------		
		request.setAttribute("branches", branches);
		request.setAttribute("modules", modules);
		request.setAttribute("products", products);
		request.setAttribute("activities", activities);
	}
	
	
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}
}
