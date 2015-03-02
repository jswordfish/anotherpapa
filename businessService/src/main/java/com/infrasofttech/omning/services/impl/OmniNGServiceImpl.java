package com.infrasofttech.omning.services.impl;

import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.OmniNGService;

public class OmniNGServiceImpl<K, E> implements OmniNGService {

	private JPADAO dao;

	protected Class<E> entityClass;

	@SuppressWarnings("unchecked")
	public OmniNGServiceImpl() {
		ParameterizedType genericSuperclass = (ParameterizedType) getClass()
				.getGenericSuperclass();
		this.entityClass = (Class<E>) genericSuperclass
				.getActualTypeArguments()[1];
	}

	public void setEntityManagerOnDao(EntityManager entityManager) {
		dao.setEntityManager(entityManager);

	}

	protected void setDAO(JPADAO<K, E> dAO) {
		this.dao = dAO;
	}

	public E find(long id) throws OmniNGException {
		try {
			return (E) dao.findById(id);
		} catch (Exception e) {
			throw new OmniNGException(entityClass.getName() + " - not found ", e);
		}
	}

	public List<E> findAll() throws OmniNGException {
		try {
			return dao.findAll();
		} catch (Exception e) {
			throw new OmniNGException(entityClass.getName() + " - ", e);
		}
	}

	@SuppressWarnings("unchecked")
	public List<E> findAllByTenant(String tenantId) throws OmniNGException {
		try {
			return dao.findAllByTenant(tenantId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new OmniNGException(entityClass.getName() + " - ", e);
		}
	}

	@SuppressWarnings("unchecked")
	public List<E> findAllByTenantPg(String tenantId, Integer startFrom, Integer maxResults) throws OmniNGException {
		try {
			int i = 9;
			i=i+1;
			return dao.findAllByTenantPg(tenantId, startFrom, maxResults);
		} catch (Exception e) {
			throw new OmniNGException(entityClass.getName() + " - ", e);
		}
	}

	public List<E> findDisabled(String tenantId) throws OmniNGException {
		try {
			return dao.findDisabled(tenantId);
		} catch (Exception e) {
			throw new OmniNGException(entityClass.getName() + " - ", e);
		}
	}

	public List<E> findDisabledPg(String tenantId, Integer startFrom, Integer maxResults) throws OmniNGException {
		try {
			return dao.findDisabledPg(tenantId, startFrom, maxResults);
		} catch (Exception e) {
			throw new OmniNGException(entityClass.getName() + " - ", e);
		}
	}

	public List<E> find(int startFrom, int maxResults) throws OmniNGException {
		try {
			return dao.find(startFrom, maxResults);
		} catch (Exception e) {
			throw new OmniNGException(entityClass.getName() + " - ", e);
		}
	}

	public void save(Object entity) throws OmniNGException {
		try {
			dao.persist(entity);
		} catch (Exception e) {
			e.printStackTrace();
			throw new OmniNGException(entityClass.getName() + " - ", e);
		}

	}

	public E update(Object entity) throws OmniNGException {
		try {
			dao.merge(entity);
			return (E) dao.flush(entity);
		} catch (Exception e) {
			e.printStackTrace();
			throw new OmniNGException(entityClass.getName() + " - ", e);
		}
	}

	public E saveOrUpdate(Object entity) throws OmniNGException {
		try {
			entity = dao.merge(entity);
			return (E) dao.flush(entity);
		} catch (Exception e) {
			e.printStackTrace();
			throw new OmniNGException(entityClass.getName() + " - ", e);
		}

	}

	public void delete(long id) throws OmniNGException {
		E e = null;
		try {
			e = find(id);
			if (e == null) {
				throw new OmniNGException(entityClass.getName() + " - ");
			}
		} catch (Exception e1) {
			throw new OmniNGException(entityClass.getName() + " - ", e1);
		}

		try {
			if (e != null) {
				dao.remove(e);
				dao.flush(e);
			}
		} catch (Exception e1) {
			throw new OmniNGException(entityClass.getName() + " - ", e1);
		}

	}

	public void deleteIfExisting(long id) throws Exception {
		try {
			E e = find(id);
			if (e != null) {
				dao.remove(e);
				dao.flush(e);
			}
		} catch (Exception e) {
			throw new OmniNGException(entityClass.getName() + " - ", e);
		}

	}

	public List findByNamedQueryAndNamedParams(String queryName, Map params) {
		// TODO Auto-generated method stub
		return dao.findByNamedQueryAndNamedParams(queryName, params);
	}

	public List findByNamedQueryAndNamedParams(String queryName, Map params,
			int startFrom, int maxResults) {
		return dao.findByNamedQueryAndNamedParams(queryName, params, startFrom,
				maxResults);
	}

	public int recordCount(String name, Map params) {
		return dao.recordCount(name, params);
	}

}
