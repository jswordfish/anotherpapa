package com.infrasofttech.omning.services.impl;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import com.infrasofttech.domain.entities.RoleMenuActionAccess;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IMenuMstDAO;
import com.infrasofttech.omning.IRoleMenuActionAccessDAO;
import com.infrasofttech.omning.IRoleMstDAO;
import com.infrasofttech.omning.ITenantMstDAO;

@Service("roleMenuActionAccessService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class RoleMenuActionAccessServiceImpl extends OmniNGServiceImpl<Long, RoleMenuActionAccess>
		implements com.infrasofttech.omning.services.RoleMenuActionAccessService {

	@Autowired
	protected IRoleMenuActionAccessDAO rmaaDAO;
	
	@Autowired
	protected IMenuMstDAO menuMstDAO;

	@Autowired
	protected IRoleMstDAO roleMstDAO;
	
	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) rmaaDAO);
	}
	
	@Autowired
	protected ITenantMstDAO tenantMstDAO;

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		rmaaDAO.setEntityManager(entityManager);
	}

	

	public RoleMenuActionAccess saveOrUpdate(RoleMenuActionAccess entity) throws OmniNGException {
		
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantId", entity.getTenantId());
		queryParams.put("roleMstCode", entity.getRoleMstCode());
		queryParams.put("menuCode", entity.getMenuCode());
		List<RoleMenuActionAccess> rMaaz = findByNamedQueryAndNamedParams("RMAA.getRMAAByTenantAndRoleCodeAndMenuCode", queryParams);

		
		if (rMaaz.size() == 0) {
			//---> create mode
			return super.saveOrUpdate(entity);
		} else{
			//---> update mode
			RoleMenuActionAccess rmaa = rMaaz.get(0);
			long id = rmaa.getId();
			Mapper mapper = new DozerBeanMapper();
			mapper.map(entity, rmaa);
			rmaa.setId(id);
			return super.saveOrUpdate(rmaa);
		}
		// return null;
	}

	public Set<RoleMenuActionAccess> getRoleMenuActionAccessSet(String tenantId, String roleCode)throws OmniNGException{
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("roleMstCode", roleCode);
		List<RoleMenuActionAccess> rMaaz = findByNamedQueryAndNamedParams("RMAA.getALLRMAAByTenantAndRoleCode", queryParams);
		if (rMaaz == null) {
			return new HashSet<RoleMenuActionAccess>();
		} else if (rMaaz != null && rMaaz.size() == 0) {
			return new HashSet<RoleMenuActionAccess>();
		}
		else{
			Set<RoleMenuActionAccess> ret = new HashSet<RoleMenuActionAccess>(rMaaz);
			return ret;
		}
		
		
		
	}

	public RoleMenuActionAccess getRoleMenuActionAccess(String tenantId,
			String roleCode, String menuCode) throws OmniNGException {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("roleMstCode", roleCode);
		queryParams.put("menuCode", menuCode);
		List<RoleMenuActionAccess> rMaaz = findByNamedQueryAndNamedParams("RMAA.getRMAAByTenantAndRoleCodeAndMenuCode", queryParams);
		if (rMaaz == null) {
			return null;
		} else if (rMaaz != null && rMaaz.size() == 0) {
			return null;
		}
		else if(rMaaz != null && rMaaz.size()  >0){
			return rMaaz.get(0);
		}
		return null;
	}
}