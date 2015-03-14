package com.infrasofttech.dao.basic;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;

public interface JPADAO<E, K> {

	public void persist(E entity);

	public void remove(E entity);

	public E merge(E entity);

	public void refresh(E entity);

	public E findById(K id);

	public E flush(E entity);
	
	public E findUniqueByDynamicKey(String qry, String identifierKey, String identifierValue);

	public List<E> findAll();
	public List<E> find(int startFrom, int maxResults);

	public List<E> findAllByTenant(String tenantId);
	public List<E> findAllByTenantPg(String tenantId, int startFrom, int maxResults);
	public List<E> findDisabled(String tenantId);	
	public List<E> findDisabledPg(String tenantId, int startFrom, int maxResults);

	public Integer removeAll();

	public void setEntityManager(EntityManager entityManager);

	public List<E> findByNamedQueryAndNamedParams(final String queryName, final Map<String, ? extends Object> params);

	public List<E> findByNamedQueryAndNamedParams(final String queryName,
			final Map<String, ? extends Object> params, int startFrom, int maxResults);

	public int recordCount(final String name, final Map<String, ? extends Object> params);

}