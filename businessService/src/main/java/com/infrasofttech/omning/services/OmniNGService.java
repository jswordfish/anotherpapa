package com.infrasofttech.omning.services;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;

import com.infrasofttech.exceptions.OmniNGException;

public interface OmniNGService<Long, E> {

	/**
	 * This allows business service impls to set JPA Entity Managers on daos
	 * only when business service impls are called from JUnit test cases that
	 * does not run in a J2EE conatiner. There is a need to do this since jUNit
	 * test cases
	 * 
	 * @param entityManager
	 * @throws Exception
	 */
	public void setEntityManagerOnDao(EntityManager entityManager)
			throws Exception;

	public E find(long id) throws OmniNGException;

	public List<E> findAll() throws OmniNGException;
	
	public List<E> find(int startFrom, int maxResults) throws OmniNGException;

//	public List<E> find(String tenantId, int startFrom, int maxResults) throws OmniNGException;

	public List<E> findAllByTenant(String tenantId) throws OmniNGException;
	public List<E> findAllByTenantPg(String tenantId, Integer startFrom, Integer maxResults) throws OmniNGException;
	public List<E> findDisabled(String tenantId) throws OmniNGException;
	public List<E> findDisabledPg(String tenantId, Integer startFrom, Integer maxResults) throws OmniNGException;
	
	public void save(E entity) throws OmniNGException;

	public E update(E entity) throws OmniNGException;

	public E saveOrUpdate(E entity) throws OmniNGException;

	/**
	 * Will throw an exception if entity to be deleted is not found.
	 * 
	 * @param id
	 * @throws OmniNGException
	 */
	public void delete(long id) throws OmniNGException;

	/**
	 * Will not throw an exception if entity to be deleted is not found. Will
	 * return gracefully.
	 * 
	 * @param id
	 * @throws Exception
	 */
	public void deleteIfExisting(long id) throws Exception;

	/**
	 * Find using a named query.
	 * 
	 * @param queryName
	 *            the name of the query
	 * @param params
	 *            the query parameters
	 * 
	 * @return the list of entities
	 */
	public List<E> findByNamedQueryAndNamedParams(final String queryName,
			final Map<String, ? extends Object> params);

	public List<E> findByNamedQueryAndNamedParams(final String queryName,
			final Map<String, ? extends Object> params, int startFrom,
			int maxResults);

	public int recordCount(final String name,
			final Map<String, ? extends Object> params);

}