package com.infrasofttech.omning.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.PrdAcNumberConfig;
import com.infrasofttech.omning.services.PrdAcNoConfigService;
import com.infrasofttech.omning.utils.SpringUtil;

import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class PrdAcNumberConfigListAction extends ActionSupport implements
		ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(PrdAcNumberConfigListAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId = "";

	private List<PrdAcNumberConfig> prdAcNumberConfigs = new ArrayList<PrdAcNumberConfig>();
	SimpleDateFormat targetFormat = new SimpleDateFormat("mm/dd/yyyy");

	private Date effTillDate;
	private Date effFromDate;
	private String errMsg;

	@SuppressWarnings("unchecked")
	public String execute() throws ParseException {
		logger.info("Inside::execute() method");

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
				// Action logic here...
				PrdAcNoConfigService prdAcNoConfigService = (PrdAcNoConfigService) SpringUtil
						.getSpringUtil().getService("prdAcNoConfigService");

				prdAcNumberConfigs = prdAcNoConfigService
						.findAllByTenant(tenantId);

				retVal = OmniConstants.SUCCESS;

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.error("Exception occured in prdAcNumberConfig:::"
					+ e.getMessage());
			e.printStackTrace();

			retVal = OmniConstants.INPUT;
		}

		return retVal;
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

	public List<PrdAcNumberConfig> getPrdAcNumberConfigs() {
		return prdAcNumberConfigs;
	}

	public void setPrdAcNumberConfigs(List<PrdAcNumberConfig> prdAcNumberConfigs) {
		this.prdAcNumberConfigs = prdAcNumberConfigs;
	}

}
