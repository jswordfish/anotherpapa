package com.infrasofttech.omning.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.MenuMst;
import com.infrasofttech.omning.services.MenuMstService;
import com.infrasofttech.omning.utils.ErrorCodes;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AuthMenuMapCRUDAction extends ActionSupport implements  ServletRequestAware { 

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(AuthMenuMapCRUDAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";	
	private String errMsg = "";
	
	List<MenuMst> menuz = new ArrayList<MenuMst>();
	
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
				System.out.println("AuthMenuMapCRUDAction.execute()");
				// Action logic here...
				MenuMstService menuMstService = (MenuMstService) SpringUtil.getSpringUtil().getService("menuMstService");
				menuz = menuMstService.getMenuMstByTenantNMKRCKR(tenantId);
				Iterator  it = menuz.iterator();
				MenuMst menuMst = new MenuMst();
				while(it.hasNext()){
					menuMst = (MenuMst)it.next();
					System.out.println("authCode:::::" + menuMst.getAuthMode().getCode());
					}
				request.setAttribute("menuz", menuz);
				retVal = OmniConstants.SUCCESS;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			
		}
		return retVal;
	}
		
	public List<MenuMst> getMenuz() {
		return menuz;
	}

	public void setMenuz(List<MenuMst> menuz) {
		this.menuz = menuz;
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