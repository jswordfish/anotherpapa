package com.infrasofttech.omning.action.transaction;

import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import com.infrasofttech.domain.entities.VoucherMst;
import com.infrasofttech.domain.entities.transaction.Screen;
import com.infrasofttech.domain.entities.transaction.ScreenDataType;
import com.infrasofttech.domain.entities.transaction.ScreenElement;
import com.infrasofttech.domain.entities.transaction.ScreenMapper;
import com.infrasofttech.domain.entities.transaction.ScreenRow;
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
				Screen txScreen = screenMapper.getTransactionScreen();
				String transId = request.getParameter("transId");
				ScreenTransactionService screenTransactionService = (ScreenTransactionService)SpringUtil.getSpringUtil().getService("screenTransactionService");
				ScreenTransaction screenTransaction = new ScreenTransaction();
				boolean isFound = false;
				if(transId != null && transId.trim().length() > 0){
					screenTransaction = screenTransactionService.findUniqueScreenTransaction(tenantId, transId);
					if(screenTransaction != null){
						isFound = true;
					}
					
				}
				if(screenTransaction == null){
					screenTransaction = new ScreenTransaction();
				}
			//	ScreenTransaction screenTransaction = new ScreenTransaction();
				if(!isFound){
					screenTransaction.setTenantId(tenantId);
					screenTransaction.setActivityCode(screenMapper.getActivityCode());
					screenTransaction.setBranchCode(screenMapper.getBranchCode());
					screenTransaction.setModuleCode(screenMapper.getModuleCode());
					screenTransaction.setProductCode(screenMapper.getProductCode());
					
					screenTransaction.setActivityName(screenMapper.getActivityName());
					screenTransaction.setBranchName(screenMapper.getBranchName());
					screenTransaction.setProductName(screenMapper.getProductName());
					screenTransaction.setModuleName(screenMapper.getModuleName());
					Long setNo = System.currentTimeMillis();
					screenTransaction.setTransactionNumber(""+setNo);
					screenTransaction.setTransactionNumber(""+setNo);
					screenTransaction.setScreen(txScreen);
				}
				
				
				String bookedType = (String) request.getSession().getAttribute("bookedType");
				String prodAccId = (String)request.getSession().getAttribute("productAccId");//check voucher mapping
				String custAccId = (String) request.getSession().getAttribute("custAccId");
				
				//screenTransaction.set
				
				
				VoucherMst voucherMst = new VoucherMst();
				voucherMst.setTenantId(tenantId);
				voucherMst.setBatchCode("Batch_NA");
				DateFormat dateFormat = new SimpleDateFormat("dd/mm/yyyy HH:mm:ss");
				Calendar cal = Calendar.getInstance();
				String dt = dateFormat.format(cal.getTime());
				voucherMst.setEntryDate(dt);
				voucherMst.setBranchCode(screenMapper.getBranchCode());
				voucherMst.setSetNo(new Long(screenTransaction.getTransactionNumber()));
				Long scrollNo = System.currentTimeMillis();
				voucherMst.setScrollNo(scrollNo);
				voucherMst.setBookType(bookedType);//check voucher mapping
				voucherMst.setCashFlowType(bookedType);//check voucher mapping
				voucherMst.setMainAcctId(prodAccId);//check voucher mapping
				voucherMst.setVcrAcctId(custAccId);//check voucher mapping
				
//				if(bookedType != null && bookedType.equalsIgnoreCase("Transfer")){
//					request.setAttribute("showAdd", "true");
//				}
						
				//voucherMst.setCashFlowType(cashFlowType);
				
				//String transactionId = request
				 
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
						String voucherAttr = screenElement.getVoucherAttr();
						Character ch = voucherAttr.charAt(0);
						ch = Character.toUpperCase(ch);
						voucherAttr = ch + voucherAttr.substring(1, voucherAttr.length());
						if(screenElement.getScreenDataType().getVal().contains("Integer") ){
							Method method = VoucherMst.class.getMethod("set"+voucherAttr, Integer.class);
							Integer res = new Integer(value);
							method.invoke(voucherMst, res);
						}
						else if(screenElement.getScreenDataType().getVal().contains("Long")){
							Method method = VoucherMst.class.getMethod("set"+voucherAttr, Long.class);
							Long res = new Long(value);
							method.invoke(voucherMst, res);
						}
						else if(screenElement.getScreenDataType().getVal().contains("Float")){
							Method method = VoucherMst.class.getMethod("set"+voucherAttr, Float.class);
							Float res = new Float(value);
							method.invoke(voucherMst, res);
						}
						else if(screenElement.getScreenDataType().getVal().contains("Double")){
							Method method = VoucherMst.class.getMethod("set"+voucherAttr, Double.class);
							Double res = new Double(value);
							method.invoke(voucherMst, res);
						}
						else if(screenElement.getScreenDataType().getVal().contains("Date")){
							SimpleDateFormat sdf1 = new SimpleDateFormat();
						    sdf1.applyPattern("dd/MM/yyyy");
						    Date date = sdf1.parse(value);
						    Method method = VoucherMst.class.getMethod("set"+voucherAttr, Date.class);
						    method.invoke(voucherMst, date);
						}
						else if(screenElement.getScreenDataType().getVal().contains("Number")){
							Method method = VoucherMst.class.getMethod("set"+voucherAttr, Integer.class);
							Integer res = new Integer(value);
							method.invoke(voucherMst, res);
						}
						else{
							//string
							Method method = VoucherMst.class.getMethod("set"+voucherAttr, String.class);
							//Integer res = new Integer(value);
							method.invoke(voucherMst, value);
						}
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
				//screenTransaction.getVouchers().add(voucherMst);
				//screenTransaction.setRowTransactions(screenRowTransactions);
				//String transactionId = "txnNo-"+System.currentTimeMillis();
				
			//	ScreenTransactionService screenTransactionService = (ScreenTransactionService)SpringUtil.getSpringUtil().getService("screenTransactionService");
				screenTransaction = screenTransactionService.saveOrUpdate(screenTransaction, voucherMst);
				
				List<ScreenTransaction> transactions = screenTransactionService.findAllByTenant(tenantId);
				request.setAttribute("screenTransaction", screenTransaction);
				request.setAttribute("screenMapper" , screenMapper);
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
