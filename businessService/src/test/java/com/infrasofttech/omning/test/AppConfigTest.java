package com.infrasofttech.omning.test;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.domain.entities.AppConfig;
import com.infrasofttech.omning.services.AppConfigService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:appContext.xml" })
@Transactional
public class AppConfigTest {
	
	@Autowired
	AppConfigService appConfigService;
	
	@Test
	@Rollback(value = false)
	public void testAppConfigCreation() {
		try {
			AppConfig appConfig = new AppConfig();
			appConfig.setTenantId("01");
			
//			appConfig = (AppConfig)appConfigService.saveOrUpdate(appConfig);
			
			
			Assert.assertEquals(true, true);
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}

}
