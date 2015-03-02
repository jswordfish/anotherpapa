	package com.infrasofttech.omning.orch.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.domain.entities.RoleMst;
import com.infrasofttech.domain.entities.TenantMst;
import com.infrasofttech.domain.entities.UserMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.orch.services.MenuCachingService;
import com.infrasofttech.omning.services.TenantMstService;
import com.infrasofttech.omning.services.impl.OmniNGServiceImpl;
import com.infrasofttech.utils.SetOfLookupCodeValue;
import com.infrasofttech.utils.SetOfLookupValue;
import com.infrasofttech.utils.SetOfRoleMenuz;
import com.infrasofttech.utils.SetOfSectionMenuz;

@Service("menuCachingService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class MenuCachingServiceImpl extends OmniNGServiceImpl<Long, UserMst> implements MenuCachingService {

	@Autowired
	TenantMstService tenantMstService;

	public List<SetOfRoleMenuz> getSetOfRoleMenuz() throws OmniNGException {
		// TODO DB query to retrieve the set
		List<SetOfRoleMenuz> setOfRoleMenuList = new ArrayList<SetOfRoleMenuz>();
		// Iterate through TenantMst
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("isActive", "true");
		List<TenantMst> tenants = tenantMstService.findByNamedQueryAndNamedParams("TenantMst.getTenants", queryParams);
		List<RoleMst> roles = null; //TODO Role List based on tenantId
		String tenantId="";
		String roleCode="";
		SetOfRoleMenuz setOfRoleMenuz = new SetOfRoleMenuz();
		List<SetOfSectionMenuz> setOfSectionMenuList = new ArrayList<SetOfSectionMenuz>();
		
		for(TenantMst tenantMst: tenants){
			tenantId = tenantMst.getTenantId();
			// Retrieve a List of RoleMst based on tenantId
			for(RoleMst roleMst : roles){
			// Iterate thru list of roles
				roleCode=roleMst.getRoleCode();
				// For every role make call to getSetOfSectionMenuz based on tenantId and roleCode
				setOfRoleMenuz.setTenantId(tenantId);
				setOfRoleMenuz.setRoleCode(roleCode);
				setOfSectionMenuList = getSetOfSectionMenuz(tenantId, roleCode);
			//	setOfRoleMenuz.setSetOfSectionMenuz(setOfSectionMenuList);
				setOfRoleMenuList.add(setOfRoleMenuz);
			}
		} // END OF TENANT LOOP		
		return setOfRoleMenuList;
	}

	private List<SetOfSectionMenuz> getSetOfSectionMenuz(String tenantId, String roleCode){
		List<SetOfSectionMenuz> setOfSectionMenuList = new ArrayList<SetOfSectionMenuz>();
		//TODO DB query to retrieve the set based on tenentId and roleId
		return setOfSectionMenuList;
	}
	
	public List<SetOfLookupCodeValue> getSetOfLookupCodeValues() throws OmniNGException {
		
		List<SetOfLookupCodeValue> setOfRoleMenuList = new ArrayList<SetOfLookupCodeValue>();
		SetOfLookupCodeValue setOfLookupCodeValue = new SetOfLookupCodeValue();
		List<SetOfLookupValue> setOfLookupValueList = new ArrayList<SetOfLookupValue>();

		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("isActive", "true");
		List<TenantMst> tenants = tenantMstService.findByNamedQueryAndNamedParams("TenantMst.getTenants", queryParams);
		//Tenant Iterator
		for(TenantMst tenantMst : tenants){
			
			String tenantId = tenantMst.getTenantId();

			String lookupCode="";	//TODO

			setOfLookupCodeValue.setTenantId(tenantId);
			setOfLookupCodeValue.setLookupCode(lookupCode);
			setOfLookupValueList = getSetOfLookupValues(tenantId, lookupCode);
			setOfLookupCodeValue.setSetOfLookupValuez(setOfLookupValueList);
			setOfRoleMenuList.add(setOfLookupCodeValue);
		}
		return setOfRoleMenuList;
	}
	
	private List<SetOfLookupValue> getSetOfLookupValues(String tenantId, String lookupCode) throws OmniNGException {
		
		List<SetOfLookupValue> setOfLookupValues = new ArrayList<SetOfLookupValue>();
		
		//TODO setOfLookupValues = ???
		
		return setOfLookupValues;
	}
	
	
	
}
