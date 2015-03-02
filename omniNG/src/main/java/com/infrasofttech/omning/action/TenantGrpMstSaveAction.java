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

import com.infrasofttech.domain.entities.ParamCheckingAc;
import com.infrasofttech.domain.entities.TenantGrpMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.ParamsCheckingAcService;
import com.infrasofttech.omning.services.TenantGrpMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class TenantGrpMstSaveAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(TenantGrpMstSaveAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String branchCode="";
	private String loginId="";
	private String languageCode="";
	private String errMsg = "";
	private String mode="";
	TenantGrpMst tenantGrpMst=new TenantGrpMst();

	
	public String execute() throws Exception {
		try{
			if (request.getSession(false) == null)
			{ 
				System.out
				.println("TenantGrpMstCRUDAction.execute() SESSION EXPIRED");
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
				tenantGrpMst = (TenantGrpMst)request.getAttribute("tenantGrpMst");
				
				tenantGrpMst = setValuesToTenantGrpMst(tenantGrpMst);

				TenantGrpMstService tenantGrpMstService = (TenantGrpMstService) SpringUtil
						.getSpringUtil().getService("tenantGrpMstService");

				tenantGrpMstService.saveOrUpdate(tenantGrpMst);
				
				retVal = OmniConstants.SUCCESS;
			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			e.printStackTrace();
			retVal = OmniConstants.INPUT;
		}finally{
			
		}
		return retVal;
	}

	private TenantGrpMst setValuesToTenantGrpMst(TenantGrpMst tenantGrpMst){
		try{
			tenantGrpMst.setTenantGrpCode(request.getParameter("tenantGrpCode"));
			tenantGrpMst.setTenantGrpName(request.getParameter("tenantGrpName"));
			
			return tenantGrpMst;
		}catch(OmniNGException e){
			e.printStackTrace();
			errMsg = e.getMessage();
			retVal = OmniConstants.INPUT;
		}
		return tenantGrpMst;
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

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getLanguageCode() {
		return languageCode;
	}

	public void setLanguageCode(String languageCode) {
		this.languageCode = languageCode;
	}

	public TenantGrpMst getTenantGrpMst() {
		return tenantGrpMst;
	}

	public void setTenantGrpMst(TenantGrpMst tenantGrpMst) {
		this.tenantGrpMst = tenantGrpMst;
	}


	

}
