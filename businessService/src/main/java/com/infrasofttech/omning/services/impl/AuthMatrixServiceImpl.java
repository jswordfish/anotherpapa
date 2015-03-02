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
import com.infrasofttech.domain.entities.AuthMatrix;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IAuthMatrixMgmtDAO;
import com.infrasofttech.omning.IBranchMstDAO;
import com.infrasofttech.omning.ICurrencyMstDAO;
import com.infrasofttech.omning.services.AuthMatrixService;

@Service("authMatrixService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class AuthMatrixServiceImpl extends OmniNGServiceImpl<Long, AuthMatrix>
		implements AuthMatrixService {
	private static final Logger logger = Logger
			.getLogger(AuthMatrixServiceImpl.class);

	@Autowired
	protected IAuthMatrixMgmtDAO authMatrixMgmtDAO;

	@Autowired
	protected ICurrencyMstDAO currencyMstDAO;

	@Autowired
	protected IBranchMstDAO branchMstDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) authMatrixMgmtDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		authMatrixMgmtDAO.setEntityManager(entityManager);
	}

	public AuthMatrix saveOrUpdate(AuthMatrix entity) throws OmniNGException {
		System.out.println("INSIDE AUTHMATRIX SAVEORUPDATE()");
		AuthMatrix authMatrix = getAuthMatrixByUniqueComposite(entity.getId());
		if (authMatrix == null) {
			entity.setIsActive(true);
			System.out.println("Inside If...");
			return super.saveOrUpdate(entity);
		} else {
			System.out.println("Inside Else..");
			Long id = authMatrix.getId();

			try {
				System.out.println("Inside Try...");
				Mapper mapper = new DozerBeanMapper();
				mapper.map(entity, authMatrix);
			} catch (Exception e) {
				e.printStackTrace();
			}
			authMatrix.setId(id);
			entity.setIsActive(true);
			System.out.println("Updated Successfully.....");
			return super.saveOrUpdate(authMatrix);

		}

	}
	
	@SuppressWarnings("unchecked")
	public AuthMatrix getAuthMatrixByUniqueComposite(Long id) {
		System.out.println("getAuthMatrixByUniqueComposite(String tenantId) ");
		Map<String, Long> queryParams = new HashMap<String, Long>();
		queryParams.put("id", id);
		List<AuthMatrix> authMatrix = findByNamedQueryAndNamedParams(
				"AuthMatrix.getAuthMatrixByTenant", queryParams);
		if (authMatrix == null) {
			return null;
		} else if (authMatrix != null && authMatrix.size() == 0) {
			return null;
		}
		return authMatrix.get(0);
	}

	public AuthMatrix getAuthMatrixId() throws OmniNGException {
		AuthMatrix authMatrix=new AuthMatrix();
		authMatrix=authMatrixMgmtDAO.getId();
		return authMatrix;
	}


	/*
	 * public AuthMatrixSlab saveOrUpdate(AuthMatrixSlab entity) throws
	 * OmniNGException { AuthMatrixSlab authMatrixSlab =
	 * getAuthMatrixSlabByUniqueComposite(entity .getTenantId()); if
	 * (authMatrixSlab == null) { return saveOrUpdate(entity); } else { Mapper
	 * mapper = new DozerBeanMapper(); mapper.map(entity, authMatrixSlab);
	 * return saveOrUpdate(entity); } }
	 * 
	 * public AuthMatrixSlabUser saveOrUpdate(AuthMatrixSlabUser entity) throws
	 * OmniNGException { AuthMatrixSlabUser authMatrixSlabUser =
	 * getAuthMatrixSlabUserByUniqueComposite(entity .getTenantId()); if
	 * (authMatrixSlabUser == null) { return saveOrUpdate(entity); } else {
	 * Mapper mapper = new DozerBeanMapper(); mapper.map(entity,
	 * authMatrixSlabUser); return saveOrUpdate(entity); } }
	 * 
	 * public List<AuthMatrixSlab> getListById(Long authMatrixId) throws
	 * OmniNGException {
	 * 
	 * List<AuthMatrixSlab> authMatrixSlabs=new ArrayList<AuthMatrixSlab>();
	 * authMatrixSlabs=findAll(); Iterator<AuthMatrixSlab> it =
	 * authMatrixSlabs.iterator(); List<AuthMatrixSlab> list = new
	 * ArrayList<AuthMatrixSlab>(); AuthMatrixSlab ams = new AuthMatrixSlab();
	 * while(it.hasNext()){
	 * 
	 * ams = it.next();
	 * if(ams.getAuthMatrix().getAuthMatrixSlabs().equals(authMatrixId)){
	 * list.add(ams); } }
	 * 
	 * return list;
	 * 
	 * return null; }
	 * 
	 * public AuthMatrix getAuthMatrixDisableDetails(Long id) throws
	 * OmniNGException { AuthMatrix authMatrix = new AuthMatrix(); authMatrix =
	 * find(id); return authMatrix; }
	 * 
	 * public AuthMatrix getId() throws OmniNGException { // TODO Auto-generated
	 * method stub return null; }
	 * 
	 * public AuthEvent getListByid(Long id) throws OmniNGException { AuthEvent
	 * authEvent = new AuthEvent(); // authEvent=super.find(id); return
	 * authEvent; }
	 * 
	 * public AuthMatrix findMatrix(Long id) throws OmniNGException { AuthMatrix
	 * authMatrix = new AuthMatrix(); authMatrix = find(id); return authMatrix;
	 * }
	 * 
	 * private AuthMatrixSlab getAuthMatrixSlabByUniqueComposite(String
	 * tenantId) { Map<String, String> queryParams = new HashMap<String,
	 * String>(); queryParams.put("tenantId", tenantId);
	 * 
	 * List<AuthMatrixSlab> authMatrixSlab = findByNamedQueryAndNamedParams(
	 * "authMatrixSlab.getAuthMatrixSlabByTenant", queryParams); if
	 * (authMatrixSlab == null) { return null; } else if (authMatrixSlab != null
	 * && authMatrixSlab.size() == 0) { return null; } return
	 * authMatrixSlab.get(0); return null; }
	 * 
	 * private AuthMatrixSlabUser getAuthMatrixSlabUserByUniqueComposite( String
	 * tenantId) { Map<String, String> queryParams = new HashMap<String,
	 * String>(); queryParams.put("tenantId", tenantId);
	 * 
	 * List<AuthMatrixSlabUser> authMatrixSlabUser =
	 * findByNamedQueryAndNamedParams(
	 * "authMatrixSlabUser.getAuthMatrixSlabByTenant", queryParams); if
	 * (authMatrixSlabUser == null) { return null; } else if (authMatrixSlabUser
	 * != null && authMatrixSlabUser.size() == 0) { return null; } return
	 * authMatrixSlabUser.get(0); return null; }
	 */
	
}
