/**
 * 
 */
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
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * @author mahesh.laddha
 *
 */
public class UserAddAction extends ActionSupport implements ModelDriven<UserMst>, ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(UserAddAction.class);
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
				
				userMst = initializeUserObject(userMst);
				request.setAttribute("user", userMst);
				
				
				RoleMstService roleMstService = (RoleMstService)SpringUtil.getSpringUtil().getService("roleMstService");
				List<RoleMst> roles = roleMstService.findAllByTenant(tenantId);
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
	private UserMst initializeUserObject(UserMst userMst){
		
		userMst.setLoginId("test login");
		userMst.setPermissionNo("test permisison");
		request.setAttribute("permissionno", userMst.getPermissionNo());
		userMst.setUserFName("");
		userMst.setUserMName("");
		userMst.setUserLName("");
		userMst.setEmailId("");
		userMst.setUserDisplayName("");
		
		LookupValueService obj = (LookupValueService)SpringUtil.getSpringUtil().getService("lookupValueService");
		salutations = obj.getLookupValues("SALUTATION", languageCode, tenantId);
		userTypes = obj.getLookupValues("USERTYPE", languageCode, tenantId);

		// Cache Salutation values from lookup
		request.setAttribute("salutations", salutations);
		request.setAttribute("userTypes", userTypes);
		
		// Load all branches of the tenant
		BranchMstService branchMstService = (BranchMstService) SpringUtil.getSpringUtil().getService("branchMstService");
		branchList = branchMstService.findAllByTenant(tenantId);
		for(BranchMst branchMst : branchList){
			branches.put(branchMst.getBranchCode(),  branchMst.getBranchName());
		}
		request.setAttribute("branches", branches);
		return userMst;
	}
	
	private Map<String, String>  loadFromLookup(String code, String languageCode){
		Map<String, String> lookupValues = new HashMap<String, String>();
		//TODO fetch from lookup cache and convert to Map<String, String>
		lookupValues.put("Mr.", "Mr.");
		lookupValues.put("Ms.", "Ms.");
		lookupValues.put("Dr.", "Dr.");
		lookupValues.put("Miss", "Miss");
		
		return lookupValues;
	}

	public UserMst getModel() {
		return userMst;
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

	public UserMst getUserMst() {
		return userMst;
	}

	public void setUserMst(UserMst userMst) {
		this.userMst = userMst;
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
	
}
