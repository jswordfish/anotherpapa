package com.infrasofttech.omning.transaction.services.impl;

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
import com.infrasofttech.domain.entities.transaction.Screen;
import com.infrasofttech.domain.entities.transaction.ScreenMapper;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.impl.OmniNGServiceImpl;
import com.infrasofttech.omning.transaction.IScreenMapperDAO;
import com.infrasofttech.omning.transaction.services.ScreenMapperService;
@Service("screenMapperService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class ScreenMapperServiceImpl extends OmniNGServiceImpl<Long, ScreenMapper>
implements ScreenMapperService {

private static final Logger logger = Logger
	.getLogger(ScreenMapperServiceImpl.class);
@Autowired
protected IScreenMapperDAO screenMapperDAO;

@PostConstruct
public void init() throws Exception {
super.setDAO((JPADAO) screenMapperDAO);
}

@PreDestroy
public void destroy() {
}

@Override
public void setEntityManagerOnDao(EntityManager entityManager) {
	screenMapperDAO.setEntityManager(entityManager);
}

public ScreenMapper saveOrUpdate(ScreenMapper screenMapper)
		throws OmniNGException {
	// TODO Auto-generated method stub
	if(screenMapper.getTenantId() == null || screenMapper.getModuleCode() == null || screenMapper.getProductCode() == null || screenMapper.getActivityCode() == null || screenMapper.getBranchCode() == null) {
		throw new OmniNGException("");
	}
	
	String qryName = "ScreenMapper.getUniqueScreenMapper";
	Map<String, String> params = new HashMap<String, String>();
	params.put("tenantId",  screenMapper.getTenantId());
	params.put("moduleCode",  screenMapper.getModuleCode());
	params.put("productCode",  screenMapper.getProductCode());
	params.put("activityCode", screenMapper.getActivityCode());
	params.put("branchCode", screenMapper.getBranchCode());
	List<ScreenMapper> screenMappers = super.findByNamedQueryAndNamedParams(qryName, params);
	if(screenMappers.size() == 0) {
		//create
		return super.saveOrUpdate(screenMapper);
	}
	else if(screenMappers.size() > 1){
		throw new OmniNGException("Can not have more than 1 screen mappers for the unique combination");
	}
	else {
		//update
		ScreenMapper screenMapperDB = screenMappers.get(0);
		long id = screenMapperDB.getId();
		Screen tS = screenMapper.getTransactionScreen();
		screenMapper.setTransactionScreen(null);
		Screen bS = screenMapper.getBalancesScreen();
		screenMapper.setBalancesScreen(null);
		Screen iS = screenMapper.getInfoScreen();
		screenMapper.setInfoScreen(null);
		Mapper mapper = new DozerBeanMapper();
		mapper.map(screenMapper, screenMapperDB);
		screenMapperDB.setId(id);
		screenMapperDB.setTransactionScreen(tS);
		screenMapperDB.setBalancesScreen(bS);
		screenMapperDB.setInfoScreen(iS);
		screenMapper = super.saveOrUpdate(screenMapperDB);
		return screenMapper;
	}
	
	
}


}
