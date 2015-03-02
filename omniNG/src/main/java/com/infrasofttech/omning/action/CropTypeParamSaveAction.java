package com.infrasofttech.omning.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.CropTypeParam;
import com.infrasofttech.domain.entities.GLMst;
import com.infrasofttech.domain.entities.ProductMst;
import com.infrasofttech.domain.entities.UserMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.CropTypeParamService;
import com.infrasofttech.omning.services.GLMstService;
import com.infrasofttech.omning.services.ProductMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CropTypeParamSaveAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(CropTypeParamSaveAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String branchCode="";
	private String loginId="";
	private String languageCode="";
	private String errMsg = "";
	private String mode="";
	
	CropTypeParam cropTypeParam= new CropTypeParam();
	
	public String execute() throws Exception {
		System.out.println("execute");
		try{
			if (request.getSession(false) == null)
			{ 
				System.out.println("CropTypeParamSaveAction.execute() SESSION EXPIRED");
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
				cropTypeParam = (CropTypeParam)request.getAttribute("cropTypeParam");
				
				if(null==cropTypeParam){
					cropTypeParam= new CropTypeParam();
					System.out.println("cropTypeParam null");
				}
				
				cropTypeParam = setValuesTocropTypeParam(cropTypeParam);
				cropTypeParam.setTenantId(tenantId);

				CropTypeParamService cropTypeParamService = (CropTypeParamService) SpringUtil.getSpringUtil().getService("cropTypeParamService");

				cropTypeParam=cropTypeParamService.saveOrUpdate(cropTypeParam);
				
				retVal = OmniConstants.SUCCESS;
			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			e.printStackTrace();
			retVal = OmniConstants.INPUT;
		}finally{
			
		}
		return retVal;
	}

	private CropTypeParam setValuesTocropTypeParam(CropTypeParam cropTypeParam){
		try{
			
		
			Calendar cal = Calendar.getInstance();
			Date createdDate = cal.getTime();
			Date lastModifiedDate = cal.getTime();
			System.out.println("croptype : "+request.getParameter("cropType"));
			
			cropTypeParam.setCropType(request.getParameter("cropType"));
			

			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

			if (!request.getParameter("fromDate").isEmpty()
					&& request.getParameter("fromDate") != null
					&& request.getParameter("fromDate") != "") {
				String effectiveFrom = (String) request
						.getParameter("fromDate");
				
			
				try {

					Date date = new SimpleDateFormat("yyyy-MM-dd")
							.parse(effectiveFrom);
					String fromdate1 = new SimpleDateFormat("yyyy-MM-dd")
							.format(date);
					cropTypeParam.setFromDate((Date) dateFormat
							.parse(fromdate1));

				} catch (Exception e) {
					logger.error("Exception in CropTypeParam From Date ......");
					System.out.println(e.getMessage());
				}

			}

			if (!request.getParameter("toDate").isEmpty()
					&& request.getParameter("toDate") != null
					&& request.getParameter("toDate") != "") {
				try {

					Date date = new SimpleDateFormat("yyyy-MM-dd")
							.parse((String) request
									.getParameter("toDate"));
					String fromdate1 = new SimpleDateFormat("yyyy-MM-dd")
							.format(date);
					cropTypeParam.setToDate((Date) dateFormat
							.parse(fromdate1));
				} catch (Exception e) {
					System.out.println("error while parsing toDate "
							+ e);
					logger.error("error while parsing toDate", e);
					e.printStackTrace();
				}
			}
			else if(request.getParameter("toDate") != null){
				Calendar date=Calendar.getInstance();
				date.set(2099,11,31);
				Date todayDate=date.getTime();
				cropTypeParam.setToDate(todayDate);
			}
			
			
			
			cropTypeParam.setCurrencyCode(request.getParameter("currencyCode"));
			cropTypeParam.setMonth(request.getParameter("month"));
			cropTypeParam.setYear(Integer.parseInt(request.getParameter("year")));
			cropTypeParam.setAmmount(Double.parseDouble(request.getParameter("amount")));
			
			if(mode.equalsIgnoreCase("CREATE")){
				cropTypeParam.setCreatedDate(createdDate);
				cropTypeParam.setCreatedBy(loginId);
			}else{
				cropTypeParam.setLastModifiedDate(lastModifiedDate);	
				cropTypeParam.setLastModifiedBy(loginId);
			}
			cropTypeParam.setAuthStatus(OmniConstants.AUTH_AUTHORIZED);
			return cropTypeParam;
			
		}catch(OmniNGException e){
			e.printStackTrace();
			errMsg = e.getMessage();
			retVal = OmniConstants.INPUT;
		}
		return cropTypeParam;
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

}
