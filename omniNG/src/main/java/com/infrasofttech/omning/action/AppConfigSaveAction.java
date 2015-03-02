package com.infrasofttech.omning.action;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.ProductMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.ProductMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;









import com.infrasofttech.domain.entities.AppConfig;
import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.domain.entities.ModuleMst;
import com.infrasofttech.omning.services.AppConfigService;

public class AppConfigSaveAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(AppConfigSaveAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String branchCode="";
	private String loginId="";
	private String languageCode="";
	private String errMsg = "";
	private String mode="";
	AppConfig appConfig = new AppConfig();
	
	public String execute() throws Exception {
		try{
			if (request.getSession(false) == null)
			{ 
				System.out.println("AppConfigSaveAction.execute() SESSION EXPIRED");
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
				
				AppConfigService appConfigService = (AppConfigService) SpringUtil.getSpringUtil().getService("appConfigService");
		
				appConfig = (AppConfig)request.getAttribute("appConfig");
				appConfig.setTenantId(tenantId);
				appConfig = setValuesToAppConfig(appConfig);
				Long setNo = (long)(Math.random()*10000000);
				appConfig.setSetNo(setNo);
				appConfig.setIsActive(true);
				
				String[] branches = request.getParameterValues("branchCode");
			
				for(int i=0;i<branches.length; i++){
					System.out.println("branches :: "+branches[i]);
					appConfig.setBranchCode(branches[i]);
					appConfigService.saveOrUpdate(appConfig);					
				}
				
				retVal = OmniConstants.SUCCESS;
			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			e.printStackTrace();
			retVal = OmniConstants.INPUT;
		}finally{
			
		}
		return retVal;
	}

	private AppConfig setValuesToAppConfig(AppConfig appConfig){
			try{		

			appConfig.setDateFormatStr(request.getParameter("dateFormat"));
			appConfig.setNumberFormatStr(request.getParameter("numberFormat"));
			appConfig.setDecimalCharacter(request.getParameter("decimalFormat"));
			appConfig.setAmountFormatStr(request.getParameter("amountFormat"));
			appConfig.setDigitSeparator(request.getParameter("digitSeparator"));
			appConfig.setCustomerIdLen(Integer.parseInt(request.getParameter("customerIdLen")));
			appConfig.setCustomerIdLenTypeCode(request.getParameter("customerIdLenTypeCode"));
			appConfig.setCustomerIdGenType(request.getParameter("customerId"));
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

			if (!request.getParameter("effFromDate").isEmpty()
					&& request.getParameter("effFromDate") != null
					&& request.getParameter("effFromDate") != "") {
				String effFromDate = (String) request
						.getParameter("effFromDate");
				// String fromDate = (String) request.getParameter("fromDate");

				try {

					Date date = new SimpleDateFormat("yyyy-MM-dd")
							.parse(effFromDate);
					String fromdate1 = new SimpleDateFormat("yyyy-MM-dd")
							.format(date);
					appConfig.setEffFromDate((Date) dateFormat
							.parse(fromdate1));

				} catch (Exception e) {
					logger.error("Exception in Effect From Date convertion......");
					System.out.println(e.getMessage());
				}

			}

			if (!request.getParameter("effToDate").isEmpty()
					&& request.getParameter("effToDate") != null
					&& request.getParameter("effToDate") != "") {
				try {

					Date date = new SimpleDateFormat("yyyy-MM-dd")
							.parse((String) request
									.getParameter("effToDate"));
					String fromdate1 = new SimpleDateFormat("yyyy-MM-dd")
							.format(date);
					appConfig.setEffToDate((Date) dateFormat
							.parse(fromdate1));
				} catch (Exception e) {
					System.out.println("error while parsing effectTillDate "
							+ e);
					logger.error("error while parsing effectTillDate", e);
					e.printStackTrace();
				}
			}
			else if(request.getParameter("effToDate") != null){
				Calendar date=Calendar.getInstance();
				date.set(2099,11,31);
				Date todayDate=date.getTime();
				appConfig.setEffToDate(todayDate);
			}
			
			
			
			
			
			
		/*	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			 			
				if (!request.getParameter("effFromDate").isEmpty()
						&& request.getParameter("effFromDate") != null
						&& request.getParameter("effFromDate") != "") {
					try {
						String  effFromDate = (String) request.getParameter("effFromDate");
						System.out.println("value of from date>>>>" + effFromDate);
						Date date = new SimpleDateFormat("yyyy-MM-dd")
								.parse(effFromDate);
						String fromdate1 = new SimpleDateFormat("yyyy-MM-dd")
								.format(date);
						appConfig.setEffFromDate((Date) dateFormat
								.parse(fromdate1));
					} catch (Exception e) {
						System.out.println("error  effFromDate " + e);
						logger.error("error  effFromDate", e);
						e.printStackTrace();
					}
				}
				if (!request.getParameter("effToDate").isEmpty()
						&& request.getParameter("effToDate") != null
						&& request.getParameter("effToDate") != "") {
					try {Thu Dec 31 20:18:57 IST 2099
						String  effToDate = (String) request.getParameter("effToDate");
						System.out.println("value of from date>>>>" + effToDate);
						Date date = new SimpleDateFormat("yyyy-MM-dd")
								.parse(effToDate);
						String fromdate1 = new SimpleDateFormat("yyyy-MM-dd")
								.format(date);
						appConfig.setEffToDate((Date) dateFormat
								.parse(fromdate1));
					} catch (Exception e) {
						System.out.println("error  effFromDate " + e);
						logger.error("error  effToDate", e);
						e.printStackTrace();
					}
				}*/
				
			
		
			Calendar cal = Calendar.getInstance();
			Date createdDate = cal.getTime();
			Date lastModifiedDate = cal.getTime();
			if(mode.equalsIgnoreCase("CREATE")){
				appConfig.setCreatedDate(createdDate);
				appConfig.setCreatedBy(loginId);
			}else{
				appConfig.setLastModifiedDate(lastModifiedDate);	
				appConfig.setLastModifiedBy(loginId);
			}
		
			appConfig.setAuthStatus(OmniConstants.AUTH_AUTHORIZED);
			
		
			
			return appConfig;
			
		}catch(OmniNGException e){
			e.printStackTrace();
			errMsg = e.getMessage();
			retVal = OmniConstants.INPUT;
		}
		return appConfig;
	}
	
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public AppConfig getAppConfig() {
		return appConfig;
	}

	public void setAppConfig(AppConfig appConfig) {
		this.appConfig = appConfig;
	}

	
}
