package com.infrasofttech.omning.action;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.GLMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.GLMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class GLMstSaveAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(GLMstSaveAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String branchCode="";
	private String loginId="";
	private String languageCode="";
	private String errMsg = "";
	private String mode="";
	
	GLMst glMst= new GLMst();
	public String execute() throws Exception {
		System.out.println("execute");
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
				mode = (String)request.getParameter("mode");
				
				System.out.println("Saving in "+mode+" mode.");
				// Action logic here...
				glMst = (GLMst)request.getAttribute("glMst");
				
				if(null==glMst){
					glMst= new GLMst();
					System.out.println("glmstis null");
				}
				
				glMst = setValuesToGLMst(glMst);
				glMst.setTenantId(tenantId);

				GLMstService glMstService = (GLMstService) SpringUtil.getSpringUtil().getService("glMstService");

				glMst=glMstService.saveOrUpdate(glMst);
				
				retVal = OmniConstants.SUCCESS;
			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			e.printStackTrace();
			retVal = OmniConstants.INPUT;
		}finally{
			
		}
		return retVal;
	}

	private GLMst setValuesToGLMst(GLMst glMst){
		try{
			
			//DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			Date createdDate = cal.getTime();
			Date lastModifiedDate = cal.getTime();
			System.out.println("gl code"+request.getParameter("glCode"));
			String glCode=request.getParameter("glCode");
			glMst.setGlCode(glCode);
			String glName=request.getParameter("glName");
			glMst.setGlName(glName);
			glMst.setCurrencyCode(request.getParameter("currencyCode"));
			String glType=request.getParameter("glType");
			glMst.setGlType(glType);
			String glCategory=request.getParameter("glCategory");
			glMst.setGlCategory(glCategory);
			glMst.setFyCode(request.getParameter("fyCode"));
			if(mode.equalsIgnoreCase("CREATE")){
				glMst.setCreatedDate(createdDate);
				glMst.setCreatedBy(loginId);
			}else{
				glMst.setLastModifiedDate(lastModifiedDate);	
				glMst.setLastModifiedBy(loginId);
			}
			glMst.setAuthStatus(OmniConstants.AUTH_AUTHORIZED);
			return glMst;
		}catch(OmniNGException e){
			e.printStackTrace();
			errMsg = e.getMessage();
			retVal = OmniConstants.INPUT;
		}
		return glMst;
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

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

}
