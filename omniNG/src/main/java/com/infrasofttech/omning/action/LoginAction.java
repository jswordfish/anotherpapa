package com.infrasofttech.omning.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.LanguageMst;
import com.infrasofttech.domain.entities.MenuMst;
import com.infrasofttech.domain.entities.TenantMst;
import com.infrasofttech.omning.orch.services.LoginService;
import com.infrasofttech.omning.services.LanguageMstService;
import com.infrasofttech.omning.services.MenuMstService;
import com.infrasofttech.omning.services.TenantMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = 5539422250920232971L;
	private static final Logger logger = Logger.getLogger(BranchListAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String tid="";
	private String retVal = OmniConstants.LOGIN;
	private String languageCode="";

	
	private String errMsg = "";
	private List<LanguageMst> languages= new ArrayList<LanguageMst>();
	Map<String, List<MenuMst>> mSectionMenuz = new HashMap<String, List<MenuMst>>();
	
	public String execute() throws Exception {
		try{
			tid = request.getParameter("tid");
			System.out.println("Query String:" + tid);

			if (request.getSession(false) == null)
			{ 
				System.out.println("New session about to begin...");
				//Session expired 
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;	
				//session.invalidate(); 
				retVal =  OmniConstants.LOGIN;	  
			} else {
				System.out.println("Session started already");
				//fetch TenantGrpMstCode
				TenantMstService tenantService = (TenantMstService) SpringUtil.getSpringUtil().getService("tenantMstService");
				TenantMst tenantMst = tenantService.getTenantMstByCode(tid);
				String tenantGrpCode = tenantMst.getTenantGrpCode();
				String tenantName = tenantMst.getTenantName();
				session = request.getSession(true);
				session.setAttribute("tenantGrpCode", tenantGrpCode);
				session.setAttribute("tenantCode", tid);
				session.setAttribute("tenantName", tenantName);
					
				System.out.println("teantGrpCode, tenantId "+tenantGrpCode+", "+tid);

				// Service reference here...
				@SuppressWarnings("unused")
				LoginService obj =(LoginService) SpringUtil.getSpringUtil().getService("loginService");
				@SuppressWarnings("unused")
				MenuMstService obj1 =(MenuMstService) SpringUtil.getSpringUtil().getService("menuMstService");
				
				LanguageMstService obj2 =(LanguageMstService) SpringUtil.getSpringUtil().getService("languageMstService");
                languages=(obj2.findAllByTenant(tid));
                if(null==languages || languages.size()==0) {
                	LanguageMst languageMst = new LanguageMst();
                	languageMst.setLanguageCode("en");
                	languages.add(languageMst);
                }
                
                request.setAttribute("languages", languages);
                session.setAttribute("languages", languages);
                
//				@SuppressWarnings("unchecked")
//				Map<String, Map<String, List<MenuMst>>>  mapper = 
//						(Map<String, Map<String, List<MenuMst>>>) request.getSession().
//							getServletContext().getAttribute("menuCache");
//				UserBranchMapService userBranchMapService = (UserBranchMapService) SpringUtil.getSpringUtil().getService("userBranchMapService");
//				String roleCode = userBranchMapService.getRoleCode(tenantId, branchCode, loginId);
//				String str = tenantId+"-"+languageCode+"-"+roleCode;
//				
//				mSectionMenuz = mapper.get(str);
				retVal= OmniConstants.SUCCESS;
			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			e.printStackTrace();
			retVal=OmniConstants.LOGIN;
		}finally{
			
		}
		return retVal;
	}
	
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

	public List<LanguageMst> getLanguages() {
		return languages;
	}

	public void setLanguages(List<LanguageMst> languages) {
		this.languages = languages;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}
}
