package com.infrasofttech.omning.action;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.infrasofttech.domain.entities.AuthMatrix;
import com.infrasofttech.domain.entities.AuthMatrixSlab;
import com.infrasofttech.domain.entities.AuthMatrixSlabUser;
import com.infrasofttech.omning.services.AuthMatrixService;
import com.infrasofttech.omning.services.AuthMatrixSlabService;
import com.infrasofttech.omning.services.AuthMatrixSlabUserService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AuthMatrixSlabSaveAction extends ActionSupport implements
		ModelDriven<AuthMatrixSlab> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String BASED_ON_VALUE = "AMT";
	private static final String AUTH_MODE_VALUE = "SELF";
	private String retVal;
	private String tenantId;
	private String errMsg;
	private Integer authorizationCount = null;
	private AuthMatrix authMatrix = new AuthMatrix();
	HttpSession session = null;
	private AuthMatrixSlab authMatrixSlab = new AuthMatrixSlab();
	private AuthMatrixSlabUser authMatrixSlabUser = new AuthMatrixSlabUser();

	private static final Logger logger = Logger
			.getLogger(AuthMatrixSlabSaveAction.class);
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);

	@SuppressWarnings("unchecked")
	@Override
	public String execute() {
		Collection<AuthMatrixSlabUser> authMatrixSlabUsers = new ArrayList<AuthMatrixSlabUser>();
		logger.info("::Inside AuthMatrixSlabSaveAction Execute...");
		session = request.getSession(false);
		retVal = OmniConstants.INPUT;
		tenantId = (String) session.getAttribute("tenantId");
		AuthMatrixSlabService authMatrixSlabService=(AuthMatrixSlabService)SpringUtil.getSpringUtil().getService("authMatrixSlabService");
		if (request.getSession(false) == null) {
			errMsg = ErrorCodes.SESSIONEXPIRE;
			session.invalidate();
			return retVal = OmniConstants.LOGIN;
		}  else {
				try {
					String basedOnCode = request.getParameter("basedOnCode");
					String[] ISOCode = request.getParameterValues("currency[]");
					String authType = request.getParameter("authType");
					String authMode = request.getParameter("authMode");
					String countOfAuthorizer = request.getParameter("authBy");
					System.out
							.println("countOfAuthorizer:" + countOfAuthorizer);

					authMatrixSlab.setBasedOnCode(basedOnCode);
					authMatrixSlab.setAuthType(authType);
					authMatrixSlab.setAuthMode(authMode);
					AuthMatrixService authMatrixService=(AuthMatrixService)SpringUtil.getSpringUtil().getService("authMatrixService");
					authMatrix = authMatrixService.getAuthMatrixId();
					authMatrixSlab.setAuthMatrix(authMatrix);

					// IF AUTHMODE IS SELF
					if (authMode.equalsIgnoreCase(AUTH_MODE_VALUE)) {
						System.out.println("inside if in slabSave....");
						authMatrixSlab.setCountOfAuthorizers(0);
						if (basedOnCode.equalsIgnoreCase(BASED_ON_VALUE)) {
							StringBuffer stringBuffer = new StringBuffer();
							for (int i = 0; i < ISOCode.length; i++) {
								stringBuffer.append(ISOCode[i]);
								if (i < ISOCode.length-1 ) {
									stringBuffer.append(",");
								}
							}
							System.out.println(stringBuffer.toString());
							authMatrixSlab.setCurrencyISOCode(stringBuffer.toString());
							authMatrixSlab=(AuthMatrixSlab)authMatrixSlabService.saveOrUpdate(authMatrixSlab);
						} else {
							authMatrixSlab.setCurrencyISOCode("");
							authMatrixSlab=(AuthMatrixSlab)authMatrixSlabService.saveOrUpdate(authMatrixSlab);
						}
							
							// AUTHMODE IS MULTI
					} else {
						System.out.println("inside Else part in SlabSave...");
						authorizationCount = Integer
								.parseInt(countOfAuthorizer);
						authMatrixSlab
								.setCountOfAuthorizers(authorizationCount);

						// BASED ON AMT
						if (basedOnCode.equalsIgnoreCase(BASED_ON_VALUE)) {
							StringBuffer stringBuffer = new StringBuffer();
							for (int i = 0; i < ISOCode.length; i++) {
								stringBuffer.append(ISOCode[i]);
								if (i < ISOCode.length-1 ) {
									stringBuffer.append(",");
								}
							}
							authMatrixSlab.setCurrencyISOCode(stringBuffer.toString());
							authMatrixSlab=(AuthMatrixSlab)authMatrixSlabService.saveOrUpdate(authMatrixSlab);
							// FOR OTHER THEN BASED ON AMT
						} else {
							authMatrixSlab.setCurrencyISOCode("");
							authMatrixSlab=(AuthMatrixSlab)authMatrixSlabService.saveOrUpdate(authMatrixSlab);
						}
						Integer rank = 1;

						for (int i = 0; i < authorizationCount; i++) {
							String roles[] = request
									.getParameterValues("roles[" + i + "][]");
							System.out.println("role" + i + ":" + roles);
							for (int j = 0; j < roles.length; j++) {
								System.out.println("roleCode " + j + ":"
										+ roles[j]);
								authMatrixSlabUser.setRank(rank);
								authMatrixSlabUser.setRoleCodes(roles[j]);
								authMatrixSlabUser
										.setAuthMatrixSlab(authMatrixSlab);
								authMatrixSlabUsers.add(authMatrixSlabUser);
								authMatrixSlabUser
										.setAuthMatrixSlab(authMatrixSlab);
								AuthMatrixSlabUserService authMatrixSlabUserService=(AuthMatrixSlabUserService)SpringUtil.getSpringUtil().getService("authMatrixSlabUserService");
								authMatrixSlabUser=(AuthMatrixSlabUser)authMatrixSlabUserService.saveOrUpdate(authMatrixSlabUser);
								//authMatrixSlabUserServiceImpl.create(authMatrixSlabUser);
							}
							rank++;
						}
					}
					// errMsg = OmniConstants.RECORDSAVED;
					retVal = OmniConstants.SUCCESS;
					// }

					// errMsg=ErrorCodes.RECORDSAVED;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					retVal = OmniConstants.SUCCESS;

				}

			}
			return retVal;
		}

	public AuthMatrixSlab getAuthMatrixSlab() {
		return authMatrixSlab;
	}

	public void setAuthMatrixSlab(AuthMatrixSlab authMatrixSlab) {
		this.authMatrixSlab = authMatrixSlab;
	}

	public AuthMatrix getAuthMatrix() {
		return authMatrix;
	}

	public void setAuthMatrix(AuthMatrix authMatrix) {
		this.authMatrix = authMatrix;
	}

	public AuthMatrixSlabUser getAuthMatrixSlabUser() {
		return authMatrixSlabUser;
	}

	public void setAuthMatrixSlabUser(AuthMatrixSlabUser authMatrixSlabUser) {
		this.authMatrixSlabUser = authMatrixSlabUser;
	}

	public String getRetVal() {
		return retVal;
	}

	public void setRetVal(String retVal) {
		this.retVal = retVal;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public AuthMatrixSlab getModel() {
		// TODO Auto-generated method stub
		return authMatrixSlab;
	}
}
