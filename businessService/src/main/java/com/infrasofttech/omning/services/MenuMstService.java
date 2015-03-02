package com.infrasofttech.omning.services;

import java.util.List;
import java.util.Map;

import com.infrasofttech.domain.entities.MenuMst;
import com.infrasofttech.exceptions.OmniNGException;

public interface MenuMstService extends OmniNGService {

	public Map<String, Map<String, List<MenuMst>>> setAppLevelRoleMenuz() throws OmniNGException;
	
	public Map<String, List<MenuMst>> getSectionMenuz(
			String tenantId, String languageCode, String branchCode, String loginId)
			throws OmniNGException;
	public List<MenuMst> getMenuMstByTenantNMKRCKR(String tenantId)throws OmniNGException;
	public List<MenuMst> getMenuListByRoleCode(String tenantId, String roleCode, String languageCode) throws OmniNGException;
	public MenuMst saveOrUpdate(MenuMst entity) throws OmniNGException ;
}
