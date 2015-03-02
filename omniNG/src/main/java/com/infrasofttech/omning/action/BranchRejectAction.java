/**
 * 
 */
package com.infrasofttech.omning.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.omning.services.BranchMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * @author mahesh.laddha
 *
 */
public class BranchRejectAction extends ActionSupport implements ModelDriven<BranchMst>, ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(BranchListAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String branchCode="";
	private String loginId="";
	
	private String vTokenReq = "";
	private String vTokenSession = "";
	private String errMsg = "";
	
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
				session = request.getSession(false);
				tenantId = (String) session.getAttribute("tenantId");
				branchCode = (String) session.getAttribute("branchCode");
				loginId = (String) session.getAttribute("loginId");

				vTokenSession = (String) session.getAttribute("vToken");
				vTokenReq = (String)request.getParameter("vToken");
				if(vTokenReq == null || vTokenSession == null){
					errMsg=ErrorCodes.SESSIONEXPIRE;
					session.invalidate();
					retVal = OmniConstants.LOGIN;
				}else{
					if(!vTokenReq.equals(vTokenSession)){ 
						// Both tokens are NOT matching. Logout!!!
						session.invalidate();
						errMsg = ErrorCodes.INVALIDLOGIN;
						retVal = OmniConstants.LOGIN;
					}else{
						//TODO Service reference here...
						// <BranchMst> obj =(<BranchMst>) SpringUtil.getSpringUtil().getService("...");
						
						// TODO Action logic here...
						BranchMstService service = (BranchMstService) SpringUtil.getSpringUtil().getService("branchMstService");
						long id = Long.parseLong(request.getParameter("id"));
						BranchMst dom = (BranchMst) service.find(id);
						dom.setIsActive(true);
						service.saveOrUpdate(dom);
						
						
						
					} // END OF ELSE :: ACTION LOGIC
				} // END OF ELSE :: NOT NULL TOKEN
			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			
		}finally{
			
		}
		return retVal;
	}
	
	public BranchMst getModel() {
		// TODO Auto-generated method stub
		return null;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		
	}

	
}
