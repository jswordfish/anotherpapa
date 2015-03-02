package com.infrasofttech.omning.action;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.DeDupConfig;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.DeDupConfigService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DeDupConfigSaveAction extends ActionSupport implements
		ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(DeDupConfigSaveAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId = "";
	private String branchCode = "";
	private String loginId = "";
	private String languageCode = "";
	private String errMsg = "";
	private String mode = "";

	DeDupConfig deDupConfig = new DeDupConfig();

	public String execute() throws Exception {
		try {
			if (request.getSession(false) == null) {
				System.out
						.println("ProductSaveAction.execute() SESSION EXPIRED");
				// Session expired
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;
				session.invalidate();
				retVal = OmniConstants.LOGIN;
			} else {
				session = request.getSession();
				tenantId = (String) session.getAttribute("tenantCode");
				branchCode = (String) session.getAttribute("branchCode");
				loginId = (String) session.getAttribute("loginId");
				languageCode = (String) session.getAttribute("languageCode");
				mode = (String) request.getParameter("mode");

				deDupConfig = (DeDupConfig) request.getAttribute("deDupConfig");

				deDupConfig = setValuesToDeDupConfig(deDupConfig);
				deDupConfig.setTenantId(tenantId);

				DeDupConfigService deDupConfigService = (DeDupConfigService) SpringUtil
						.getSpringUtil().getService("deDupConfigService");
				String[] refDocs = request.getParameterValues("refDoc");
				String[] seqNumVals = request.getParameterValues("seqNumVal");
				String[] mandatoryYNs = request
						.getParameterValues("mandatoryYN");

				try {
					for (int j = 0; j < refDocs.length; j++) {
						if ("-1" != refDocs[j] && null != seqNumVals
								&& null != refDocs && "" != seqNumVals[j]) {
							deDupConfig.setMandatoryYN(true);
							deDupConfig.setRefDoc(refDocs[j]);
							deDupConfig.setSeqNumVal(Integer
									.parseInt(seqNumVals[j]));
							System.out.println("refDocs:::::::::" + refDocs[j]);
							// System.out.println("mandatoryYNs:::::::::"
							// + mandatoryYNs[j]);
							System.out.println("seqNumVals:::::::::"
									+ seqNumVals[j]);
							deDupConfigService.saveOrUpdate(deDupConfig);
						} else {

						}
					}
				} catch (OmniNGException e) {
					e.printStackTrace();
					errMsg = e.getMessage();
					// retVal = OmniConstants.INPUT;
				}
				retVal = OmniConstants.SUCCESS;
			} // END OF ELSE :: SESSION NOT EXPIRE
		} catch (Exception e) {
			e.printStackTrace();
			retVal = OmniConstants.INPUT;
		} finally {

		}
		return retVal;
	}

	private DeDupConfig setValuesToDeDupConfig(DeDupConfig deDupConfig) {
		try {

			Calendar cal = Calendar.getInstance();
			Date createdDate = cal.getTime();
			Date lastModifiedDate = cal.getTime();
			if (mode.equalsIgnoreCase("CREATE")) {
				deDupConfig.setCreatedDate(createdDate);
				deDupConfig.setCreatedBy(loginId);
			} else {
				deDupConfig.setLastModifiedDate(lastModifiedDate);
				deDupConfig.setLastModifiedBy(loginId);
			}

			deDupConfig.setAuthStatus(OmniConstants.AUTH_AUTHORIZED);
			return deDupConfig;
		} catch (OmniNGException e) {
			e.printStackTrace();
			errMsg = e.getMessage();
			retVal = OmniConstants.INPUT;
		}
		return deDupConfig;
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

	public DeDupConfig getDeDupConfig() {
		return deDupConfig;
	}

	public void setDeDupConfig(DeDupConfig deDupConfig) {
		this.deDupConfig = deDupConfig;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

}
