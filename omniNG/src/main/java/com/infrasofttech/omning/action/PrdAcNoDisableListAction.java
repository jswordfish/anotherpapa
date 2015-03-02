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
import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.utils.ErrorCodes;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PrdAcNoDisableListAction extends ActionSupport implements  ServletRequestAware { 

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(PrdAcNoDisableListAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	
	private String errMsg = "";
	private String branchCode="";
	
	List<PrdAcNoMst> prdAcz = new ArrayList<PrdAcNoMst>();
	
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
				branchCode=(String)request.getSession().getAttribute("branchCode");

				// Action logic here...
				PrdAcNoMstService prdAcNoService = 
						(PrdAcNoMstService) SpringUtil.getSpringUtil().getService("prdAcNoMstService");
				prdAcz = prdAcNoService.getDisabledPrdAcNo(tenantId, branchCode);
				
				retVal = OmniConstants.SUCCESS;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			
		}
		return retVal;
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

	public List<PrdAcNoMst> getPrdAcz() {
		return prdAcz;
	}

	public void setPrdAcz(List<PrdAcNoMst> prdAcz) {
		this.prdAcz = prdAcz;
	}

}
