/**
 * 
 */
package com.infrasofttech.omning.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.UserBranchMap;
import com.infrasofttech.domain.entities.UserBranch_RoleMap;
import com.infrasofttech.domain.entities.UserMst;
import com.infrasofttech.omning.services.UserBranchMapService;
import com.infrasofttech.omning.services.UserMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserSaveAction extends ActionSupport implements ModelDriven<UserMst>, ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(UserSaveAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String branchCode="";
	private String loginId="";
	private String errMsg = "";
	
	UserMst userMst;
	
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
				session = request.getSession();
				tenantId = (String) session.getAttribute("tenantCode");
				branchCode = (String) session.getAttribute("branchCode");
				loginId = (String) session.getAttribute("loginId");
				
				String languageCode = (String) session.getAttribute("languageCode");
				UserMst entity = getUserMstObject();
				
				UserMstService userMstService = (UserMstService) SpringUtil.getSpringUtil().getService("userMstService");
				

				userMstService.saveOrUpdate(entity);
						
				retVal = OmniConstants.SUCCESS;

			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			
		}
		
		return retVal;
	}
	
	public UserMst getModel() {
		return userMst;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

	private UserMst getUserMstObject(){
		UserMst entity = new UserMst();
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		Date createdDate = cal.getTime();
		
		entity.setLoginId(request.getParameter("loginId"));
		entity.setUserCode(request.getParameter("loginId"));
		entity.setTenantId(tenantId);
		entity.setPermissionNo(request.getParameter("permissionNo"));
		entity.setUserSalutation(request.getParameterValues("userSalutation")[0].toString());
		entity.setUserFName(request.getParameter("userFName"));
		entity.setUserMName(request.getParameter("userMName"));
		entity.setUserLName(request.getParameter("userLName"));
		entity.setUserTypeCode(request.getParameterValues("userType")[0].toString());
		entity.setEmailId(request.getParameter("emailId"));
		entity.setUserDisplayName(request.getParameter("userDisplayName"));
		entity.setCreatedBy(loginId);
		entity.setCreatedDate(createdDate);
		
		
		String roleCode = request.getParameter("roleCode");
		entity.setRoleCode(roleCode);

		System.out.println("DISPLAY==================================================");
		List<UserBranchMap> userBranchMapz = new ArrayList<UserBranchMap>();
		String[] branchCodes = request.getParameterValues("userBranchMap");
		Integer i=0;
		UserBranchMapService userBranchMapService = (UserBranchMapService) SpringUtil.getSpringUtil().getService("userBranchMapService");
		
		while(i < branchCodes.length){
			System.out.println("Branches:"+ branchCodes[i]);
			UserBranchMap userBranchMap = new UserBranchMap();
			userBranchMap.setBranchCode(branchCodes[i]);
			userBranchMap.setLoginId(request.getParameter("loginId"));
			userBranchMap.setTenantId(tenantId);
			userBranchMap.setIsActive(true);
			userBranchMap.setCreatedBy(loginId);
			userBranchMap.setCreatedDate(createdDate);
			
			UserBranch_RoleMap userBranch_RoleMap = new UserBranch_RoleMap();
			userBranch_RoleMap.setTenantId(tenantId);
			userBranch_RoleMap.setRoleCode(roleCode);
			
			userBranch_RoleMap.setIsActive(true);
			
			//userBranch_RoleMap = (UserBranch_RoleMap) userBranchMapService.saveOrUpdate(userBranch_RoleMap);
			Collection<UserBranch_RoleMap> rolemaps = new ArrayList<UserBranch_RoleMap>();
			rolemaps.add(userBranch_RoleMap);
			userBranch_RoleMap.setUserBranchMap(userBranchMap);
			userBranchMap.setUserBranch_RoleMaps(rolemaps);
			
			userBranchMapz.add(userBranchMap);
			i++;
		}
	
		entity.setUserBranchMaps(userBranchMapz);
	    
		
		
		
		
		return entity;
	}	
}
