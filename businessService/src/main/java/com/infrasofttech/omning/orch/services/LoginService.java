package com.infrasofttech.omning.orch.services;

import java.util.List;

import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.domain.entities.LanguageMst;
import com.infrasofttech.domain.entities.MenuMst;
import com.infrasofttech.domain.entities.TenantMst;
import com.infrasofttech.domain.entities.UserBranchMap;
import com.infrasofttech.domain.entities.UserMst;
import com.infrasofttech.exceptions.OmniNGException;

public interface LoginService {

	public List<LanguageMst> fetchAllLanguageByTenant(String tenantId) throws OmniNGException;
	
	public TenantMst fetchTenantFromURL(String url) throws OmniNGException;
	
	public UserMst validateBranchUserDtls(String tenantId, String branchCode, String loginId) throws OmniNGException;
	public UserMst killLoginSession(String tenantId, String loginId) throws OmniNGException;
	public String getBranchName(String tenantId, String branchCode) throws OmniNGException;
	
	public BranchMst getBranch(String tenantId, String branchCode) throws OmniNGException;
	public UserMst validateLoginCredentials(String tenantId, String loginId, String hPwd) throws OmniNGException;
	
	
	public UserBranchMap getUserBranchMap(String tenantCode, String branchCode, String loginId) throws OmniNGException;
	
	public String fetchLoginPwdSalt(String tenantCode, String branchCode,  String loginId) throws OmniNGException;

	public List<MenuMst> getUserMenuList(String tenantId, String languageCode, String roleCode) throws OmniNGException;

}
