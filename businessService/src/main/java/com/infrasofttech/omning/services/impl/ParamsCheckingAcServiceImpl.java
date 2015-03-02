package com.infrasofttech.omning.services.impl;

import java.util.Date;
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
import com.infrasofttech.domain.entities.ParamCheckingAc;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IParamCheckingAcDAO;

@Service("paramsCheckingAcService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class ParamsCheckingAcServiceImpl extends
		OmniNGServiceImpl<Long, ParamCheckingAc> implements
		com.infrasofttech.omning.services.ParamsCheckingAcService {

	@Autowired
	protected IParamCheckingAcDAO paramCheckingAcDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) paramCheckingAcDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		paramCheckingAcDAO.setEntityManager(entityManager);
	}

	// ---------------------------

	public ParamCheckingAc getParamCheckingAcByUniqueComposite(String tenantId,
			String moduleCode, String productCode, String branchCode, Date effFromDate)
			throws OmniNGException {
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("moduleCode", moduleCode);
		queryParams.put("productCode", productCode);
		queryParams.put("branchCode", branchCode);
		queryParams.put("effFromDate", effFromDate);

		@SuppressWarnings("unchecked")
		List<ParamCheckingAc> paramCheckingAcz = (List<ParamCheckingAc>) findByNamedQueryAndNamedParams(
				"ParamCheckingAc.getParamCheckingAcMst", queryParams);
		if (paramCheckingAcz == null) {
			return null;
		} else if (paramCheckingAcz != null && paramCheckingAcz.size() == 0) {
			return null;
		}
		return paramCheckingAcz.get(0);
	}

	public ParamCheckingAc getParamCheckingAcByUniqueCompositeOfDisable(
			String tenantId, String moduleCode, String productCode,
			String branchCode,Date effFromDate) throws OmniNGException {
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("moduleCode", moduleCode);
		queryParams.put("productCode", productCode);
		queryParams.put("branchCode", branchCode);
		queryParams.put("effFromDate", effFromDate);
		@SuppressWarnings("unchecked")
		List<ParamCheckingAc> paramCheckingAcz = (List<ParamCheckingAc>) findByNamedQueryAndNamedParams(
				"ParamCheckingAc.getParamCheckingAcMstDisable", queryParams);
		if (paramCheckingAcz == null) {
			return null;
		} else if (paramCheckingAcz != null && paramCheckingAcz.size() == 0) {
			return null;
		}
		return paramCheckingAcz.get(0);
	}

	public List<ParamCheckingAc> getParamCheckingAcBysetNO(String tenantId,
			String moduleCode, String productCode, Long setNumber)
			throws OmniNGException {

		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("moduleCode", moduleCode);
		queryParams.put("productCode", productCode);
		queryParams.put("setNumber", setNumber);

		@SuppressWarnings("unchecked")
		List<ParamCheckingAc> paramCheckingAcz = (List<ParamCheckingAc>) findByNamedQueryAndNamedParams(
				"ParamCheckingAc.getParamCheckingAcMstBySetNo", queryParams);
		if (paramCheckingAcz == null) {
			return null;
		} else if (paramCheckingAcz != null && paramCheckingAcz.size() == 0) {
			return null;
		}
		return paramCheckingAcz;
	}

	public ParamCheckingAc saveOrUpdate(ParamCheckingAc entity)
			throws OmniNGException {
		// Find out whether object exists or not
		ParamCheckingAc paramCheckingAc = getParamCheckingAcByUniqueComposite(
				entity.getTenantId(), entity.getModuleCode(),
				entity.getProdCode(), entity.getBranchCode(),entity.getEffectiveFrom());
		if (paramCheckingAc == null) {
			// create mode
			// TODO
			entity.setIsActive(true);
			return super.saveOrUpdate(entity);
		} else {
			// update
			Long id = paramCheckingAc.getId();
			try {
				Mapper mapper = new DozerBeanMapper();
				// paramCheckingAc.setId(id);
				mapper.map(entity, paramCheckingAc);
			} catch (Exception e) {
				e.printStackTrace();
			}
			paramCheckingAc.setId(id);
			return super.saveOrUpdate(paramCheckingAc);
		}
	}
}
