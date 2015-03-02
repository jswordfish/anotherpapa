package com.infrasofttech.omning.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.persistence.EntityManager;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.ModuleMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IModuleMstDAO;
import com.infrasofttech.omning.services.ModuleMstService;

@Service("moduleMstService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class ModuleMstServiceImpl extends OmniNGServiceImpl<Long, ModuleMst>
		implements ModuleMstService {
	private static final Logger logger = Logger.getLogger(ModuleMstServiceImpl.class);
	
	
	@Autowired
	protected IModuleMstDAO moduleMstDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) moduleMstDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		moduleMstDAO.setEntityManager(entityManager);
	}

	public ModuleMst getModuleMst(String tenantId, String moduleCode)
			throws OmniNGException {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("moduleCode", moduleCode);
		List<ModuleMst> modules = (List<ModuleMst>)findByNamedQueryAndNamedParams("ModuleMst.getModuleMst", queryParams);
		if(modules==null){
			throw new OmniNGException();
		}else if(modules != null && modules.size()==0){
			return null;
		}else{
			ModuleMst  moduleMst = modules.get(0);
			return moduleMst;
		}
	}

	public List<ModuleMst> getModules(String tenantId) 	throws OmniNGException {
		List<ModuleMst> modulesByTenant = super.findAllByTenant(tenantId);
		return modulesByTenant;
	}
}
