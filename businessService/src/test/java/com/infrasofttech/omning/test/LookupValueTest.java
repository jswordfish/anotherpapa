package com.infrasofttech.omning.test;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.domain.entities.LookupCode;
import com.infrasofttech.domain.entities.LookupValue;
import com.infrasofttech.omning.services.LookupCodeService;
import com.infrasofttech.omning.services.LookupValueService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:appContext.xml" })
@Transactional
public class LookupValueTest {
	
	@Autowired
	LookupValueService lookupValueService;
	
	@Autowired
	LookupCodeService lookupCodeService;
	
	@Test
	@Rollback(value = false)
	public void testLookupValueCreation() {
		try {
			LookupValue lookupValue = new LookupValue();
			lookupValue.setLanguageCode("en");
			lookupValue.setLookupValueCode("INR");
			lookupValue.setLookupDisplayValue("INR");
			lookupValue.setLookUpCode("CURRENCY");
			lookupValue.setTenantId("001");
			lookupValue.setIsActive(true);
			
			LookupCode lookupCode = new LookupCode();
			lookupCode.setLookupCode("CURRENCY");
			lookupCode.setIsActive(true);
			lookupCode.setTenantId("001");
			lookupCode.getLookupValues().add(lookupValue);
			
			lookupCodeService.saveOrUpdate(lookupCode);
//			lookupValue = (LookupValue)lookupValueService.saveOrUpdate(lookupValue);
			
			
			Assert.assertEquals(true, true);
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}

}
