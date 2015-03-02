package com.infrasofttech.omning.action;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.domain.entities.RoleMenuActionAccess;
import com.infrasofttech.domain.entities.RoleMst;
import com.infrasofttech.domain.entities.UserMst;
import com.infrasofttech.omning.services.BranchMstService;
import com.infrasofttech.omning.services.RoleMenuActionAccessService;
import com.infrasofttech.omning.services.RoleMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.MENUACTIONSTATUS;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AddMenuToRoleAction extends ActionSupport implements  ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(BranchListAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String branchCode="";
	private String loginId="";
	private String languageCode="";
	
	private String errMsg = "";
	
	
	public String execute() throws Exception {
		try{
			if (request.getSession(false) == null)
			{ 
				System.out.println("AddMenuToRoleAction.execute() SESSION EXPIRED");
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
				
				if(languageCode==null || languageCode.length()==0){languageCode="en";}
				
				RoleMst roleMst = (RoleMst) request.getSession().getAttribute("role");
				
				
				Integer numOfMenus = (Integer) request.getSession().getAttribute("numOfMenus");
				RoleMenuActionAccessService roleMenuActionAccessService = (RoleMenuActionAccessService) SpringUtil.getSpringUtil().getService("roleMenuActionAccessService");
				
				for(int i = 0;i<numOfMenus;i++){
					String sels[] = request.getParameterValues("menu"+i);
					String selections[] = new String[0];
					if(sels == null){
						sels = selections;
						
						String menuCode = request.getParameter("menuCode"+i);
						RoleMenuActionAccess roleMenuActionAccess = new RoleMenuActionAccess();
						roleMenuActionAccess.setTenantId(tenantId);	
						
						
						roleMenuActionAccess.setCreateAction(MENUACTIONSTATUS.INACTIVE);
						roleMenuActionAccess.setUpdateAction(MENUACTIONSTATUS.INACTIVE);
						roleMenuActionAccess.setSearchAction(MENUACTIONSTATUS.INACTIVE);
						roleMenuActionAccess.setDeleteAction(MENUACTIONSTATUS.INACTIVE);
						roleMenuActionAccess.setViewAction(MENUACTIONSTATUS.INACTIVE);
						roleMenuActionAccess.setDisableAction(MENUACTIONSTATUS.INACTIVE);
						roleMenuActionAccess.setEnableAction(MENUACTIONSTATUS.INACTIVE);
												
						
						roleMenuActionAccess.setRoleMstCode(roleMst.getRoleCode());
						roleMenuActionAccess.setMenuCode(menuCode);
						roleMenuActionAccess = roleMenuActionAccessService.saveOrUpdate(roleMenuActionAccess);
						continue;
					}
					
					String menuCode = request.getParameter("menuCode"+i);
					RoleMenuActionAccess roleMenuActionAccess = new RoleMenuActionAccess();
					roleMenuActionAccess.setTenantId(tenantId);
					for(String selection: sels){
						Method method = RoleMenuActionAccess.class.getMethod("set"+selection, MENUACTIONSTATUS.class);
						MENUACTIONSTATUS menuactionstatus = MENUACTIONSTATUS.ACTIVE;
						method.invoke(roleMenuActionAccess, menuactionstatus);
					}
					roleMenuActionAccess.setRoleMstCode(roleMst.getRoleCode());
					roleMenuActionAccess.setMenuCode(menuCode);
					roleMenuActionAccess = roleMenuActionAccessService.saveOrUpdate(roleMenuActionAccess);
				}
				
				
				retVal = OmniConstants.SUCCESS;
			}  
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			
		}
		return retVal;
	}


	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		request = arg0;
	}
	
	

	
}
