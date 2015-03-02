package com.infrasofttech.omning.services.impl;

import java.util.Date;
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
import com.infrasofttech.domain.entities.AppConfig;
import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.domain.entities.CropTypeParam;
import com.infrasofttech.domain.entities.ParamLoanAc;
import com.infrasofttech.domain.entities.UserMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IBranchMstDAO;
import com.infrasofttech.omning.ICropTypeParamDAO;
import com.infrasofttech.omning.IProductMstDAO;
import com.infrasofttech.omning.services.BranchMstService;
import com.infrasofttech.omning.services.CropTypeParamService;

@Service("cropTypeParamService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class CropTypeParamServiceImpl extends OmniNGServiceImpl<Long, CropTypeParam>
		implements CropTypeParamService {
	private static final Logger logger = Logger.getLogger(CropTypeParamServiceImpl.class);
	
	
	@Autowired
	protected ICropTypeParamDAO cropTypeParamDAO;
	
	

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) cropTypeParamDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		cropTypeParamDAO.setEntityManager(entityManager);
	}

	

	public List<CropTypeParam> getCropType(String tenantCode)
			throws OmniNGException {		
		List<CropTypeParam> cropTypeByTenant = super.findAllByTenant(tenantCode);
		return cropTypeByTenant;
	}
	
	//-------------------------------
	
	public CropTypeParam saveOrUpdate(CropTypeParam entity)throws OmniNGException{
		CropTypeParam cropTypeParam = getUniqueCropTypeParam(entity.getTenantId(), entity.getCropType(), entity.getFromDate());
		if (cropTypeParam == null) {
			//-----------> create mode
			return super.saveOrUpdate(entity);
		} else {
			Mapper mapper = new DozerBeanMapper();
			long id = cropTypeParam.getId();
			mapper.map(entity, cropTypeParam);
			cropTypeParam.setId(id);
			return super.saveOrUpdate(cropTypeParam);

		}
	}
	
	

	public CropTypeParam getUniqueCropTypeParam(String tenantId, String cropType,
				Date fromDate) throws OmniNGException {
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("cropType", cropType);
		queryParams.put("fromDate", fromDate);
		@SuppressWarnings("unchecked")
		List<CropTypeParam> cropTypeParam = 
		(List<CropTypeParam>)findByNamedQueryAndNamedParams("CropTypeParam.getUniqueCropType",queryParams);
		if (cropTypeParam == null) {
			return null;
		} else if (cropTypeParam != null && cropTypeParam.size() == 0) {
			return null;
		}
		return cropTypeParam.get(0);
	}

	public CropTypeParam getDisabledCropType(String tenantId, String cropType,
			Date fromDate) throws OmniNGException {
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("cropType", cropType);
		queryParams.put("fromDate",fromDate);
		
		@SuppressWarnings("unchecked")
		List<CropTypeParam> cropTypes = (List<CropTypeParam>)
				findByNamedQueryAndNamedParams("CropTypeParam.getDisableCropType",queryParams);
		if (cropTypes == null) {
			return null;
		} else if (cropTypes != null && cropTypes.size() == 0) {
			return null;
		}
		return cropTypes.get(0);

	}
	
}
