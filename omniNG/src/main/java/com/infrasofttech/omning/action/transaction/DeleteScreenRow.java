package com.infrasofttech.omning.action.transaction;

import java.util.HashMap;
import java.util.Iterator;
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
import com.infrasofttech.domain.entities.transaction.Screen;
import com.infrasofttech.domain.entities.transaction.ScreenMapper;
import com.infrasofttech.domain.entities.transaction.ScreenRow;
import com.infrasofttech.omning.services.ActivityMstService;
import com.infrasofttech.omning.services.BranchMstService;
import com.infrasofttech.omning.services.LookupValueService;
import com.infrasofttech.omning.services.ModuleMstService;
import com.infrasofttech.omning.services.ProductMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteScreenRow extends ActionSupport implements  ServletRequestAware { 

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

				setLookupValues();
				String rowNum = request.getParameter("rowNum");
				String type = request.getParameter("type");
				ScreenMapper screenMapper = (ScreenMapper) request.getSession().getAttribute("screenMapper");
				try{
					int row = Integer.parseInt(rowNum);
					Screen screen = null;
					if(type.equals("txn")){
						screen = screenMapper.getTransactionScreen();
						
						
					}
					else if(type.equals("balance")){
						screen = screenMapper.getBalancesScreen();
					}
					else if(type.equals("info")){
						screen = screenMapper.getInfoScreen();
					}
					deleteRow(screen, row);
					//request.getSession().setAttribute("screenMapper", arg1)
					
				}
				catch(Exception e){
					
				}
				// Action logic here...

				retVal = OmniConstants.SUCCESS;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{

		}
		return retVal;
	}
	
	private Screen deleteRow(Screen screen, int row){
		Iterator<ScreenRow> itr = screen.getRows().iterator();
		ScreenRow toBeDeleted = null;
		while(itr.hasNext()){
			ScreenRow screenRow = itr.next();
			if(screenRow.getRownum() == row){
				toBeDeleted = screenRow;
				break;
			}
		}
		if(toBeDeleted != null){
			screen.getRows().remove(toBeDeleted);
		}
		
		return screen;
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
