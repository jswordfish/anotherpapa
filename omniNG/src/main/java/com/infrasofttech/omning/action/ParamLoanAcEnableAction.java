package com.infrasofttech.omning.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.ParamLoanAc;
import com.infrasofttech.omning.services.ParamsLoanService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ParamLoanAcEnableAction extends ActionSupport implements
ServletRequestAware{
	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(ParamLoanAcEnableAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId = "";
	private Date effFromDate;
	private String errMsg = "";
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
				String productCode = request.getParameter("productCode");
				String moduleCode = request.getParameter("moduleCode");
				String branchCode1 = request.getParameter("branchCode");
				// TODO Action logic here...
				ParamsLoanService paramsLoanService = (ParamsLoanService) SpringUtil
						.getSpringUtil().getService("paramsLoanAcService");
				System.out.println("tenantId:"+tenantId);
				System.out.println("productCode:"+productCode);
				System.out.println("moduleCode:"+moduleCode);
				System.out.println("branchCode1:"+branchCode1);
				String effectiveFrom=request.getParameter("effectiveFrom");
				if(!request.getParameter("effectiveFrom").isEmpty()
						&& request.getParameter("effectiveFrom") != null
						&& request.getParameter("effectiveFrom") != ""){
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					String effectiveFrom1 = (String) request
							.getParameter("effectiveFrom");
					
					// String fromDate = (String) request.getParameter("fromDate");

					try {

						Date date = new SimpleDateFormat("yyyy-MM-dd")
								.parse(effectiveFrom1);
						String fromdate1 = new SimpleDateFormat("yyyy-MM-dd")
								.format(date);
						effFromDate=(Date) dateFormat.parse(fromdate1);
						System.out.println("effFromDate"+effFromDate);
						//effFromDate = dateFormat.parse(fromdate1);

					} catch (Exception e) {
						logger.error("Exception in Effect From Date convertion......");
						System.out.println(e.getMessage());
					}

				}
				else if(null==effectiveFrom||effectiveFrom.equalsIgnoreCase("-1")){
					effFromDate =  new Date();
				}
				ParamLoanAc entity= paramsLoanService.getParamLoanByUniqueCompositeOfDisable(tenantId, moduleCode, productCode, branchCode1,effFromDate);
				if(null != entity){
					entity.setIsActive(true);
					
				}
				paramsLoanService.saveOrUpdate(entity);
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

}