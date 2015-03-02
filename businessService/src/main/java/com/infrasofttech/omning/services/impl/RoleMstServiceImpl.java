package com.infrasofttech.omning.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.persistence.EntityManager;

import org.apache.log4j.Logger;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.RoleMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IRoleMstDAO;
import com.infrasofttech.omning.services.RoleMstService;

@Service("roleMstService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class RoleMstServiceImpl extends OmniNGServiceImpl<Long, RoleMst> implements RoleMstService {

	private static final Logger logger = Logger.getLogger(RoleMstServiceImpl.class);

	@Autowired
	protected IRoleMstDAO roleMstDAO;
	
	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) roleMstDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		roleMstDAO.setEntityManager(entityManager);
	}

//--------------------------------------------------------

	public RoleMst getRoleMstByUniqueComposite(String tenantId, String roleCode) {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("roleCode", roleCode);
		List<RoleMst> roles = findByNamedQueryAndNamedParams("RoleMst.getRoleMstByTenantNRole", queryParams);
		if (roles == null) {
			return null;
		} else if (roles != null && roles.size() == 0) {
			return null;
		}
		return roles.get(0);
	}

	public RoleMst saveOrUpdate(RoleMst entity) throws OmniNGException {
		RoleMst roleMst = getRoleMstByUniqueComposite(entity.getTenantId(),	entity.getRoleCode());
		if (roleMst == null) {
			//-----------> create mode
			return super.saveOrUpdate(entity);
		} else {
			Long id = roleMst.getId();
			Mapper mapper = new DozerBeanMapper();
			mapper.map(entity, roleMst);
			roleMst.setId(id);
			return super.saveOrUpdate(roleMst);

		}
	}
	//Get Disabled Role Mst // isActive = false 
	public RoleMst getRoleMstByTenantNRoleNIsActive(String tenantId, String roleCode) {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("roleCode", roleCode);
		List<RoleMst> roles = findByNamedQueryAndNamedParams("RoleMst.getRoleMstByTenantNRoleNIsActive", queryParams);
		if (roles == null) {
			return null;
		} else if (roles != null && roles.size() == 0) {
			return null;
		}
		return roles.get(0);
	}

}
