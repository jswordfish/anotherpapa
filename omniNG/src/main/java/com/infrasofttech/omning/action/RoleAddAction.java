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
import com.infrasofttech.omning.services.RoleMstService;
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
public class RoleAddAction extends ActionSupport implements ModelDriven<RoleMst>, ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(RoleAddAction.class);
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
	
	private RoleMst roleMst = new RoleMst();
	
	public String execute() throws Exception {
		try{
			if (request.getSession(false) == null)
			{ 
				System.out.println("RoleAddAction.execute() SESSION EXPIRED");
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
				
				RoleMstService roleMstService = (RoleMstService) SpringUtil.getSpringUtil().getService("roleMstService");
				
				if(request.getParameter("id") != null){
					try{
					long id = Long.parseLong(request.getParameter("id"));
					roleMst = (RoleMst) roleMstService.find(id);
					}
					catch(NumberFormatException e){
						//add mode	
					}
				}
				String mode=request.getParameter("mode");
				request.setAttribute("role", roleMst);
				request.setAttribute("mode", mode);

				// Forward action		
				retVal = OmniConstants.SUCCESS;
			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			
		}
		return retVal;
	}
	
	


	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}




	public RoleMst getModel() {
		// TODO Auto-generated method stub
		return roleMst;
	}

	
}
