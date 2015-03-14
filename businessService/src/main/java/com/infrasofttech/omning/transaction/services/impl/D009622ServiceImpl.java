package com.infrasofttech.omning.transaction.services.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.persistence.EntityManager;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import antlr.collections.List;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.transaction.runtime.D009622;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.impl.OmniNGServiceImpl;
import com.infrasofttech.omning.transaction.ID009622DAO;
import com.infrasofttech.omning.transaction.services.D009622Service;
@Service("d009622Service")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class D009622ServiceImpl extends OmniNGServiceImpl<Long, D009622>
implements D009622Service {

	private static final Logger logger = Logger
		.getLogger(D009622ServiceImpl.class);
	@Autowired
	protected ID009622DAO d009622dao;
	
	@PostConstruct
	public void init() throws Exception {
	super.setDAO((JPADAO) d009622dao);
	}
	
	@PreDestroy
	public void destroy() {
	}
	
	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		d009622dao.setEntityManager(entityManager);
	}
	
	public D009622 getD009622ByProductAccId(String PrdAcctId){
		Map<String, String> params = new HashMap<String, String>();
		params.put("PrdAcctId", PrdAcctId);
		String qryName = "D009622.getUniqueD009622";
		java.util.List<D009622> list = super.findByNamedQueryAndNamedParams(qryName, params);
		if(list.size() == 0){
			return null;
		}
		else{
			return list.get(0);
		}
		
	}

	
}