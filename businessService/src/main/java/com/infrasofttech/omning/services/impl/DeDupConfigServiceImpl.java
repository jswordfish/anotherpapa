package com.infrasofttech.omning.services.impl;

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
import com.infrasofttech.domain.entities.DeDupConfig;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IDeDupConfigDAO;

@Service("deDupConfigService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class DeDupConfigServiceImpl extends
		OmniNGServiceImpl<Long, DeDupConfig> implements
		com.infrasofttech.omning.services.DeDupConfigService {
	@Autowired
	protected IDeDupConfigDAO deDupConfigDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) deDupConfigDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		deDupConfigDAO.setEntityManager(entityManager);
	}

	public DeDupConfig getDeDupConfigByUniqueComposite(String tenantId,
			String refDoc, Integer seqNumVal) {
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("refDoc", refDoc);
		queryParams.put("seqNumVal", seqNumVal);
		@SuppressWarnings("unchecked")
		List<DeDupConfig> deDupConfigs = (List<DeDupConfig>) findByNamedQueryAndNamedParams(
				"DeDupConfig.getDeDupConfig", queryParams);
		if (deDupConfigs == null) {
			return null;
		} else if (deDupConfigs != null && deDupConfigs.size() == 0) {
			return null;
		}
		return deDupConfigs.get(0);
	}

	public DeDupConfig saveOrUpdate(DeDupConfig entity) throws OmniNGException {
		// Find out whether object exists or not
		DeDupConfig deDupConfig = getDeDupConfigByUniqueComposite(
				entity.getTenantId(), entity.getRefDoc(), entity.getSeqNumVal());
		if (deDupConfig == null) {
			// create mode
			entity.setIsActive(true);
			return super.saveOrUpdate(entity);
		} else {
			// update
			Long id = deDupConfig.getId();
			try {
				Mapper mapper = new DozerBeanMapper();
				mapper.map(entity, deDupConfig);
			} catch (Exception e) {
				e.printStackTrace();
			}
			deDupConfig.setId(id);
			entity.setIsActive(true);
			return super.saveOrUpdate(deDupConfig);
		}
	}

}
