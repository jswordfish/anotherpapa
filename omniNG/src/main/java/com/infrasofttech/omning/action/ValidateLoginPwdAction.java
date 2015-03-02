package com.infrasofttech.omning.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.MenuMst;
import com.infrasofttech.domain.entities.UserMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.orch.services.LoginService;
import com.infrasofttech.omning.services.MenuMstService;
import com.infrasofttech.omning.utils.ErrorCodes;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ValidateLoginPwdAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = 1L;
	private String branchCode="";
	private String loginId="";
	private String branchName="";
	private String userName="";
	private String hiddenSaltPassword="";
	private String fullPassword="";
	private String pwd="";
	private String languageCode="";
	private String tenantId="";
	private static Integer instanceCounter = 0;

	private Integer counter = 0;
	private String displayName = "";
	private String errMsg = "";
	private String mlvToken;
	private static final Logger logger = Logger.getLogger(ValidateLoginPwdAction.class);
	private String retVal = "";
	
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	Map<String, List<MenuMst>> mapSectionMenu = new HashMap<String, List<MenuMst>>();
	
	@Override
	public String execute() throws OmniNGException {
		try{
			branchCode= (String) request.getSession().getAttribute("branchCode");
			loginId = (String) request.getSession().getAttribute("loginId");
			languageCode = (String) request.getSession().getAttribute("languageCode");
			tenantId = (String) request.getSession().getAttribute("tenantCode");

			String uiPwd = (String) request.getParameter("uiPwd");
			String hPwd = (String) request.getParameter("hPwd");
			String hPwdSalt = (String) request.getParameter("hPwdSalt");

//			String hPwdFromUI = (String) request.getParameter("hiddenPassword") +
//								(String) request.getParameter("hiddenSaltPassword");
//			String hashedSaltPwd = (String) request.getParameter("hiddenSaltPassword");
			
			String p1[]= uiPwd.split(hPwdSalt);
			 
			String hPwdAct = p1[0];
			System.out.println("hashed password: " + hPwdAct);
			System.out.println("VALUES: " + tenantId+","+languageCode+","+loginId+","+branchCode+", "+hPwd);

			// Service reference here...
			@SuppressWarnings("unused")
			LoginService loginService =(LoginService) SpringUtil.getSpringUtil().getService("loginService");
			@SuppressWarnings("unused")
			MenuMstService menuMstService =(MenuMstService) SpringUtil.getSpringUtil().getService("menuMstService");
	
			UserMst user = loginService.validateLoginCredentials(tenantId, loginId, hPwdAct);
			
			if(null == user){
				retVal = OmniConstants.LOGIN;
				errMsg = ErrorCodes.INVALIDLOGIN;
				request.setAttribute("errMsg", errMsg);
				logger.warn(errMsg + " Password did not match for loginId: " + loginId);
			}else{
				session=request.getSession();
				String roleCode = user.getRoleCode();
				request.getSession().setAttribute("roleCode", roleCode);
				List<MenuMst> menuList = menuMstService.getMenuListByRoleCode(tenantId, roleCode, languageCode);
				
//				@SuppressWarnings("unchecked")
//				Map<String, Map<String, List<MenuMst>>>  mapper = 
//						(Map<String, Map<String, List<MenuMst>>>) request.getSession().
//							getServletContext().getAttribute("menuCache");
//				UserBranchMapService userBranchMapService = (UserBranchMapService) SpringUtil.getSpringUtil().getService("userBranchMapService");
//				String roleCode = userBranchMapService.getRoleCode(tenantId, branchCode, loginId);
//				String str = tenantId+"-"+languageCode+"-"+roleCode;
//				
//				mapSectionMenu = mapper.get(str);
//				
//				System.out.println("mapSectionMenu SIZE: " + mapSectionMenu.size());
//				request.setAttribute("sections_menus", mapSectionMenu);

				// Retrieve menu options applicable to the User's role
//				List<MenuMst> menuList = obj.getUserMenuList(tenantId, languageCode, roleCode);
				if(null==menuList || menuList.size()==0) {
					errMsg="No Menu are mapped to your role. Contact Administrator!";
					logger.warn(errMsg);
					retVal = OmniConstants.LOGIN;
				}else {
					session.setAttribute("displayMenuz", menuList);
					errMsg="";
					retVal =  OmniConstants.SUCCESS;
				}
			}
		}catch(Exception e){
			retVal = OmniConstants.LOGIN;
			errMsg = ErrorCodes.INVALIDLOGIN;
		}finally {
			request.setAttribute("errMsg", errMsg);
		}
		return retVal;
	}

	public Map<String, List<MenuMst>> getMapSectionMenu() {
		return mapSectionMenu;
	}

	public void setMapSectionMenu(Map<String, List<MenuMst>> mapSectionMenu) {
		this.mapSectionMenu = mapSectionMenu;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
}
