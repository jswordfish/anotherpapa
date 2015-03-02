package com.infrasofttech.omning.test;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.domain.entities.PrdAcNumberConfig;
import com.infrasofttech.omning.services.PrdAcNoConfigService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:appContext.xml" })
@Transactional
public class PrdAcNoConfigTest {
	
	@Autowired
	PrdAcNoConfigService prdAcNoConfigService;
	
	@Test
	@Rollback(value = false)
	public void testPrdAcNoConfigCreation() {
		String tenantId="01";
		String moduleCode="10";
		String productCode="Prd-Test4";
		Integer acNoLen = 18;
		try {
			PrdAcNumberConfig prdAcNoConfig = new PrdAcNumberConfig();
			prdAcNoConfig.setTenantId(tenantId);
			prdAcNoConfig.setModuleCode(moduleCode);
			prdAcNoConfig.setProductCode(productCode);
			prdAcNoConfig.setAccountLen(acNoLen);
//			prdAcNoConfig.setIsActive(true);
			prdAcNoConfig = (PrdAcNumberConfig)prdAcNoConfigService.saveOrUpdate(prdAcNoConfig);

			if(prdAcNoConfig == null){
				Assert.assertEquals(true, false);	
			}else{
				Assert.assertEquals(true, true);
			}
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}

	@Test
	@Rollback(value = false)
	public void testGetPrdAcNumberConfigByUnique() {
		String tenantId="01";
		String moduleCode="10";
		String productCode="Prd-Test4";
		try {
			PrdAcNumberConfig prdAcNoConfig = new PrdAcNumberConfig();
			
			prdAcNoConfig  = (PrdAcNumberConfig)prdAcNoConfigService.getPrdAcNumberConfigByUniqueComposite(tenantId, moduleCode, productCode); 			
			if(prdAcNoConfig==null){
				Assert.assertEquals(true, false);
			}else{
				if(prdAcNoConfig.getTenantId().equalsIgnoreCase(tenantId)){
					Assert.assertEquals(true, true);
				}else{
					Assert.assertEquals(true, false);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}
}
