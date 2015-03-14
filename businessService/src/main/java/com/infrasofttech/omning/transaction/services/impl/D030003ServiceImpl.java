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

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.transaction.runtime.D009622;
import com.infrasofttech.domain.entities.transaction.runtime.D030003;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.impl.OmniNGServiceImpl;
import com.infrasofttech.omning.transaction.ID030003DAO;
import com.infrasofttech.omning.transaction.services.D030003Service;
@Service("d030003Service")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class D030003ServiceImpl extends OmniNGServiceImpl<Long, D030003>
implements D030003Service {

	private static final Logger logger = Logger
		.getLogger(D030003ServiceImpl.class);
	@Autowired
	protected ID030003DAO d030003dao;
	
	@PostConstruct
	public void init() throws Exception {
	super.setDAO((JPADAO) d030003dao);
	}
	
	@PreDestroy
	public void destroy() {
	}
	
	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		d030003dao.setEntityManager(entityManager);
	}

	public D030003 getD030003ByProductAccId(String PrdAcctId){
		Map<String, String> params = new HashMap<String, String>();
		params.put("PrdAcctId", PrdAcctId);
		String qryName = "D030003.getUniqueD030003";
		java.util.List<D030003> list = super.findByNamedQueryAndNamedParams(qryName, params);
		if(list.size() == 0){
			return null;
		}
		else{
			return list.get(0);
		}
	}
}