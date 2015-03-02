package com.infrasofttech.dao.basic;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


public class GenericDaoJpaImpl<T, PK extends Serializable> implements GenericDao<T, PK> {
	
	protected Class<T> entityClass;
	
	@PersistenceContext
	protected EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	public GenericDaoJpaImpl() {
	    ParameterizedType genericSuperclass = (ParameterizedType) getClass()
	         .getGenericSuperclass();
	    this.entityClass = (Class<T>) genericSuperclass.getActualTypeArguments()[0];
	}
	
	public T create(T t) {
		// TODO Auto-generated method stub
		return null;
	}

	public T read(PK id) {
		// TODO Auto-generated method stub
		return null;
	}

	public T update(T t) {
		// TODO Auto-generated method stub
		return null;
	}

	public int delete(T t) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
