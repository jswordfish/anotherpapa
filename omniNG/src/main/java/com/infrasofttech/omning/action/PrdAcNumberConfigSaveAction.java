package com.infrasofttech.omning.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.PrdAcNumberConfig;
import com.infrasofttech.domain.entities.ProductMst;
import com.infrasofttech.omning.services.PrdAcNoConfigService;
import com.infrasofttech.omning.utils.SpringUtil;

import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class PrdAcNumberConfigSaveAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(PrdAcNumberConfigSaveAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String branchCode="";
	private String loginId="";
	private String languageCode="";
	private String errMsg = "";
	private String mode="";
	PrdAcNumberConfig prdAcNumberConfig = new PrdAcNumberConfig();
	private Boolean branchYN;
	private Boolean currencyYN;
	private Boolean productYN;
	private Boolean customerYN;
	private Boolean accountYN;
	private Boolean subAccountYN;
	
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
				languageCode = (String) session.getAttribute("languageCode");
				mode = (String)request.getParameter("mode");
				
				System.out.println("Saving in "+mode+" mode.");
				// Action logic here...
				String moduleCode=(String)request.getParameter("moduleCode");
				String productCode=(String)request.getParameter("productCode");
				prdAcNumberConfig = new PrdAcNumberConfig();
				
				PrdAcNoConfigService prdAcNoConfigService=(PrdAcNoConfigService) SpringUtil.getSpringUtil().getService("prdAcNoConfigService");
				prdAcNumberConfig  = prdAcNoConfigService.getPrdAcNumberConfigByUniqueComposite(tenantId, moduleCode, productCode);
				
				Calendar cal = Calendar.getInstance();
				Date currDate = cal.getTime();
				if(prdAcNumberConfig == null){  // CREATE MODE
					prdAcNumberConfig = new PrdAcNumberConfig();
					prdAcNumberConfig = setValuesToProductMst(prdAcNumberConfig);
					prdAcNumberConfig.setCreatedDate(currDate);
					prdAcNumberConfig.setCreatedBy(loginId);
					prdAcNumberConfig.setAuthStatus(OmniConstants.AUTH_AUTHORIZED);
				}else{  // UPDATE MODE
					prdAcNumberConfig = setValuesToProductMst(prdAcNumberConfig);
					prdAcNumberConfig.setLastModifiedDate(currDate);
					prdAcNumberConfig.setLastModifiedBy(loginId);
					prdAcNumberConfig.setAuthStatus(OmniConstants.AUTH_AUTHORIZED);
				}
				
				prdAcNumberConfig.setTenantId(tenantId);
				prdAcNumberConfig.setModuleCode(moduleCode);
				prdAcNumberConfig.setProductCode(productCode);
				
				prdAcNumberConfig = prdAcNoConfigService.saveOrUpdate(prdAcNumberConfig);
				if(null == prdAcNumberConfig){
					errMsg="Error while saving";
					retVal = OmniConstants.INPUT;
				}else{
					retVal = OmniConstants.SUCCESS;
				}
			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			e.printStackTrace();
			retVal = OmniConstants.INPUT;
		}finally{
			
		}
		return retVal;
	}
	/*private PrdAcNumberConfig setValuesFromJSP(PrdAcNumberConfig prdAcNumberConfig){
		String i = request.getParameter("");
		
		
		
		
		
		
		
		
		prdAcNumberConfig.setAccountLen(Integer.parseInt());
		
		return prdAcNumberConfig;
	}*/
	private PrdAcNumberConfig setValuesToProductMst(PrdAcNumberConfig prdAcNumberConfig){
		
		try {
			if(request.getParameter("totalAccountLen")!=null)
			prdAcNumberConfig.setTotalAccountLen(Integer.parseInt(request.getParameter("totalAccountLen")));
			
			if(request.getParameter("totalSubAccountLen")!=null)
			prdAcNumberConfig.setTotalSubAccountLen(Integer.parseInt(request.getParameter("totalSubAccountLen")));
			
		
			
			if (request.getParameter("branchYN") != null) {
				branchYN = true;
			} else {
				branchYN = false;
			}

			if (request.getParameter("currencyYN") != null) {
				currencyYN = true;
			} else {
				currencyYN = false;
			}

			if (request.getParameter("customerYN") != null) {
				customerYN = true;
			} else {
				customerYN = false;
			}

			if (request.getParameter("productYN") != null) {
				productYN = true;
			} else {
				productYN = false;
			}

			if (request.getParameter("subAccountYN") != null) {
				subAccountYN = true;
			} else {
				subAccountYN = false;
			}
			accountYN = true;
			
			
			prdAcNumberConfig.setBranchYN(branchYN);
			prdAcNumberConfig.setCurrencyYN(currencyYN);
			prdAcNumberConfig.setProductYN(productYN);
			prdAcNumberConfig.setCustomerYN(customerYN);
			prdAcNumberConfig.setAccountYN(accountYN);
			prdAcNumberConfig.setSubAccountYN(subAccountYN);
			
			System.out.println("branchYN  "+branchYN);
			System.out.println("currencyYN  "+currencyYN);
			System.out.println("productYN  "+productYN);
			System.out.println("customerYN  "+customerYN);
			System.out.println("accountYN  "+accountYN);
			System.out.println("subAccountYN  "+subAccountYN);
			/*if(request.getParameter("branchYN").equalsIgnoreCase("Y")){
				prdAcNumberConfig.setBranchYN(true);
			}else{
				prdAcNumberConfig.setBranchYN(false);
			}*/
			
			if(request.getParameter("branchRank")!=null)
			prdAcNumberConfig.setBranchRank(Integer.parseInt(request.getParameter("branchRank")));
			
			if(request.getParameter("branchLen")!=null)
			prdAcNumberConfig.setBranchLen(Integer.parseInt(request.getParameter("branchLen")));
			
			/*if(null!=request.getParameter("currencyYN") && 
					request.getParameter("currencyYN").equalsIgnoreCase("Y")){
				prdAcNumberConfig.setCurrencyYN(true);
			}else{
				prdAcNumberConfig.setCurrencyYN(false);
			}*/
			
			if(request.getParameter("currencyRank")!=null)
			prdAcNumberConfig.setCurrencyRank(Integer.parseInt(request.getParameter("currencyRank")));
			
			if(request.getParameter("currencyLen")!=null)
			prdAcNumberConfig.setCurrencyLen(Integer.parseInt(request.getParameter("currencyLen")));
			
			/*if(null!=request.getParameter("productYN") && 
					request.getParameter("productYN").equalsIgnoreCase("Y")){
				prdAcNumberConfig.setProductYN(true);
			}else{
				prdAcNumberConfig.setProductYN(false);
			}*/
			if(request.getParameter("productRank")!=null)
			prdAcNumberConfig.setProductRank(Integer.parseInt(request.getParameter("productRank")));
			
			if(request.getParameter("productLen")!=null)
			prdAcNumberConfig.setProductLen(Integer.parseInt(request.getParameter("productLen")));
			
			/*if(null!=request.getParameter("customerYN") && 
					request.getParameter("customerYN").equalsIgnoreCase("Y")){
				prdAcNumberConfig.setCustomerYN(true);
			}else{
				prdAcNumberConfig.setCustomerYN(false);
			}*/
			
			if(request.getParameter("customerRank")!=null)
			prdAcNumberConfig.setCustomerRank(Integer.parseInt(request.getParameter("customerRank")));
			
			if(request.getParameter("customerLen")!=null)
			prdAcNumberConfig.setCustomerLen(Integer.parseInt(request.getParameter("customerLen")));
			
			
			/*if(null!=request.getParameter("accountYN") && 
					request.getParameter("accountYN").equalsIgnoreCase("Y")){
				prdAcNumberConfig.setAccountYN(true);
			}else{
				prdAcNumberConfig.setAccountYN(false);
			}*/
			
			if(request.getParameter("accountRank")!=null)
			prdAcNumberConfig.setAccountRank(Integer.parseInt(request.getParameter("accountRank")));
			
			if(request.getParameter("accountLen")!=null)
			prdAcNumberConfig.setAccountLen(Integer.parseInt(request.getParameter("accountLen")));
			
			String effFrom="";
			String effTill="";
			/*if(null!=request.getParameter("subAccountYN") && 
					request.getParameter("subAccountYN").equalsIgnoreCase("Y")){
				prdAcNumberConfig.setSubAccountYN(true);
			}else{
				prdAcNumberConfig.setSubAccountYN(false);
			}*/
			
			if(request.getParameter("subAccountRank")!=null)
			prdAcNumberConfig.setSubAccountRank(Integer.parseInt(request.getParameter("subAccountRank")));
			
			if(request.getParameter("subAccountLen")!=null)
			prdAcNumberConfig.setSubAccountLen(Integer.parseInt(request.getParameter("subAccountLen")));
			
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			
			if (!request.getParameter("effFromDate").isEmpty()
					&& request.getParameter("effFromDate") != null
					&& request.getParameter("effFromDate") != "") {
				try {
					 effFrom = (String) request.getParameter("effFromDate");
					System.out.println("value of from date>>>>" + effFrom);
					Date date = new SimpleDateFormat("yyyy-MM-dd")
							.parse(effFrom);
					String fromdate1 = new SimpleDateFormat("yyyy-MM-dd")
							.format(date);
					prdAcNumberConfig.setEffFromDate((Date) sd.parse(fromdate1));
				} catch (Exception e) {
					System.out.println("error while parsing fromDate " + e);
					logger.error("error while parsing fromDate", e);
					e.printStackTrace();
				}
			}
			if (!request.getParameter("effTillDate").isEmpty()
					&& request.getParameter("effTillDate") != null
					&& request.getParameter("effTillDate") != "") {
				try {
					 effTill = (String) request.getParameter("effTillDate");
					Date date = new SimpleDateFormat("yyyy-MM-dd")
							.parse(effTill);
					String toDate1 = new SimpleDateFormat("yyyy-MM-dd")
							.format(date);
					System.out.println("value of toDate>>>>" + effTill);
					prdAcNumberConfig.setEffTillDate((Date) sd
							.parse(toDate1));
				}

				catch (Exception e) {
					System.out.println("error while parsing toDate " + e);
					logger.error("error while parsing toDate", e);
					e.printStackTrace();
				}
			}
			else {
				try {
					 effTill = "2099-12-31";
					Date date = new SimpleDateFormat("yyyy-MM-dd")
							.parse(effTill);
					String toDate1 = new SimpleDateFormat("yyyy-MM-dd")
							.format(date);
					System.out.println("value of toDate>>>>" + effTill);
					prdAcNumberConfig.setEffTillDate((Date) sd
							.parse(toDate1));
				}

				catch (Exception e) {
					System.out.println("error while parsing toDate " + e);
					logger.error("error while parsing toDate", e);
					e.printStackTrace();
				}
			}
			
			
			prdAcNumberConfig.setSepr(request.getParameter("sepr"));
			
			return prdAcNumberConfig;
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return prdAcNumberConfig;
	}
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;		
	}
}
