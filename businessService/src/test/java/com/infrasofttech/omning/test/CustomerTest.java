package com.infrasofttech.omning.test;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.domain.entities.CustomerContact;
import com.infrasofttech.domain.entities.CustomerMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.CustomerService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:appContext.xml" })
@Transactional
public class CustomerTest {

	@Autowired
	CustomerService customerService;

	@Test
	@Rollback(value = false)
	public void testCustomerCreation() {
		try {
			CustomerMst customerMst = new CustomerMst();
			Collection<CustomerContact> contacts = new ArrayList<CustomerContact>();
			CustomerContact customerContacts = new CustomerContact();
			customerContacts.setMobile1("9290045549");
			customerContacts.setEmailId1("abcd.killampalli@gmail.com");
			customerContacts.setFaxNo("fax122");
			customerMst.setId((long) 39);
			customerMst.setTenantId("105");
			//customerMst.setCustomerCode("006");
			customerMst.setBloodGroup("B+ve");
			customerMst.setCustMaritalStatus("unmarried");
			customerMst.setCustomerFName("vihan Sutaria");
			customerMst.setCustomerRegNo("0004");
			customerMst.setHNWCategory("03");
			customerMst.setTransactionFreezeReason("No Reason3");
			contacts.add(customerContacts);
			//customerContacts.setCustomerMst(customerMst);
			//customerMst.setCustomerContacts(contacts);
//			customerContacts.setTenantId("01");
			customerMst = (CustomerMst) customerService.saveOrUpdate(customerMst);
//			customerMst = (CustomerMst) customerService.saveOrUpdate(customerMst);

			Assert.assertEquals(true, true);
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}
	
	@Test
	@Rollback(value = false)
	public void testGetCustomerMstByUniqueComposite(){
		try {
			List<CustomerMst> customers = customerService.getCustomerByTenantId("105");
			CustomerMst customerMst = customerService.getCustomerMstByUniqueComposite("105", "CST_0");
			Assert.assertEquals(true, true);
		} catch (OmniNGException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
		
	}

	
}
