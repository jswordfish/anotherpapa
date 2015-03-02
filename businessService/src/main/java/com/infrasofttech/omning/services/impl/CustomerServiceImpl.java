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
import com.infrasofttech.domain.entities.CustomerMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.ICustomerBusinessDtlsDAO;
import com.infrasofttech.omning.ICustomerContactDAO;
import com.infrasofttech.omning.ICustomerMstDAO;

@Service("customerService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class CustomerServiceImpl extends OmniNGServiceImpl<Long, CustomerMst>
		implements com.infrasofttech.omning.services.CustomerService {
	@Autowired
	protected ICustomerMstDAO customerMstDAO;

	@Autowired
	protected ICustomerContactDAO customerContactDAO;

	@Autowired
	protected ICustomerBusinessDtlsDAO customerBusinessDtlsDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) customerMstDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		customerMstDAO.setEntityManager(entityManager);
	}

	// ---------------------------------------
	private static final Logger logger = Logger
			.getLogger(CustomerServiceImpl.class);

	public static Logger getLogger() {
		return logger;
	}

	public List<CustomerMst> getCustomerByTenantId(String tenantId) throws OmniNGException{
		// TODO Auto-generated method stub
		try {
			return super.findAllByTenant(tenantId);
		} catch (OmniNGException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new OmniNGException("can not retrieve list of customers ", e);
		}
	}
	
	private CustomerMst getCustomerMstByTenantAndCustCode(String tenantId, String cCode){
		Map<String, String> params = new HashMap<String, String>();
		params.put("tenantId", tenantId);
		params.put("customerCode", cCode);
		List<CustomerMst> customers = super.findByNamedQueryAndNamedParams("CustomerMst.getCustomerByTenantIdAndCustomerCode", params);
		if(customers != null && customers.size() > 0){
			return customers.get(0);
		}
		
		return null;
	}

	public CustomerMst saveOrUpdate(CustomerMst customerMst)
			throws OmniNGException {
		/**
		 * step 1 - figure out whether object exists or not
		 */
		CustomerMst customerMst2 = getCustomerMstByTenantAndCustCode(customerMst.getTenantId(), customerMst.getCustomerCode());
		if (customerMst2 == null) {
			// create mode
			//create cust code .
			synchronized (this) {
				Long code = customerMstDAO.getMaxCustomerCode();
				if(code == null){
					code = 0l;
					customerMst.setCode(0l);
					
				}else{
					code++;
					customerMst.setCode(code);
				}
				
				
				customerMst.setCustomerCode("CST_"+code);
				customerMst = super.saveOrUpdate(customerMst);
				
			}
			
			return customerMst;
		} else {
			// update mode;
			// userMst.s
			long id = customerMst2.getId();
			Mapper mapper = new DozerBeanMapper();
			mapper.map(customerMst, customerMst2);
			customerMst2.setId(id);
			return super.saveOrUpdate(customerMst2);

		}
		
	}

	public CustomerMst getCustomerMstByUniqueComposite(String tenantCode,
			String customerCode) throws OmniNGException {
		// TODO Auto-generated method stub
		return getCustomerMstByTenantAndCustCode(tenantCode, customerCode);
	}

	

}
