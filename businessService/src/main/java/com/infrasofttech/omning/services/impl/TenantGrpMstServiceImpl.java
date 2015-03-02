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
import com.infrasofttech.domain.entities.TenantGrpMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.ITenantGrpMstDAO;

@Service("tenantGrpMstService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class TenantGrpMstServiceImpl extends OmniNGServiceImpl<Long, TenantGrpMst>
		implements com.infrasofttech.omning.services.TenantGrpMstService {
	private static final Logger logger = Logger.getLogger(TenantGrpMstServiceImpl.class);
	
	@Autowired	
	protected ITenantGrpMstDAO tenantGrpMstDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) tenantGrpMstDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		tenantGrpMstDAO.setEntityManager(entityManager);
	}

	//-------------------------------
	
	
	public TenantGrpMst getTenantGrpMstByUniqueComposite(String tenantGrpCode) {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantGrpCode", tenantGrpCode);
		@SuppressWarnings("unchecked")
		List<TenantGrpMst> tenantGrps = (List<TenantGrpMst>)findByNamedQueryAndNamedParams("TenantGrpMst.getTenantGrpMst", 
				queryParams);
		if (tenantGrps == null) {
			return null;
		} else if (tenantGrps != null && tenantGrps.size() == 0) {
			return null;
		}
		return tenantGrps.get(0);
	}
		
	public List<TenantGrpMst> getTenantGrpMst(String tenantGrpCode) throws OmniNGException {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantGrpCode", tenantGrpCode);
		@SuppressWarnings({"unchecked"})
		List<TenantGrpMst> tenantGrps = (List<TenantGrpMst>)findByNamedQueryAndNamedParams("TenantGrpMst.getTenantGrpMst", 
				queryParams);
		if(tenantGrps==null){
			throw new OmniNGException(":::No TenantGrpMst");
		}else if(tenantGrps!=null && tenantGrps.size()==0){
			throw new OmniNGException(":::No TenantGrpMst");
		}
	
		return tenantGrps;
	}
	
	
	public List<TenantGrpMst> getTenantGrpMstWithoutFilter() throws OmniNGException {
		Map<String, String> queryParams = new HashMap<String, String>();
		@SuppressWarnings({"unchecked"})
		List<TenantGrpMst> tenantGrps = (List<TenantGrpMst>)findByNamedQueryAndNamedParams("TenantGrpMst.getTenantGrpMstWithoutFilter", 
				queryParams);
		if(tenantGrps==null){
			throw new OmniNGException(":::No TenantGrpMst");
		}else if(tenantGrps!=null && tenantGrps.size()==0){
			throw new OmniNGException(":::No TenantGrpMst");
		}
	
		return tenantGrps;
	}
	
	

	public TenantGrpMst saveOrUpdate(TenantGrpMst entity) throws OmniNGException {
		// Find out whether object exists or not
		TenantGrpMst tenantGrpMst = getTenantGrpMstByUniqueComposite(entity.getTenantGrpCode());
		if (tenantGrpMst == null) {
			// create mode
			entity.setIsActive(true);
			return super.saveOrUpdate(entity);
		} else {
			// update
			String grpCode= tenantGrpMst.getTenantGrpCode();
			tenantGrpMst.setTenantGrpCode(grpCode);
			try{
				Mapper mapper = new DozerBeanMapper();
				mapper.map(entity, tenantGrpMst);
			}catch(Exception e){
				e.printStackTrace();
			}			
			entity.setIsActive(true);
			return super.saveOrUpdate(tenantGrpMst);
		}
	}

	public TenantGrpMst enableTenantGrpMst(String tenantGrpCode) throws OmniNGException {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantGrpCode", tenantGrpCode);
		@SuppressWarnings("unchecked")
		List<TenantGrpMst> tenantGrps = (List<TenantGrpMst>)findByNamedQueryAndNamedParams("TenantGrpMst.getDisabledTenantGrpMst", 
				queryParams);
		
		if (tenantGrps == null || tenantGrps.size()==0) {
			throw new OmniNGException(":::TenantGrpMst NOT Found");
		} else {
			// set active to true
			TenantGrpMst tenantGrpMst = tenantGrps.get(0);
			tenantGrpMst.setIsActive(true);
			return super.saveOrUpdate(tenantGrpMst);
		}
	}

	public TenantGrpMst disableTenantGrpMst(String tenantGrpCode) throws OmniNGException {
		TenantGrpMst tenantGrpMst = getTenantGrpMstByUniqueComposite(tenantGrpCode);
		if (tenantGrpMst == null) {
			throw new OmniNGException();
		} else {
			// set active to false
			tenantGrpMst.setIsActive(false);
			return super.saveOrUpdate(tenantGrpMst);
		}
	}
}
