/**
 * 
 */
package com.infrasofttech.omning.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.domain.entities.ModuleMst;
import com.infrasofttech.omning.services.BranchMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author mahesh.laddha
 * @param <BranchMst>
 *
 */
public class BranchAddSaveAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(BranchListAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String branchCode="";
	private String loginId="";
	
	private String errMsg = "";
	
	BranchMst branch = new BranchMst();
	
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

				// Action logic here...
				branch = (BranchMst)request.getAttribute("branch");
				
				branch = setValuesToBranchMst(branch);
				branch.setTenantId(tenantId);
				BranchMstService branchMstService = (BranchMstService) SpringUtil.getSpringUtil().getService("branchMstService");

				branchMstService.saveOrUpdate(branch);
				
				retVal = OmniConstants.SUCCESS;
			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			
		}
		return retVal;
	}

	private BranchMst setValuesToBranchMst(BranchMst branch){
		branch.setBranchCode(request.getParameter("branchCode"));
		branch.setBranchRefCode(request.getParameter("branchRefCode"));
		branch.setBranchName(request.getParameter("branchName"));
		branch.setBranchTypeCode(request.getParameter("branchType"));
		branch.setAddress1(request.getParameter("address1"));
		branch.setAddress2(request.getParameter("address2"));
		branch.setAddress3(request.getParameter("address3"));
		branch.setVillageCode(request.getParameter("village"));
		branch.setDistrictCode(request.getParameter("district"));
		branch.setStateCode(request.getParameter("state"));
		branch.setCountryCode(request.getParameter("country"));
		branch.setPostalCode(request.getParameter("postalCode"));
		branch.setContactPerson(request.getParameter("contactPerson"));
		branch.setEmailId(request.getParameter("emailId"));
		branch.setTele1(request.getParameter("tele1"));
		branch.setTele2(request.getParameter("tele2"));
		branch.setFaxNumber(request.getParameter("faxNumber"));
		branch.setBranchDayFromCode(request.getParameter("fromDay"));
		branch.setBranchDayToCode(request.getParameter("toDay"));
		branch.setBranchFromTime(request.getParameter("branchFromTime"));
		branch.setBranchToTime(request.getParameter("branchToTime"));
		branch.setFinYearFromCode(request.getParameter("finMonthStart"));
		branch.setFinYearToCode(request.getParameter("finMonthEnd"));
		branch.setWeeklyHalfOff1Code(request.getParameter("weeklyOff1"));
		branch.setWeeklyHalfOff2Code(request.getParameter("weeklyOff2"));
		branch.setWeeklyOff1Code(request.getParameter("halfOff1"));
		branch.setWeeklyOff2Code(request.getParameter("halfOff2"));
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		Date createdDate = cal.getTime();
		ModuleMst moduleMst = new ModuleMst();
		branch.setCreatedDate(createdDate);
		branch.setCreatedBy(loginId);
		branch.setBaseCurrency("INR");
		branch.setAuthStatus(OmniConstants.AUTH_AUTHORIZED);
		List<ModuleMst> modules = new ArrayList<ModuleMst>();
		String[] mods = (String[]) request.getParameterValues("moduleList");
		if(mods!=null){
			int i=0;
			for(;i<mods.length; i++){
				 moduleMst = new ModuleMst();
				moduleMst.setTenantId(tenantId);
				moduleMst.setCreatedBy(loginId);
				moduleMst.setCreatedDate(null);
				moduleMst.setIsActive(false);
				moduleMst.setModuleCode(mods[i]);
				modules.add(moduleMst);
			}
			branch.setModules(modules);
		}else{
			errMsg ="Error: Assign Atleast One Module!";
			retVal = OmniConstants.INPUT;
		}

		String[] nwhf;
		String nonWorkHalfOff="";
		nwhf = request.getParameterValues("nwhf");
		if(nwhf!=null){
			for(int m=0; m < nwhf.length; m++){
				if(m < (nwhf.length-1) ){
					nonWorkHalfOff = nonWorkHalfOff + nwhf[m] + ",";
				}else{
					nonWorkHalfOff = nonWorkHalfOff + nwhf[m];
				}
			}
		}
		
		branch.setNonWorkingHalfOffs(nonWorkHalfOff);
		
		return branch;
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

	public BranchMst getBranch() {
		return branch;
	}

	public void setBranch(BranchMst branch) {
		this.branch = branch;
	}
}
