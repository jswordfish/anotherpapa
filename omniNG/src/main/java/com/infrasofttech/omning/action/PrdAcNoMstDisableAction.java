package com.infrasofttech.omning.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.PrdAcNoMst;
import com.infrasofttech.omning.services.PrdAcNoMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PrdAcNoMstDisableAction extends ActionSupport implements  ServletRequestAware {
	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(UserListAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	
	private String errMsg = "";
	
	
	
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
				System.out.println("session expired>>>>>>>>>>>>>");
				retVal =  OmniConstants.LOGIN;	  
			} else {
				tenantId = (String)request.getSession().getAttribute("tenantCode");
				String accountNumber=request.getParameter("accountNumber");
				String branchCode=request.getParameter("branchCode");
				String moduleCode=request.getParameter("moduleCode");
				String productCode=request.getParameter("productCode");
				String customerNumber=request.getParameter("customerNumber");
				System.out.println("else block>>>>>>>>>>>>>");
                PrdAcNoMst prdAcNoMst=new PrdAcNoMst();
				// Action logic here...
				PrdAcNoMstService prdAcNoService = 
						(PrdAcNoMstService) SpringUtil.getSpringUtil().getService("prdAcNoMstService");
				prdAcNoMst = (PrdAcNoMst) prdAcNoService.disablePrdAcNo(tenantId, branchCode, moduleCode, productCode, customerNumber,accountNumber);
				
				System.out.println("size of prdacnomst"+prdAcNoMst.getIsActive());
				
				retVal = OmniConstants.SUCCESS;
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("CATCH BLOCK>>>>>>>>"+e.getMessage());
		}finally{
			
		}
		return retVal;
	}
	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

	
	
}
