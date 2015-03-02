package com.infrasofttech.omning.services.impl;

import java.util.ArrayList;
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
import com.infrasofttech.domain.entities.TenantMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.ITenantMstDAO;
import com.infrasofttech.omning.impl.TenantMstDAO;
import com.infrasofttech.omning.services.TenantMstService;

@Service("tenantMstService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class TenantMstServiceImpl extends OmniNGServiceImpl<Long, TenantMst> 
implements TenantMstService {

	private static final Logger logger = Logger.getLogger(TenantMstServiceImpl.class);

	@Autowired
	protected ITenantMstDAO tenantMstDAO;
	
	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) tenantMstDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		tenantMstDAO.setEntityManager(entityManager);
	}
	
	//-------------------------------
	
	public TenantMst getTenantMstByCode(String tenantCode) {
		List<TenantMst> tenants = new ArrayList<TenantMst>();
		Map<String, String> params = new HashMap<String, String>();
		params.put("tenantId", tenantCode);
		
		tenants = (List<TenantMst>)tenantMstDAO.findByNamedQueryAndNamedParams("TenantMst.getTenantMst", params);
		
		return tenants.get(0);
	}
	
	public TenantMst getTenantMst(String tenantCode,String tenantGrpCode)
			throws OmniNGException {
		TenantMst tenantMst= new TenantMst();
		try {
			System.out.println("in userservice impl");
			TenantMstDAO  tenantMstDAO = new TenantMstDAO();
//			tenantMst = tenantMstDAO.getTenantMst(tenantCode,tenantGrpCode);
			
		} catch (Exception e) {
			throw new OmniNGException(e.getMessage());
		}

		return tenantMst;
	}
	
	public List<TenantMst> getTenants(String tenantGrpCode)
			throws OmniNGException {
		List<TenantMst> tenantMsts = new ArrayList<TenantMst>();
		try {
			System.out.println("in userservice impl");
			TenantMstDAO  tenantMstDAO = new TenantMstDAO();
//			tenantMsts = tenantMstDAO.getTenants(tenantGrpCode);
			
		} catch (Exception e) {
			throw new OmniNGException(e.getMessage());
		}

		return tenantMsts;
	}

	public TenantMst findByURL(String url) throws OmniNGException {
		TenantMst tenantMst = new TenantMst();
		
		Map<String, String> qParams = new HashMap<String, String>();
		qParams.put("tenantURL", url);
		List<TenantMst> tenants = tenantMstDAO.findByNamedQueryAndNamedParams("TenantMst.getTenantFromURL", qParams);
		tenantMst = tenants.get(0);
		System.out.println("TENANT ID: " + tenantMst.getTenantId());
		return tenantMst;
	}

	

}
