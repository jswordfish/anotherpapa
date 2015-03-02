package com.infrasofttech.omning.action;

import java.text.ParseException;
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

import com.infrasofttech.domain.entities.AuthEvent;
import com.infrasofttech.domain.entities.AuthMatrix;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.AuthMatrixService;
import com.infrasofttech.omning.utils.ErrorCodes;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AuthMatrixSaveAction extends ActionSupport implements
		ServletRequestAware {
	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(AuthMatrixSaveAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId = "";
	private String loginId="";
	private String errMsg = "";
	private String mode = "";
	AuthMatrix authMatrix = new AuthMatrix();
	private List<AuthMatrix> authMatrixs = new ArrayList<AuthMatrix>();

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
				session = request.getSession();
				tenantId = (String) session.getAttribute("tenantId");
				mode = (String) request.getParameter("mode");

				System.out.println("Saving in " + mode + " mode.");
				// Action logic here...
				 authMatrix = (AuthMatrix)request.getAttribute("authMatrix");

				authMatrix = setValuesToAuthMatrix(authMatrix);

				AuthMatrixService authMatrixService = (AuthMatrixService) SpringUtil
						.getSpringUtil().getService("authMatrixService");
				authMatrix = authMatrixService.saveOrUpdate(authMatrix);
				retVal = OmniConstants.SUCCESS;
			} // END OF ELSE :: SESSION NOT EXPIRE
		} catch (Exception e) {
			e.printStackTrace();
			retVal = OmniConstants.INPUT;
		} finally {

		}
		return retVal;
	}

	private AuthMatrix setValuesToAuthMatrix(AuthMatrix authMatrix) {
		try {
			// authMatrix.setAuthEvent(request.getParameter("authEvent"));
			authMatrix
					.setAuthMatrixName(request.getParameter("authMatrixName"));
			authMatrix.setAuthStatus(request.getParameter("authStatus"));
			// authMatrix.setBranches(request.getParameter("customerInternal"));
			// authMatrix.setCurrencies(request.getParameter("vcrOpenLevel"));
			String effFromDate=request.getParameter("effFromDate");
			String effTillDate=request.getParameter("effTillDate");
			
			AuthEvent authEvent = new AuthEvent();
			String eventId = request.getParameter("authEvents");
			Long newEventId = Long.parseLong(eventId);
			System.out.println("Event id: " + newEventId);
			authEvent.setId(newEventId);
			authMatrix.setAuthEvent(authEvent);
			authMatrix.setTenantId(tenantId);
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
			Date effFrom, effTill;
			try {
				effFrom = formatter.parse(effFromDate);
				authMatrix.setEffFrom(effFrom);
				if (effTillDate != null) {
				 effTill= formatter.parse(effTillDate);
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			// DateFormat dateFormat = new
			// SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			Date createdDate = cal.getTime();
			Date lastModifiedDate = cal.getTime();
			if (mode.equalsIgnoreCase("CREATE")) {
				authMatrix.setCreatedDate(createdDate);
				authMatrix.setCreatedBy(loginId);
			} else {
				authMatrix.setLastModifiedDate(lastModifiedDate);
				authMatrix.setLastModifiedBy(loginId);
			}
			authMatrix.setAuthStatus(OmniConstants.AUTH_AUTHORIZED);
			return authMatrix;
		} catch (OmniNGException e) {
			e.printStackTrace();
			errMsg = e.getMessage();
			retVal = OmniConstants.INPUT;
		}
		return authMatrix;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request=arg0;
		
	}
}