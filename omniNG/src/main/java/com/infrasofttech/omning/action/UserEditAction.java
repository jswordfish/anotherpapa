package com.infrasofttech.omning.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.domain.entities.RoleMst;
import com.infrasofttech.domain.entities.UserMst;
import com.infrasofttech.omning.services.BranchMstService;
import com.infrasofttech.omning.services.LookupValueService;
import com.infrasofttech.omning.services.RoleMstService;
import com.infrasofttech.omning.services.UserMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserEditAction extends ActionSupport implements ServletRequestAware {

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
	
	// Salutation drop down :: Map<lookupValueCode, lookupDisplayValue>
	private Map<String, String> salutations = new HashMap<String, String>();

	// Branch list ::  Map<BrCode, brName>
	private List<BranchMst> branchList = new ArrayList<BranchMst>();
	private Map<String, String> branches = new HashMap<String, String>();
	
	// User type list :: Map<lookupValueCode, lookupDisplayValue>
	private Map<String, String> userTypes = new HashMap<String, String>();
	
	private UserMst userMst = new UserMst();
	
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
				languageCode = (String) session.getAttribute("languageCode");
				
				if(languageCode==null || languageCode.length()==0){languageCode="en";}
				
				String userLoginId = request.getParameter("loginId");

				UserMstService userMstService = (UserMstService) SpringUtil.getSpringUtil().getService("userMstService");
				UserMst entity = userMstService.getUserBasedOnLogin(tenantId, userLoginId);
				
				RoleMstService roleMstService = (RoleMstService)SpringUtil.getSpringUtil().getService("roleMstService");
				List<RoleMst> roles = roleMstService.findAllByTenant(tenantId);
				//userMst = initializeUserObject(entity);
				initializeUserObject(entity);
				request.setAttribute("user", entity);
				request.setAttribute("edit", true);
				request.setAttribute("roles", roles);
				retVal = OmniConstants.SUCCESS;
			}  
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			
		}
		return retVal;
	}
	
	@SuppressWarnings("unchecked")
	private void initializeUserObject(UserMst entity){
		userMst = entity;
		//--------X
		
//		userMst.setLoginId(entity.getLoginId());
//		userMst.setPermissionNo(entity.getPermissionNo());
//		userMst.setUserFName(entity.getUserFName());
//		userMst.setUserMName(entity.getUserMName());
//		userMst.setUserLName(entity.getUserLName());
//		userMst.setEmailId(entity.getEmailId());
//		userMst.setUserDisplayName(entity.getUserDisplayName());
		
		// Cache Salutation values from lookup
		LookupValueService obj = (LookupValueService)SpringUtil.getSpringUtil().getService("lookupValueService");
		salutations = obj.getLookupValues("SALUTATION", languageCode, tenantId);
		userTypes = obj.getLookupValues("USERTYPE", languageCode, tenantId);

		request.setAttribute("salutations", salutations);
		request.setAttribute("userTypes", userTypes);
		
		// Load all branches of the tenant
		BranchMstService branchMstService = (BranchMstService) SpringUtil.getSpringUtil().getService("branchMstService");
		branchList = branchMstService.findAllByTenant(tenantId);
		for(BranchMst branchMst : branchList){
			branches.put(branchMst.getBranchCode(),  branchMst.getBranchName());
		}
		request.setAttribute("branches", branches);
		
		
	}
	
	private Map<String, String>  loadFromLookup(String code, String languageCode){
		Map<String, String> lookupValues = new HashMap<String, String>();
		//TODO fetch from lookup cache and convert to Map<String, String>
		lookupValues.put("TEST1", "Testing 1");
		lookupValues.put("TEST2", "Testing 2");
		lookupValues.put("TEST3", "Testing 3");
		lookupValues.put("TEST4", "Testing 4");
		
		return lookupValues;
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

	public Map<String, String> getBranches() {
		return branches;
	}

	public void setBranches(Map<String, String> branches) {
		this.branches = branches;
	}

	public Map<String, String> getSalutations() {
		return salutations;
	}

	public void setSalutations(Map<String, String> salutations) {
		this.salutations = salutations;
	}

	public Map<String, String> getUserTypes() {
		return userTypes;
	}

	public void setUserTypes(Map<String, String> userTypes) {
		this.userTypes = userTypes;
	}

//	public UserMst getModel() {
//		System.out.println("1");
//		return userMst;
//}

	
}
