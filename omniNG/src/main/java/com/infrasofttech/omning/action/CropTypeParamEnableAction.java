/**
 * 
 */
package com.infrasofttech.omning.action;



import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.AppConfig;


import com.infrasofttech.domain.entities.CropTypeParam;
import com.infrasofttech.omning.services.AppConfigService;
import com.infrasofttech.omning.services.CropTypeParamService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;



public class CropTypeParamEnableAction extends ActionSupport implements  ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(CropTypeParamEnableAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String branchCode="";
	private String loginId="";
	private String languageCode="";
	private String errMsg = "";
	private Date fromDate;
	
	private CropTypeParam  cropTypeParam = new CropTypeParam();
	
	public String execute() throws Exception {
		try{
			if (request.getSession(false) == null)
			{ 
				System.out.println("SESSION EXPIRED");
				//Session expired 
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;	
				session.invalidate(); 
				retVal =  OmniConstants.LOGIN;	  
			} else {
				System.out.println("CropTypeParamEnableAction.execute()");
				tenantId = (String)request.getSession().getAttribute("tenantCode");
				String cropType = request.getParameter("cropType");
				
			
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

				if ( request.getParameter("fromDate") != null 
						&& !request.getParameter("fromDate").isEmpty()
						
						&& request.getParameter("fromDate") != "") {
					String effectiveFrom = (String) request
							.getParameter("fromDate");
					
				
					try {

						Date date = new SimpleDateFormat("yyyy-MM-dd")
								.parse(effectiveFrom);
						String fromdate1 = new SimpleDateFormat("yyyy-MM-dd")
								.format(date);
						
						fromDate = (Date)dateFormat.parse(fromdate1) ;
								
					} catch (Exception e) {
						logger.error("Exception in CropTypeParam From Date ......");
						System.out.println(e.getMessage());
					}

				}
				
				
				
				CropTypeParamService cropTypeParamService = (CropTypeParamService) SpringUtil
						.getSpringUtil().getService("cropTypeParamService");
				
				if(request.getParameter("cropType") != null){
					try{
					
						cropTypeParam = (CropTypeParam) cropTypeParamService.getDisabledCropType(tenantId, cropType, fromDate);
					if(cropTypeParam!=null){
						cropTypeParam.setIsActive(true);
						cropTypeParamService.saveOrUpdate(cropTypeParam);
					}
					else{
						System.out.println("Error while Enabling cropTypeParam");
					}
					}
					catch(NumberFormatException e){
						System.out.println("cropTypeParam CATCH");
						e.printStackTrace();
					}
				}
				
				
				retVal = OmniConstants.SUCCESS;
			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			e.printStackTrace();
			errMsg = "Error in operation!";
			retVal = OmniConstants.INPUT;
		}finally{
			request.setAttribute("errMsg",  errMsg);
		}
		return retVal;
	}


	public void setServletRequest(HttpServletRequest arg0) {
	
		
	}


	public CropTypeParam getCropTypeParam() {
		return cropTypeParam;
	}


	public void setCropTypeParam(CropTypeParam cropTypeParam) {
		this.cropTypeParam = cropTypeParam;
	}




	
}
