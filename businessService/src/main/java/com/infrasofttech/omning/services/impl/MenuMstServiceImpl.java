package com.infrasofttech.omning.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.persistence.EntityManager;

import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.LanguageMst;
import com.infrasofttech.domain.entities.MenuMst;
import com.infrasofttech.domain.entities.RoleMenuActionAccess;
import com.infrasofttech.domain.entities.RoleMst;
import com.infrasofttech.domain.entities.SectionMst;
import com.infrasofttech.domain.entities.TenantMst;
import com.infrasofttech.domain.entities.UserBranchMap;
import com.infrasofttech.domain.entities.UserBranch_RoleMap;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.ILanguageMstDAO;
import com.infrasofttech.omning.IMenuMstDAO;
import com.infrasofttech.omning.IRoleMstDAO;
import com.infrasofttech.omning.ISectionMstDAO;
import com.infrasofttech.omning.ITenantMstDAO;
import com.infrasofttech.omning.impl.RoleMenuActionAccessDAO;
import com.infrasofttech.omning.impl.UserBranchMapDAO;
import com.infrasofttech.utils.SetOfRoleMenuz;

@Service("menuMstService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class MenuMstServiceImpl extends OmniNGServiceImpl<Long, MenuMst>
		implements com.infrasofttech.omning.services.MenuMstService {

	@Autowired
	protected ITenantMstDAO tenantMstDAO;

	@Autowired
	protected IRoleMstDAO roleMstDAO;

	@Autowired
	protected ILanguageMstDAO languageMstDAO;

	@Autowired
	protected RoleMenuActionAccessDAO roleMenuActionAccessDAO;

	@Autowired
	protected UserBranchMapDAO userBranchMapDAO;
	
	@Autowired
	protected ISectionMstDAO sectionMstDAO;

	@Autowired
	protected IMenuMstDAO menuMstDAO;

	
	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) menuMstDAO);
	}
	
	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		menuMstDAO.setEntityManager(entityManager);
	}

	//------------------------

	public List<MenuMst> getMenuListByRoleCode(String tenantId, String roleCode, String languageCode){
		
		List<MenuMst> menuz = new ArrayList<MenuMst>();
		
		// check the role, if INFRAADMIN...do all or go to else
		if(roleCode.equalsIgnoreCase("INFRAADMIN")) {
			// Code to fetch all Menuz
			Map<String, String> params2 = new HashMap<String, String>();
			params2.put("tenantId", tenantId);
			params2.put("languageCode", languageCode);
			menuz = (List<MenuMst>) menuMstDAO.findByNamedQueryAndNamedParams("MenuMst.getMenuzByTenantNLang", params2);
			
		} else {   // For roles other than INFRAADMIN
			List<RoleMenuActionAccess> rmaaz = new ArrayList<RoleMenuActionAccess>();
			Map<String, String> params = new HashMap<String, String>();
			params.put("tenantId", tenantId);
			params.put("roleMstCode", roleCode);
			rmaaz = (List<RoleMenuActionAccess>)roleMenuActionAccessDAO.findByNamedQueryAndNamedParams("RMAA.getALLRMAAByTenantAndRoleCode", params);

			for (RoleMenuActionAccess rmaa : rmaaz) {
				String menuCode = rmaa.getMenuCode();
				Map<String, String> params1 = new HashMap<String, String>();
				params1.put("tenantId", tenantId);
				params1.put("languageCode", languageCode);
				params1.put("menuCode", menuCode);
				List<MenuMst> menuList = (List<MenuMst>) menuMstDAO.findByNamedQueryAndNamedParams("MenuMst.getMenuMstByMenuCodeNLanguage", params1);
				menuz.add(menuList.get(0));
			}
			
		}
		
		return menuz;
	}
	
	
	public Map<String, Map<String, List<MenuMst>>> setAppLevelRoleMenuz() throws OmniNGException {
		List<SetOfRoleMenuz> setOfRoleMenuList = new ArrayList<SetOfRoleMenuz>();

		SetOfRoleMenuz setOfRoleMenu = new SetOfRoleMenuz();
		
		List<RoleMenuActionAccess> rmaaz = new ArrayList<RoleMenuActionAccess>();
		
		String tenantId=""; String languageCode=""; String roleCode=""; String menuCode = "";
		String sectionCode=""; 
		String sectionCodeFromMenu=""; 
		Map<String, Map<String, List<MenuMst>>> mapper = new HashMap<String, Map<String,List<MenuMst>>>();
		// Iterate thru tenants
		List<TenantMst> tenants = tenantMstDAO.findAll();
		for(TenantMst tenantMst : tenants){
			tenantId = tenantMst.getTenantId();
			List<RoleMst> roles = roleMstDAO.findAllByTenant(tenantId);

			// Iterate thru roles
			for(RoleMst roleMst : roles){
				roleCode = roleMst.getRoleCode();
				
				Map<String, String> params = new HashMap<String, String>();
				params.put("tenantId",  tenantId);
				params.put("roleMstCode",  roleCode);
				rmaaz = roleMenuActionAccessDAO.
						findByNamedQueryAndNamedParams("RMAA.getALLRMAAByTenantAndRoleCode",params);
				// Iterate thru' languages
				List<LanguageMst> languages = languageMstDAO.findAllByTenant(tenantId);	
				for(LanguageMst languageMst : languages){
					languageCode = languageMst.getLanguageCode();
					System.out.println("for Language code:"+languageCode);
					
					setOfRoleMenu = new SetOfRoleMenuz();
					
					Map<String,String> paramSection = new HashMap<String, String>();
					paramSection.put("tenantId", tenantId);
					paramSection.put("languageCode", languageCode);
					
					List<SectionMst> sections = sectionMstDAO.findByNamedQueryAndNamedParams("SectionMst.getSectionsByTenantNLang",
							paramSection);
					

					// Iterate thru sections
					Map<String, List<MenuMst>> mSectionMenuz = new HashMap<String, List<MenuMst>>();
					for(SectionMst sectionMst : sections){
						List<MenuMst> menuList = new ArrayList<MenuMst>();
						sectionCode = sectionMst.getSectionCode();
						String sectionName=sectionMst.getSectionName();
						
						if(rmaaz!=null && rmaaz.size()>0){
							
							for(RoleMenuActionAccess rmaa : rmaaz){
								menuCode = rmaa.getMenuCode();
								Map<String, String> params1 = new HashMap<String, String>();
								params1.put("tenantId",  tenantId);
								params1.put("languageCode", languageCode);
								params1.put("menuCode", menuCode);
								System.out.println("RMAA::"+tenantId+","+languageCode+","+menuCode+"<");
								
								List<MenuMst> menuz = menuMstDAO.
									findByNamedQueryAndNamedParams(
											"MenuMst.getMenuMstByMenuCodeNLanguage", params1);
								if(null != menuz && menuz.size()>0){
									MenuMst menuMst = menuz.get(0);
									sectionCodeFromMenu = menuMst.getSectionCode();
									if(sectionCode.equalsIgnoreCase(sectionCodeFromMenu)){
										menuMst.setAuthorizeAction(rmaa.getAuthorizeAction());
										menuMst.setCreateAction(rmaa.getCreateAction());
										menuMst.setDeleteAction(rmaa.getDeleteAction());
										menuMst.setDisableAction(rmaa.getDisableAction());
										menuMst.setDownloadAction(rmaa.getDownloadAction());
										menuMst.setEmailAction(rmaa.getEmailAction());
										menuMst.setEnableAction(rmaa.getEnableAction());
										menuMst.setPrintAction(rmaa.getPrintAction());
										menuMst.setRejectAction(rmaa.getRejectAction());
										menuMst.setSearchAction(rmaa.getSearchAction());
										menuMst.setSmsAction(rmaa.getSmsAction());
										menuMst.setUpdateAction(rmaa.getUpdateAction());
										menuMst.setViewAction(rmaa.getViewAction());
										//sectionName = menuMst.getSectionDisplayName();		
										menuList.add(menuMst);
									}
								}
							} // END OF RMAA LOOP
							mSectionMenuz.put(sectionName, menuList);
						}  // END OF IF RMAAZ NULL
					} // END OF SECTION FOR LOOP
					setOfRoleMenu.setTenantId(tenantId);
					setOfRoleMenu.setLanguageCode(languageCode);
					setOfRoleMenu.setRoleCode(roleCode);
					setOfRoleMenu.setmSectionMenuz(mSectionMenuz);
					mapper.put(tenantId+"-"+languageCode+"-"+roleCode, mSectionMenuz);
					setOfRoleMenuList.add(setOfRoleMenu);
				} // END OF LANGUAGE FOR LOOP
			} // END OF ROLES FOR LOOP
		} // END OF TENANTS FOR LOOP
		
		return mapper;
		
	}
	
	public Map<String, List<MenuMst>> getSectionMenuz(String tenantId,
			String languageCode, String branchCode, String loginId)
			throws OmniNGException {
		
		SetOfRoleMenuz setOfRoleMenuz = new SetOfRoleMenuz();
		Map<String, List<MenuMst>> sectionMenuMapForARole = new HashMap<String, List<MenuMst>>();
//		List<Map<String, List<MenuMst>>> sectionMenuListForAllRole = new ArrayList<Map<String, List<MenuMst>>>();
		List<SetOfRoleMenuz> setOfRoleMenuList = null; // From global app value
		String roleCode="";
		
		setOfRoleMenuz = setOfRoleMenuList.get(0);  //TODO
		
		// Get roleCode from login and branchcode
		Map<String, String> params1 = new HashMap<String, String>();
		params1.put("tenantId", tenantId);
		params1.put("loginId",  loginId);
		params1.put("branchCode",  branchCode);
		List<UserBranchMap> ubMaps = userBranchMapDAO.findByNamedQueryAndNamedParams("UserBranch.getBranchUser", params1);
		List<UserBranch_RoleMap> ubrMapz = (List<UserBranch_RoleMap>) ubMaps.get(0).getUserBranch_RoleMaps();
		roleCode = ubrMapz.get(0).getRoleCode();
		//--------------------------------------------
		
		for(SetOfRoleMenuz setOfRoleMenuz1 : setOfRoleMenuList){
			
			if(setOfRoleMenuz1.getTenantId().equals(tenantId) && 
					setOfRoleMenuz1.getLanguageCode().equalsIgnoreCase(languageCode) && 
					setOfRoleMenuz1.getRoleCode().equalsIgnoreCase(roleCode)){
				
				sectionMenuMapForARole = setOfRoleMenuz.getMenuz(tenantId, languageCode, roleCode);
				break;
			}
		} // END OF FOR LOOP
		return sectionMenuMapForARole;
	}

	// fetch menu having maker/checker as true
	public List<MenuMst> getMenuMstByTenantNMKRCKR(String tenantId ) throws OmniNGException {
		
		List<MenuMst> menuMsts = new ArrayList<MenuMst>();
		Map<String, Object> params = new HashMap<String,Object>();
		params.put("tenantId",tenantId);		
		
		menuMsts = findByNamedQueryAndNamedParams("MenuMst.getMenuMstByTenantNMKRCKR",params);
	
		if(menuMsts == null){
			return null;
		}else if(menuMsts !=null && menuMsts.size() == 0){
			
			return null;
		}
					
		return menuMsts;
	}
public MenuMst saveOrUpdate(MenuMst entity) throws OmniNGException {
		
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantId", entity.getTenantId());		
		queryParams.put("menuCode", entity.getMenuCode());
		List<MenuMst> menuz = findByNamedQueryAndNamedParams("MenuMst.getMenuMstBytenantNMenuCode", queryParams);

		
		if (menuz.size() == 0) {
			//---> create mode
			return super.saveOrUpdate(entity);
		} else{
			//---> update mode
			MenuMst menuMst = menuz.get(0);
			long id = menuMst.getId();
			Mapper mapper = new DozerBeanMapper();
			mapper.map(entity, menuMst);
			menuMst.setId(id);
			return super.saveOrUpdate(menuMst);
		}
		// return null;
	}
}
