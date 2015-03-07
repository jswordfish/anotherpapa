package com.infrasofttech.omning.action.transaction;

import java.math.BigDecimal;
import java.util.ArrayList;
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
import com.infrasofttech.domain.entities.transaction.Screen;
import com.infrasofttech.domain.entities.transaction.ScreenDataType;
import com.infrasofttech.domain.entities.transaction.ScreenElement;
import com.infrasofttech.domain.entities.transaction.ScreenMapper;
import com.infrasofttech.domain.entities.transaction.ScreenRow;
import com.infrasofttech.domain.entities.transaction.ScreenUIType;
import com.infrasofttech.domain.entities.transaction.runtime.ScreenElementTransaction;
import com.infrasofttech.domain.entities.transaction.runtime.ScreenRowTransaction;
import com.infrasofttech.domain.entities.transaction.runtime.ScreenTransaction;
import com.infrasofttech.omning.services.ActivityMstService;
import com.infrasofttech.omning.services.BranchMstService;
import com.infrasofttech.omning.services.LookupValueService;
import com.infrasofttech.omning.services.ModuleMstService;
import com.infrasofttech.omning.services.ProductMstService;
import com.infrasofttech.omning.transaction.services.ScreenTransactionService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SaveTransactionAction extends ActionSupport implements  ServletRequestAware { 

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

				
				ScreenMapper screenMapper = (ScreenMapper)request.getSession().getAttribute("screenMapper");
				ScreenTransaction screenTransaction = new ScreenTransaction();
				screenTransaction.setTenantId(tenantId);
				screenTransaction.setActivityCode(screenMapper.getActivityCode());
				screenTransaction.setBranchCode(screenMapper.getBranchCode());
				screenTransaction.setModuleCode(screenMapper.getModuleCode());
				screenTransaction.setProductCode(screenMapper.getProductCode());
				
				screenTransaction.setActivityName(screenMapper.getActivityName());
				screenTransaction.setBranchName(screenMapper.getBranchName());
				screenTransaction.setProductName(screenMapper.getProductName());
				screenTransaction.setModuleName(screenMapper.getModuleName());
				
				//screenTransaction.set
				Screen txScreen = screenMapper.getTransactionScreen();
				 
				List<ScreenRowTransaction> screenRowTransactions = new ArrayList<ScreenRowTransaction>();
				for(ScreenRow row: txScreen.getRows()){
					ScreenRowTransaction rowTransaction = new ScreenRowTransaction();
					rowTransaction.setScreenRow(row);
					int count = 0;
					List<ScreenElementTransaction> elementTransactions = new ArrayList<ScreenElementTransaction>();
					for(ScreenElement screenElement: row.getScreenElements()){
						ScreenElementTransaction elementTransaction = new ScreenElementTransaction();
						elementTransaction.setScreenElement(screenElement);
						String value = request.getParameter("Txn"+screenElement.getName()+"Row"+row.getId()+"Col"+count);
						count++;
						if(screenElement.getScreenDataType().getVal().equals(ScreenDataType.String)){
							elementTransaction.setTextValue(value);
						}
						else if(screenElement.getScreenDataType().getVal().equals(ScreenDataType.Number)){
							elementTransaction.setLongValue(new Long(value));
						}
						else if(screenElement.getScreenDataType().getVal().equals(ScreenDataType.Decimal)){
							elementTransaction.setDecimalValue(new BigDecimal(value));
						}
						else{
							elementTransaction.setTextValue(value);
						}
						elementTransactions.add(elementTransaction);
					}
					rowTransaction.setElementTransactions(elementTransactions);
					screenRowTransactions.add(rowTransaction);
					
				}
				screenTransaction.setRowTransactions(screenRowTransactions);
				String transactionId = "txnNo-"+System.currentTimeMillis();
				screenTransaction.setTransactionNumber(transactionId);
				screenTransaction.setScreen(txScreen);
				ScreenTransactionService screenTransactionService = (ScreenTransactionService)SpringUtil.getSpringUtil().getService("screenTransactionService");
				screenTransactionService.saveOrUpdate(screenTransaction);
				
				List<ScreenTransaction> transactions = screenTransactionService.findAllByTenant(tenantId);
				request.setAttribute("transactions", transactions);
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
