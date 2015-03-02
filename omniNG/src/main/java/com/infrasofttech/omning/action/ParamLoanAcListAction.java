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

import com.infrasofttech.domain.entities.ParamLoanAc;
import com.infrasofttech.omning.services.ParamsLoanService;
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
public class ParamLoanAcListAction extends ActionSupport implements
		ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(ParamLoanAcListAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId = "";

	private String errMsg = "";

	List<ParamLoanAc> paramLoanAcs = new ArrayList<ParamLoanAc>();

	public String execute() throws Exception {
		try {
			if (request.getSession() == null) {
				System.out.println("SESSION EXPIRED");
				// Session expired
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;
				session.invalidate();
				retVal = OmniConstants.LOGIN;
			} else {
				tenantId = (String) request.getSession().getAttribute(
						"tenantCode");
				session = request.getSession(false);
				// TODO Action logic here...
				ParamsLoanService paramsLoanService = (ParamsLoanService) SpringUtil
						.getSpringUtil().getService("paramsLoanAcService");
				paramLoanAcs = paramsLoanService.findAllByTenant(tenantId);
				System.out.println("paramLoanAcs" + paramLoanAcs.size());
				retVal = OmniConstants.SUCCESS;

				// END OF ELSE :: ACTION LOGIC

			} // END OF ELSE :: SESSION NOT EXPIRE
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return retVal;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

	public List<ParamLoanAc> getParamLoanAcs() {
		return paramLoanAcs;
	}

	public void setParamLoanAcs(List<ParamLoanAc> paramLoanAcs) {
		this.paramLoanAcs = paramLoanAcs;
	}

}
