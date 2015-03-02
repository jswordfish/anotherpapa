package com.infrasofttech.omning.services.impl;

import java.util.ArrayList;
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
import com.infrasofttech.domain.entities.PrdAcNoMst;
import com.infrasofttech.domain.entities.PrdAcNumberConfig;
import com.infrasofttech.domain.entities.ProductMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IPrdAcNumberConfigDAO;
import com.infrasofttech.omning.IProductMstDAO;

@Service("prdAcNoConfigService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class PrdAcNoConfigServiceImpl extends OmniNGServiceImpl<Long, PrdAcNumberConfig>
		implements com.infrasofttech.omning.services.PrdAcNoConfigService {
	private static final Logger logger = Logger
			.getLogger(PrdAcNoConfigServiceImpl.class);

	@Autowired
	protected IPrdAcNumberConfigDAO prdAcNumberConfigDAO;
	
	@Autowired
	protected IProductMstDAO productMstDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) prdAcNumberConfigDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		prdAcNumberConfigDAO.setEntityManager(entityManager);
	}

	//-----------------------------------

	public PrdAcNumberConfig getPrdAcNumberConfigByUniqueComposite(
			String tenantId, String moduleCode, String productCode)
			throws OmniNGException {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("moduleCode", moduleCode);
		queryParams.put("productCode", productCode);
		@SuppressWarnings("unchecked")
		List<PrdAcNumberConfig> prdAcNumberConfigz = (List<PrdAcNumberConfig>)findByNamedQueryAndNamedParams("PrdAcNumberConfig.getPrdAcNumberConfig", 
				queryParams);
		if (prdAcNumberConfigz == null) {
			return null;
		} else if (prdAcNumberConfigz != null && prdAcNumberConfigz.size() == 0) {
			return null;
		}
		return prdAcNumberConfigz.get(0);
	}

	public PrdAcNumberConfig saveOrUpdate(PrdAcNumberConfig entity) throws OmniNGException {
		// Find out whether object exists or not
		PrdAcNumberConfig prdAcNumberConfig = getPrdAcNumberConfigByUniqueComposite(
				entity.getTenantId(), entity.getModuleCode(), entity.getProductCode());
		if (prdAcNumberConfig == null) {
			// create mode
			//TODO
			entity.setIsActive(true);
			return super.saveOrUpdate(entity);
		} else {
			// update
			Long id = prdAcNumberConfig.getId();
			try{
				Mapper mapper = new DozerBeanMapper();
				mapper.map(entity, prdAcNumberConfig);
			}catch(Exception e){
				e.printStackTrace();
			}
			prdAcNumberConfig.setId(id);
			return super.saveOrUpdate(prdAcNumberConfig);
		}
	}
	public List<ProductMst> getProductsByModule(String tenantId,String moduleCode)
	{
	Map<String, String> queryParams = new HashMap<String, String>();
	queryParams.put("tenantId", tenantId);
	queryParams.put("moduleCode", moduleCode);
	
	@SuppressWarnings("unchecked")
	List<ProductMst> products = (List<ProductMst>)findByNamedQueryAndNamedParams("PrdAcNumberConfig.getproductByModule", 
			queryParams);
	if (products == null) {
		return null;
	} else if (products != null && products.size() == 0) {
		return null;
	}
	return products;
}
	
	public PrdAcNumberConfig enablePrdAcNo(
			String tenantId, String moduleCode, String productCode) 
				throws OmniNGException{
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantId", tenantId);
	
		queryParams.put("moduleCode", moduleCode);
		queryParams.put("productCode", productCode);
	
		@SuppressWarnings("unchecked")
		List<PrdAcNumberConfig> prdAcNoz = (List<PrdAcNumberConfig>)findByNamedQueryAndNamedParams("PrdAcNumberConfig.getDisabledPrdAcNo", 
				queryParams);
		if (prdAcNoz == null) {
			throw new OmniNGException(":::Account NOT Found");
		} else {
			// set active to true
			prdAcNoz.get(0).setIsActive(true);
			return super.saveOrUpdate(prdAcNoz.get(0));
		}
	}

	public PrdAcNumberConfig disablePrdAcNo(String tenantId,String moduleCode, String productCode)
			throws OmniNGException {
		PrdAcNumberConfig prdAcNo = getPrdAcNumberConfigByUniqueComposite(tenantId,moduleCode, productCode);
		if (prdAcNo == null) {
			throw new OmniNGException();
		} else {
			// set active to false
			prdAcNo.setIsActive(false);
			return super.saveOrUpdate(prdAcNo);
		}
	}
	public List<PrdAcNumberConfig> getDisabledPrdAcNo(String tenantId) throws OmniNGException {
		List<PrdAcNumberConfig> prdAcNoz = new ArrayList<PrdAcNumberConfig>();
		prdAcNoz = findDisabled(tenantId);
		
				
		return prdAcNoz;
	}

	
}
