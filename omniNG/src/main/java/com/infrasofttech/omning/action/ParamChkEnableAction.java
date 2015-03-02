package com.infrasofttech.omning.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.ParamCheckingAc;
import com.infrasofttech.omning.services.ParamsCheckingAcService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ParamChkEnableAction extends ActionSupport implements  ServletRequestAware {
	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(ParamChkEnableAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private Date effFromDate;
	private String errMsg = "";
	
	@SuppressWarnings("unchecked")
	public String execute() throws Exception {
		try{
			if (request.getSession() == null)
			{ 
				System.out.println("SESSION EXPIRED");
				//Session expired 
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;	
				session.invalidate(); 
				retVal =  OmniConstants.LOGIN;	  
			} else {
				tenantId = (String)request.getSession().getAttribute("tenantCode");
				String productCode = request.getParameter("productCode");
				String moduleCode = request.getParameter("moduleCode");
				String branch = request.getParameter("branchCode");
				// Action logic here...
				ParamsCheckingAcService paramsCheckingAcService = (ParamsCheckingAcService) SpringUtil
						.getSpringUtil().getService("paramsCheckingAcService");
				System.out.println("productCode:"+productCode);
				System.out.println("moduleCode:"+moduleCode);
				System.out.println("branch Code:"+branch);
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
				ParamCheckingAc entity =  paramsCheckingAcService.getParamCheckingAcByUniqueCompositeOfDisable(tenantId, moduleCode, productCode, branch,effFromDate);
				if(null != entity){
					entity.setIsActive(true);
					System.out.println(entity.getIsActive());
				}
				paramsCheckingAcService.saveOrUpdate(entity);
				retVal = OmniConstants.SUCCESS;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			
		}
		return retVal;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
		
	}
}