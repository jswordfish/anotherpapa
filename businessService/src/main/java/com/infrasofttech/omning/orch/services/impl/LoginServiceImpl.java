package com.infrasofttech.omning.orch.services.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.domain.entities.LanguageMst;
import com.infrasofttech.domain.entities.MenuMst;
import com.infrasofttech.domain.entities.RoleMenuActionAccess;
import com.infrasofttech.domain.entities.TenantMst;
import com.infrasofttech.domain.entities.UserBranchMap;
import com.infrasofttech.domain.entities.UserMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.orch.services.LoginService;
import com.infrasofttech.omning.services.BranchMstService;
import com.infrasofttech.omning.services.LanguageMstService;
import com.infrasofttech.omning.services.MenuMstService;
import com.infrasofttech.omning.services.RoleMenuActionAccessService;
import com.infrasofttech.omning.services.TenantMstService;
import com.infrasofttech.omning.services.UserMstService;
import com.infrasofttech.omning.utils.ErrorCodes;
import com.infrasofttech.utils.MENUACTIONSTATUS;

@Service("loginService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	UserMstService userMstService;

	@Autowired
	BranchMstService branchMstService;

	@Autowired
	LanguageMstService languageMstService;

	@Autowired
	TenantMstService tenantMstService;
	
	@Autowired
	RoleMenuActionAccessService rmaaService;
	
	@Autowired
	MenuMstService menuService;
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<LanguageMst> fetchAllLanguageByTenant(String tenantId) throws OmniNGException{
		LanguageMst languageEnglish = new LanguageMst();
		languageEnglish.setLanguageCode("en");
		
		List<LanguageMst> languages = new ArrayList<LanguageMst>();
		
		languages = languageMstService.findAllByTenant(tenantId);
		
		if(languages==null){
			languages = new ArrayList<LanguageMst>();
			languages.add(languageEnglish);
		}else if(null != languages && languages.size() == 0){
			languages = new ArrayList<LanguageMst>();
			languages.add(languageEnglish);
		}
		return languages;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public TenantMst fetchTenantFromURL(String url) throws OmniNGException{
		TenantMst tenantMst = new TenantMst();

		tenantMst = tenantMstService.findByURL(url);
		
		if(tenantMst == null){
			throw new OmniNGException("URL NOT Valid");
		}
		
		return tenantMst;
	}

	
	@SuppressWarnings("unchecked")
	@Transactional
	public UserMst validateBranchUserDtls(String tenantId, String branchCode, String loginId) 
			throws OmniNGException {
		
		/**
		 * > Check if user is not locked
		 * > Check if user is not already logged-in
		 * > Check whether user is mapped to the branch
		 * > fetch user's display name, office name, pwd+saltPwd 
		 */

		UserMst userMst = new UserMst();
		userMst = userMstService.getUserBasedOnLogin(tenantId, loginId);

		//---> Check if user is not locked
		if(userMst.getIsUserLocked()){
			throw new OmniNGException(ErrorCodes.USERLOCKED);
		}
		//---> Check if user is not already logged-in
		if(userMst.getIsUserLoggedin()){
			if(!userMst.getAllowConcurrentLogin()){
				throw new OmniNGException(ErrorCodes.USERCONCURRENTLOGIN);
			}
		}
		//---> Check whether user is mapped to the branch
		Boolean ubMapFound=false;
		List<UserBranchMap> ubMaps = (List<UserBranchMap>)userMst.getUserBranchMaps();
		if(ubMaps==null){
			throw new OmniNGException(ErrorCodes.INVALIDLOGIN);
		}else if(ubMaps != null && ubMaps.size()==0){
			throw new OmniNGException(ErrorCodes.INVALIDLOGIN);
		}else{
			for(UserBranchMap ubMap : ubMaps){
				if(ubMap.getBranchCode().equalsIgnoreCase(branchCode)){
					ubMapFound = true;
					break;
				}
			} // END OF FOR LOOP
		} // END OF ELSE

		if(ubMapFound){
			return userMst;   // Use the displayName, hPwd, hSaltPwd properties at front-end to validate login
		}else{
			throw new OmniNGException(ErrorCodes.INVALIDLOGIN);
		}
	}

	@Transactional
	public String getBranchName(String tenantId, String branchCode) throws OmniNGException{
		String branchName="";
		branchName = branchMstService.getBranchMst(tenantId, branchCode).getBranchName();
		return branchName;
	}
	
	public BranchMst getBranch(String tenantId, String branchCode) throws OmniNGException{
		String branchName="";
		BranchMst branchMst = branchMstService.getBranchMst(tenantId, branchCode);
		return branchMst;
	}

	@Transactional
	public UserMst killLoginSession(String tenantId, String loginId) throws OmniNGException{

		UserMst userMst = new UserMst();
		userMst = userMstService.getUserBasedOnLogin(tenantId, loginId);
		userMst.setIsUserLoggedin(false);
		//String loginSession = userMst.getLoginSession();
//		userMst.setLoginSession("");
		userMst = userMstService.saveOrUpdate(userMst);
		return userMst;
	}

	@Transactional
	public UserMst validateLoginCredentials(String tenantId, String loginId, String hPwd) throws OmniNGException {
		UserMst userMst = new UserMst();
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("loginId", loginId);
		queryParams.put("pwd", hPwd);       //REMOVED saltPwd at Action class and passed only password
		@SuppressWarnings("unchecked")
		List<UserMst> users = userMstService.findByNamedQueryAndNamedParams("UserMst.verifyLogin", queryParams);
		if(null == users){
			userMst = null;
			//return userMst;
			throw new OmniNGException(ErrorCodes.INVALIDLOGIN);   // Functionally this condition will never occur
		}else if(users != null && users.size()==0){
			userMst = userMstService.setBadLoginCount(tenantId, loginId);
			userMst = null;
			throw new OmniNGException(ErrorCodes.INVALIDLOGIN);
		}else { // login successful
			userMst = users.get(0);
			Calendar cal = Calendar.getInstance();
			Date currDate = cal.getTime();
			userMst.setLastSuccessfulLoginDateTime(currDate);
			userMst  = userMstService.setSuccessfulLogin(tenantId, loginId);
		}
		return userMst;
	}

	@SuppressWarnings("unchecked")
	public List<MenuMst> getUserMenuList(String tenantId, String languageCode, String roleCode){
		String menuCode = "";
		Map<String, String> params1 = new HashMap<String, String>();

		List<RoleMenuActionAccess> rmaaz = new ArrayList<RoleMenuActionAccess>();
		List<MenuMst> menuz = new ArrayList<MenuMst>();
		Map<String, String> params = new HashMap<String, String>();
		params.put("tenantId", tenantId);
		params.put("roleMstCode", roleCode);
		rmaaz = rmaaService.findByNamedQueryAndNamedParams("RMAA.getALLRMAAByTenantAndRoleCode", params);
		if(!roleCode.equalsIgnoreCase("INFRAADMIN")) { // For all roles other than INFRAADMIN
			for(RoleMenuActionAccess rmaa : rmaaz) {
				if(	rmaa.getAuthorizeAction().equals(MENUACTIONSTATUS.ACTIVE) || 
					rmaa.getCreateAction().equals(MENUACTIONSTATUS.ACTIVE) ||
					rmaa.getDeleteAction().equals(MENUACTIONSTATUS.ACTIVE) ||
					rmaa.getDisableAction().equals(MENUACTIONSTATUS.ACTIVE) ||				
					rmaa.getDownloadAction().equals(MENUACTIONSTATUS.ACTIVE) ||
					rmaa.getEmailAction().equals(MENUACTIONSTATUS.ACTIVE) ||
					rmaa.getEnableAction().equals(MENUACTIONSTATUS.ACTIVE) ||
					rmaa.getPrintAction().equals(MENUACTIONSTATUS.ACTIVE) ||
					rmaa.getRejectAction().equals(MENUACTIONSTATUS.ACTIVE) ||
					rmaa.getSearchAction().equals(MENUACTIONSTATUS.ACTIVE) ||
					rmaa.getSmsAction().equals(MENUACTIONSTATUS.ACTIVE) ||
					rmaa.getUpdateAction().equals(MENUACTIONSTATUS.ACTIVE) ||
					rmaa.getViewAction().equals(MENUACTIONSTATUS.ACTIVE) ) {
					
					menuCode = rmaa.getMenuCode();
					params1 = new HashMap<String, String>();
					params1.put("tenantId",tenantId);
					params1.put("languageCode",languageCode);
					params1.put("menuCode", menuCode);
					
					List<MenuMst> menu1 = (List<MenuMst>)menuService.findByNamedQueryAndNamedParams("MenuMst.getMenuMstByMenuCodeNLanguage", params1);
					
					menuz.add(menu1.get(0));
				}else {
					// This menu is not mapped to the role or no actions are allowed for the role
				}
			}
		}else { // ELSE ROLES == INFRAADMIN
			params1 = new HashMap<String, String>();
			params1.put("tenantId",tenantId);
			params1.put("languageCode",languageCode);
			menuz = (List<MenuMst>)menuService.findByNamedQueryAndNamedParams("MenuMst.getMenuzByTenantNLang", params1);
		} // END OF FOR LOOP
		return menuz;
	}
	
	public Map<String, HashSet<MenuMst>> getMapOfSectionMenuList(
			String tenantId, String branchCode, String loginId, String languageCode) {
		//TODO fetch list of role codes

//		Map<String, HashSet<MenuMst>> obj = HashMap<String, HashSet<MenuMst>>();
//		getSectionMenuz(tenantId,languageCode, branchCode, loginId);
		
		
		return null;
	}

	public UserBranchMap getUserBranchMap(String tenantId, String branchCode,
			String loginId)throws OmniNGException {

		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("loginId", loginId);
		queryParams.put("tenantId", tenantId);
		List<UserMst> users = userMstService.findByNamedQueryAndNamedParams("UserMst.getUserMst", queryParams);
		if(users == null){
			throw new OmniNGException("User Not found");
		}
		else if(users != null && users.size() ==0){
			throw new OmniNGException("User Not found");
		}
		
		UserMst userMst = users.get(0);
		Iterator<UserBranchMap> itr = userMst.getUserBranchMaps().iterator();
		UserBranchMap userBranchMap = new UserBranchMap();
		while(itr.hasNext()){
			userBranchMap = itr.next();
			if(userBranchMap.getBranchCode() != null && userBranchMap.getBranchCode().equalsIgnoreCase(branchCode)){
				
				return userBranchMap;
			}
		}
		return null;
	}
	
	public String fetchLoginPwdSalt(String tenantCode, String branchCode,
			String loginId) throws OmniNGException {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("loginId", loginId);
		queryParams.put("tenantId", tenantCode);
		List<UserMst> users = userMstService.findByNamedQueryAndNamedParams("UserMst.getUserMst", queryParams);
		if(users == null){
			throw new OmniNGException("User Not found");
		}
		else if(users != null && users.size() ==0){
			throw new OmniNGException("User Not found");
		}
		
		UserMst userMst = users.get(0);
		Iterator<UserBranchMap> itr = userMst.getUserBranchMaps().iterator();
		while(itr.hasNext()){
			UserBranchMap branchMap = itr.next();
			if(branchMap.getBranchCode() != null && branchMap.getBranchCode().equalsIgnoreCase(branchCode)){
				return userMst.getPwdSalt();
			}
		}
	return null;
}

}
