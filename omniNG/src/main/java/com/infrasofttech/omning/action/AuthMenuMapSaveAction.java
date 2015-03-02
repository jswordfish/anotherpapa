package com.infrasofttech.omning.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import java.lang.reflect.Method;






import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.infrasofttech.omning.services.MenuMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.AUTHMODE;
import com.infrasofttech.utils.MENUACTIONSTATUS;
import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.infrasofttech.domain.entities.AppConfig;
import com.infrasofttech.domain.entities.MenuMst;
import com.infrasofttech.domain.entities.RoleMenuActionAccess;

public class AuthMenuMapSaveAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(AuthMenuMapSaveAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String branchCode="";
	private String loginId="";
	private String languageCode="";
	private String errMsg = "";
	private String mode="";
	
	MenuMst menuMst = new MenuMst();
	List<MenuMst> menuz = new ArrayList<MenuMst>();
	
	public String execute() throws Exception {
		try{
			if (request.getSession(false) == null)
			{ 
				System.out.println("AuthMenuMapSaveAction.execute() SESSION EXPIRED");
				//Session expired 
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;	
				session.invalidate(); 
				retVal =  OmniConstants.LOGIN;	  
			} else {
				System.out.println("AuthMenuMapSaveAction.execute()");
				session = request.getSession();
				tenantId = (String) session.getAttribute("tenantCode");
				branchCode = (String) session.getAttribute("branchCode");
				loginId = (String) session.getAttribute("loginId");
				languageCode = (String) session.getAttribute("languageCode");
				mode = (String)request.getParameter("mode");
				
				
			
				
				MenuMstService menuMstService = (MenuMstService)SpringUtil.getSpringUtil().getService("menuMstService");
		
								
				Integer menuSize = (Integer) request.getSession().getAttribute("menuSize");
				
				
				
				

				for(int j = 0;j<menuSize;j++){
					String sels[] = request.getParameterValues("authMode"+j);
					String selections[] = new String[0];
					
					if(sels == null){
						sels = selections;
												
						
						continue;
				}
					String menuCode = request.getParameter("menuCode"+j);
					menuz = menuMstService.getMenuMstByTenantNMKRCKR(tenantId);
					Iterator  it = menuz.iterator();
					menuMst = new MenuMst();
					while(it.hasNext()){
					MenuMst	menuMst1 = (MenuMst)it.next();
						if(menuMst1.getMenuCode().equals(menuCode)){
							menuMst = menuMst1;
						}
					}
					
					menuMst.setTenantId(tenantId);
					for(String selection: sels){
						
						String authMode1= "AuthMode";
						 Method method = MenuMst.class.getMethod("set"+authMode1, AUTHMODE.class);
						
						AUTHMODE authMode= AUTHMODE.SELF;
					if(selection.equalsIgnoreCase(AUTHMODE.SELF.getCode()))
						 authMode = AUTHMODE.SELF;
						 
					
					
					if(selection.equalsIgnoreCase(AUTHMODE.MKRCKR.getCode()))
						 authMode = AUTHMODE.MKRCKR;
					
						method.invoke(menuMst, authMode);
					
						
					}			
					
					
					menuMst.setMenuCode(menuCode);
					menuMst = (MenuMst) menuMstService.saveOrUpdate(menuMst);
				
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
