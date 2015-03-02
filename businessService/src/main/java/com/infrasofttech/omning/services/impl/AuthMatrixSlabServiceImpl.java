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
import com.infrasofttech.domain.entities.AuthMatrixSlab;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IAuthMatrixSlabDAO;
import com.infrasofttech.omning.services.AuthMatrixSlabService;

@Service("authMatrixSlabService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class AuthMatrixSlabServiceImpl extends
		OmniNGServiceImpl<Long, AuthMatrixSlab> implements
		AuthMatrixSlabService {

	private static final Logger logger = Logger
			.getLogger(AuthMatrixSlabServiceImpl.class);

	@Autowired
	protected IAuthMatrixSlabDAO authMatrixSlabDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) authMatrixSlabDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		authMatrixSlabDAO.setEntityManager(entityManager);
	}

	public AuthMatrixSlab saveOrUpdate(AuthMatrixSlab entity)
			throws OmniNGException {
		System.out.println("INSIDE AUTHMATRIX SAVEORUPDATE()");
		AuthMatrixSlab authMatrixSlab = getAuthMatrixSlabByUniqueComposite(entity
				.getId());
		if (authMatrixSlab == null) {
			entity.setIsActive(true);
			System.out.println("Inside If...");
			return super.saveOrUpdate(entity);
		} else {
			System.out.println("Inside Else..");
			Long id = authMatrixSlab.getId();

			try {
				System.out.println("Inside Try...");
				Mapper mapper = new DozerBeanMapper();
				mapper.map(entity, authMatrixSlab);
			} catch (Exception e) {
				e.printStackTrace();
			}
			authMatrixSlab.setId(id);
			entity.setIsActive(true);
			System.out.println("Updated Successfully.....");
			return super.saveOrUpdate(authMatrixSlab);
		}
	}

	@SuppressWarnings("unchecked")
	public AuthMatrixSlab getAuthMatrixSlabByUniqueComposite(Long id)
			throws OmniNGException {
		System.out.println("getAuthMatrixSlabByUniqueComposite(Long id) ");
		Map<String, Long> queryParams = new HashMap<String, Long>();
		queryParams.put("id", id);
		List<AuthMatrixSlab> authMatrixSlab = findByNamedQueryAndNamedParams(
				"AuthMatrixSlab.getAuthMatrixSlabById", queryParams);
		if (authMatrixSlab == null) {
			return null;
		} else if (authMatrixSlab != null && authMatrixSlab.size() == 0) {
			return null;
		}
		return authMatrixSlab.get(0);
	}

}
