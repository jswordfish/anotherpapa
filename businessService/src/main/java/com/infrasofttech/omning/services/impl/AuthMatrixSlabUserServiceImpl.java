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
import com.infrasofttech.domain.entities.AuthMatrixSlabUser;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IAuthMatrixSlabUserDAO;
import com.infrasofttech.omning.services.AuthMatrixSlabUserService;

@Service("authMatrixSlabUserService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class AuthMatrixSlabUserServiceImpl extends
		OmniNGServiceImpl<Long, AuthMatrixSlabUser> implements
		AuthMatrixSlabUserService {
	private static final Logger logger = Logger
			.getLogger(AuthMatrixSlabUserServiceImpl.class);

	@Autowired
	protected IAuthMatrixSlabUserDAO authMatrixSlabUserDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) authMatrixSlabUserDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		authMatrixSlabUserDAO.setEntityManager(entityManager);
	}

	public AuthMatrixSlabUser saveOrUpdate(AuthMatrixSlabUser entity)
			throws OmniNGException {
		System.out.println("INSIDE AUTHMATRIX SAVEORUPDATE()");
		AuthMatrixSlabUser authMatrixSlabUser = getAuthMatrixSlabUserByUniqueComposite(entity.getId());
		if (authMatrixSlabUser == null) {
			entity.setIsActive(true);
			System.out.println("Inside If...");
			return super.saveOrUpdate(entity);
		} else {
			System.out.println("Inside Else..");
			Long id = authMatrixSlabUser.getId();

			try {
				System.out.println("Inside Try...");
				Mapper mapper = new DozerBeanMapper();
				mapper.map(entity, authMatrixSlabUser);
			} catch (Exception e) {
				e.printStackTrace();
			}
			authMatrixSlabUser.setId(id);
			entity.setIsActive(true);
			System.out.println("Updated Successfully.....");
			return super.saveOrUpdate(authMatrixSlabUser);

		}

	}

	@SuppressWarnings("unchecked")
	public AuthMatrixSlabUser getAuthMatrixSlabUserByUniqueComposite(Long id)
			throws OmniNGException {
		System.out.println("getAuthMatrixSlabUserByUniqueComposite(Long id) ");
		Map<String, Long> queryParams = new HashMap<String, Long>();
		queryParams.put("id", id);

		List<AuthMatrixSlabUser> authMatrixSlabUsers = findByNamedQueryAndNamedParams(
				"AuthMatrixSlabUser.getAuthMatrixSlabUserByTenant", queryParams);
		if (authMatrixSlabUsers == null) {
			return null;
		} else if (authMatrixSlabUsers != null
				&& authMatrixSlabUsers.size() == 0) {
			return null;
		}
		return authMatrixSlabUsers.get(0);
	}
}
