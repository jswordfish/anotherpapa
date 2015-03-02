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
import com.infrasofttech.domain.entities.ParamLoanAc;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IParamLoanAccntDao;

@Service("paramsLoanAcService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class ParamsLoanServiceImpl extends OmniNGServiceImpl<Long, ParamLoanAc>
		implements com.infrasofttech.omning.services.ParamsLoanService {

	private static final Logger logger = Logger.getLogger(ParamsLoanServiceImpl.class);
	@Autowired
	protected IParamLoanAccntDao paramLoanDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) paramLoanDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		paramLoanDAO.setEntityManager(entityManager);
	}

	//--------------------------------

	public ParamLoanAc getParamLoanByUniqueComposite(String tenantId, String moduleCode, String productCode,String branchCode,Date effFromDate) {
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("moduleCode", moduleCode);
		queryParams.put("productCode", productCode);
		queryParams.put("branchCode", branchCode);
		queryParams.put("effFromDate", effFromDate);
		@SuppressWarnings("unchecked")
		List<ParamLoanAc> paramLoanAcz = (List<ParamLoanAc>)findByNamedQueryAndNamedParams("ParamLoanMst.getParamLoanMst", 
				queryParams);
		if (paramLoanAcz == null) {
			return null;
		} else if (paramLoanAcz != null && paramLoanAcz.size() == 0) {
			return null;
		}
		return paramLoanAcz.get(0);
	}
	public ParamLoanAc getParamLoanByUniqueCompositeOfDisable(String tenantId, String moduleCode, String productCode,String branchCode,Date effFromDate) {
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("moduleCode", moduleCode);
		queryParams.put("productCode", productCode);
		queryParams.put("branchCode", branchCode);
		queryParams.put("effFromDate", effFromDate);
		@SuppressWarnings("unchecked")
		List<ParamLoanAc> paramLoanAcz = (List<ParamLoanAc>)findByNamedQueryAndNamedParams("ParamLoanMst.getParamLoanMstDisable", 
				queryParams);
		if (paramLoanAcz == null) {
			return null;
		} else if (paramLoanAcz != null && paramLoanAcz.size() == 0) {
			return null;
		}
		return paramLoanAcz.get(0);
	}
	
	public List<ParamLoanAc> getParamLoanMstBySetNo(String tenantId, String moduleCode, String productCode,Long setNo) {
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("moduleCode", moduleCode);
		queryParams.put("productCode", productCode);
		queryParams.put("setNumber", setNo);
		@SuppressWarnings("unchecked")
		List<ParamLoanAc> paramLoanAcz = (List<ParamLoanAc>)findByNamedQueryAndNamedParams("ParamLoanMst.getParamLoanMstBySetNo", 
				queryParams);
		if (paramLoanAcz == null) {
			return null;
		} else if (paramLoanAcz != null && paramLoanAcz.size() == 0) {
			return null;
		}
		return paramLoanAcz;
	}

	public ParamLoanAc saveOrUpdate(ParamLoanAc entity) throws OmniNGException {
		// Find out whether object exists or not
		ParamLoanAc paramLoanAc = getParamLoanByUniqueComposite(entity.getTenantId(), entity.getModuleCode(),
				entity.getProdCode(),entity.getBranchCode(),entity.getEffectiveFrom());
		if (paramLoanAc == null) {
			// create mode
			//TODO
			entity.setIsActive(true);
			return super.saveOrUpdate(entity);
		} else {
			// update
			Long id = paramLoanAc.getId();
			try{
				Mapper mapper = new DozerBeanMapper();
				mapper.map(entity, paramLoanAc);
			}catch(Exception e){
				e.printStackTrace();
			}
			paramLoanAc.setId(id);
			return super.saveOrUpdate(paramLoanAc);
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}