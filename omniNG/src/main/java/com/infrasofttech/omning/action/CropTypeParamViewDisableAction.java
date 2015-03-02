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

import com.infrasofttech.domain.entities.AppConfig;
import com.infrasofttech.domain.entities.CropTypeParam;
import com.infrasofttech.domain.entities.UserMst;
import com.infrasofttech.omning.services.AppConfigService;
import com.infrasofttech.omning.services.CropTypeParamService;
import com.infrasofttech.omning.services.UserMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CropTypeParamViewDisableAction extends ActionSupport implements  ServletRequestAware{ 

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(CropTypeParamViewDisableAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	
	private String errMsg = "";
	
	List<CropTypeParam> cropTypeParams = new ArrayList<CropTypeParam>();
	
	@SuppressWarnings("unchecked")
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
				tenantId = (String)request.getSession().getAttribute("tenantCode");

				// Action logic here...
				CropTypeParamService cropTypeParamService = (CropTypeParamService) SpringUtil
						.getSpringUtil().getService("cropTypeParamService");				
				cropTypeParams = cropTypeParamService.findDisabled(tenantId);
				System.out.println("Disabl AppConfig size :"+cropTypeParams.size());
				retVal = OmniConstants.SUCCESS;
			}
		}catch(Exception e){
			e.printStackTrace();
			retVal=OmniConstants.INPUT;
		}finally{
			
		}
		return retVal;
	}
		
	





	public List<CropTypeParam> getCropTypeParams() {
		return cropTypeParams;
	}







	public void setCropTypeParams(List<CropTypeParam> cropTypeParams) {
		this.cropTypeParams = cropTypeParams;
	}







	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}
	
}
