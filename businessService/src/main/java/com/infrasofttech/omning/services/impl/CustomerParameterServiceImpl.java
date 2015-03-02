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
import com.infrasofttech.domain.entities.CustomerParameter;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.ICustomerParameterDao;
import com.infrasofttech.omning.services.CustomerParameterService;

@Service("customerParameterService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class CustomerParameterServiceImpl extends OmniNGServiceImpl<Long, CustomerParameter>
		implements CustomerParameterService {
	private static final Logger logger = Logger.getLogger(CustomerParameterServiceImpl.class);

	@Autowired
	protected ICustomerParameterDao customerParameterDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) customerParameterDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		customerParameterDAO.setEntityManager(entityManager);
	}

	//-------------------------------

	public CustomerParameter getCustomerParameter(String tenantId, String customerCode)	throws OmniNGException {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("customerCode", customerCode);
		List<CustomerParameter> custParams = (List<CustomerParameter>)findByNamedQueryAndNamedParams("CustParam.getCustParam", queryParams);
		if(custParams == null){
			throw new OmniNGException();
		}else if(custParams != null && custParams.size()==0){
			return null;
		}else{
			CustomerParameter customerParameter = custParams.get(0);
			return customerParameter;
		}
	}
	
	public CustomerParameter saveOrUpdate(CustomerParameter customerParameter)throws OmniNGException{
		CustomerParameter customerParameter2 = getCustomerParameter(customerParameter.getTenantId(), 
														customerParameter.getCutomerCode());
		if (customerParameter2 == null) {
			//-----------> create mode
			return super.saveOrUpdate(customerParameter);
		} else {
			Mapper mapper = new DozerBeanMapper();
			Long id = customerParameter2.getId();
			mapper.map(customerParameter, customerParameter2);
			customerParameter2.setId(id);
			return super.saveOrUpdate(customerParameter2);
		}
	}
}
