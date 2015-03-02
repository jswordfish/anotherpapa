/**
 * 
 */
package com.infrasofttech.omning.action;

import java.util.ArrayList;
import java.util.List;

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
public class BranchEnableAction extends ActionSupport implements
		ModelDriven<BranchMst>, ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(BranchEnableAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId = "";
	private String branchCode = "";
	private String loginId = "";
	private String errMsg = "";
	private List<BranchMst>branches=new ArrayList<BranchMst>();

	public String execute() throws Exception {
		try {
			if (request.getSession(false) == null) {
				System.out
						.println("RoleMenuMapAddSaveAction.execute() SESSION EXPIRED");
				// Session expired
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;
				session.invalidate();
				retVal = OmniConstants.LOGIN;
			} else {
				session = request.getSession(false);
				tenantId = (String) session.getAttribute("tenantCode");
				branchCode = (String) session.getAttribute("branchCode");
				loginId = (String) session.getAttribute("loginId");
				BranchMstService branchMstService = (BranchMstService) SpringUtil
						.getSpringUtil().getService("branchMstService");
				long id = Long.parseLong(request.getParameter("id"));
				System.out.println("BranchEnableAction.execute() id>>>>>"+id);
				BranchMst branchMst = (BranchMst) branchMstService.find(id);
				branchMst.setIsActive(true);
				branchMstService.saveOrUpdate(branchMst);
				retVal = OmniConstants.SUCCESS;
			} // END OF ELSE :: SESSION NOT EXPIRE
		} catch (Exception e) {

		} finally {

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
