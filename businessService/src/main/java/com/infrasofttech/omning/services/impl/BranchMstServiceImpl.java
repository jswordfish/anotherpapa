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
import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.domain.entities.UserMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IBranchMstDAO;
import com.infrasofttech.omning.IProductMstDAO;
import com.infrasofttech.omning.services.BranchMstService;

@Service("branchMstService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class BranchMstServiceImpl extends OmniNGServiceImpl<Long, BranchMst>
		implements BranchMstService {
	private static final Logger logger = Logger.getLogger(BranchMstServiceImpl.class);
	
	
	@Autowired
	protected IBranchMstDAO branchMstDAO;
	
	@Autowired
	protected IProductMstDAO productMstDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) branchMstDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		branchMstDAO.setEntityManager(entityManager);
	}

	public BranchMst getBranchMst(String tenantId, String branchCode)
			throws OmniNGException {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("branchCode", branchCode);
		List<BranchMst> branches = (List<BranchMst>)findByNamedQueryAndNamedParams("BranchMst.getBranchMst", queryParams);
		if(branches==null){
			throw new OmniNGException();
		}else if(branches != null && branches.size()==0){
			return null;
		}else{
			BranchMst  branchMst = branches.get(0);
			return branchMst;
		}
	}

	public List<BranchMst> getBranches(String tenantCode)
			throws OmniNGException {
		// TODO Auto-generated method stub
		List<BranchMst> branchesByTenant = super.findAllByTenant(tenantCode);
		return branchesByTenant;
	}
	
	//-------------------------------
	
	public BranchMst saveOrUpdate(BranchMst branchMst)throws OmniNGException{
		BranchMst branchMst2 = getBranchMst(branchMst.getTenantId(), branchMst.getBranchCode());
		if (branchMst2 == null) {
			//-----------> create mode
			return super.saveOrUpdate(branchMst);
		} else {
			Mapper mapper = new DozerBeanMapper();
			long id = branchMst2.getId();
			mapper.map(branchMst, branchMst2);
			branchMst2.setId(id);
			return super.saveOrUpdate(branchMst2);

		}
	}
	
	public BranchMst disableBranch(String tenantId, String branchCode ) throws OmniNGException{
		BranchMst branchMst = getBranchMst(tenantId, branchCode);
		if (branchMst == null) {
			throw new OmniNGException();
		} else {
			// set active to false
			branchMst.setIsActive(false);
			return saveOrUpdate(branchMst);
		}
	}
	
}
