/**
 * 
 */
package com.infrasofttech.omning.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.AppConfig;
import com.infrasofttech.domain.entities.ProductMst;
import com.infrasofttech.omning.services.AppConfigService;
import com.infrasofttech.omning.services.ProductMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


public class ProductDisableAction  extends ActionSupport implements  ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(ProductDisableAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String branchCode="";
	private String loginId="";
	private String languageCode="";
	private String errMsg = "";
	private ProductMst productMst = new ProductMst();
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
				System.out.println("ProductDisableAction.execute()");
				tenantId = (String)request.getSession().getAttribute("tenantCode");
				String loginId = (String)request.getAttribute("loginId");
			
				
				ProductMstService productMstService = (ProductMstService) SpringUtil.getSpringUtil().getService("productMstService");
				
				if(request.getParameter("productCode") != null && request.getParameter("moduleCode") != null){
					try{
					String productCode = request.getParameter("productCode");
					String moduleCode = request.getParameter("moduleCode");
					productMst = (ProductMst) productMstService.getProductMstByUniqueComposite(tenantId, moduleCode, productCode);
					if(productMst!=null){
						productMst.setIsActive(false);
						productMstService.saveOrUpdate(productMst);
					}
					else{
						System.out.println("error while disbling Product");
					}
					}
					catch(NumberFormatException e){
						System.out.println("ProductDisableAction CATCH");
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
		// TODO Auto-generated method stub
		
	}


	
}
