package com.infrasofttech.omning.test;

import java.util.List;

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
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.LookupCodeService;
import com.infrasofttech.omning.services.LookupValueService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:appContext.xml" })
@Transactional
public class LookUpTest {

	@Autowired
	LookupCodeService lookupCodeService;
	
	@Autowired
	LookupValueService lookupValueService;
	
	@Test
	@Rollback(value = false)
	public void testLookUpCode(){
		try {
			List<LookupCode> codes = lookupCodeService.findAll();
			Assert.assertEquals(true, true);
		} catch (OmniNGException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}
	
	@Test
	@Rollback(value = false)
	public void testLookUpValueCode(){
		try {
			List<LookupValue> lookupValues = lookupValueService.getLookupValueListOnId("01", "23", "en");
			Assert.assertEquals(true, true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}
	
}
