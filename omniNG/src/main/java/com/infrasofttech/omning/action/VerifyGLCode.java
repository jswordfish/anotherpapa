package com.infrasofttech.omning.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.infrasofttech.domain.entities.GLMst;
import com.infrasofttech.domain.entities.UserMst;
import com.infrasofttech.omning.services.GLMstService;
import com.infrasofttech.omning.services.UserMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class VerifyGLCode extends ActionSupport {
	private String errMsg;
	
	private String loginId = "";

	

	String tenantId = "";

	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger
			.getLogger(VerifyGLCode.class);
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);
	HttpSession session = null;

	public void execute1() {

		System.out.println("::InsideverifyglcodeAction Execute...");
		logger.info("::Inside BranchCodeVerifyAction Execute...");
		session = request.getSession();
		tenantId =(String) session.getAttribute("tenantCode");
	//	Boolean isVerify = false;
		if (session == null) {
			// Session expired
			logger.error("Session Expired!!!");
			System.out.println("Session Expired!!!");
			errMsg = ErrorCodes.SESSIONEXPIRE;

		}

		String glCode = request.getParameter("glCode");
		String fyCode= request.getParameter("fyCode");
		System.out.println(glCode);
		

		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/plain;charset=utf-8");
			PrintWriter out = response.getWriter();
			if(!glCode.isEmpty()&&glCode!=""&&glCode!=null){
				GLMstService glMstService = (GLMstService) SpringUtil.getSpringUtil().getService("glMstService");
				GLMst glMst = glMstService.getGLMstByUniqueComposition(tenantId, glCode, fyCode);

			if (glMst!=null ) {
				out.println("<font color=red><b>"+glCode+"</b> is already in use</font>");
			} else {
				out.println("<font color=green><b>"+glCode+"</b> isAvailable</font>");
			}
			}else{
				
				out.println("<font color=red><b>Please Enter GLCode</b> </font>");
			}
			out.flush();

		} catch (Exception e) {

		}

		// return SUCCESS;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	


	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

}
