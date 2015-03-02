package com.infrasofttech.omning.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.RoleMst;
import com.infrasofttech.omning.services.RoleMstService;
import com.infrasofttech.omning.services.UserMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class RoleAddSaveAction extends ActionSupport implements ModelDriven<RoleMst>, ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(RoleAddSaveAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String branchCode="";
	private String loginId="";
	
	private String errMsg = "";
	
	RoleMst roleMst;
	
	public String execute() throws Exception {
		try{
			if (request.getSession(false) == null)
			{ 
				System.out.println("RoleAddSaveAction.execute() SESSION EXPIRED");
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
				
				String languageCode = (String) session.getAttribute("languageCode");
				
				RoleMst entity = getRoleMstObject();
				
				if(entity == null){
					retVal = OmniConstants.INPUT;
				}
				else{
					RoleMstService roleMstService = (RoleMstService) SpringUtil.getSpringUtil().getService("roleMstService");

					entity = roleMstService.saveOrUpdate(entity);
					
					session.setAttribute("role", entity);
							
					retVal = OmniConstants.SUCCESS;
				}
				
				

			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			
		}
		
		return retVal;
	}
	
	public RoleMst getModel() {
		return roleMst;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

	private RoleMst getRoleMstObject(){
		RoleMst entity = new RoleMst();
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		Date createdDate = cal.getTime();
		
		entity.setRoleCode(request.getParameter("roleCode"));
		entity.setRoleName(request.getParameter("roleName"));
		
		if(request.getParameter("roleCode") == null || request.getParameter("roleName") == null){
			return null;
		}
		entity.setTenantId(tenantId);
		entity.setCreatedBy(loginId);
		entity.setCreatedDate(createdDate);

		
		return entity;
	}	
}
