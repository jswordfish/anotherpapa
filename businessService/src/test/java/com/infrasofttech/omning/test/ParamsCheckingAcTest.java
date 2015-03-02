package com.infrasofttech.omning.test;

import java.util.Date;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.domain.entities.ParamCheckingAc;
import com.infrasofttech.omning.services.ParamsCheckingAcService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:appContext.xml" })
@Transactional
public class ParamsCheckingAcTest {
	
	@Autowired
	ParamsCheckingAcService paramsCheckingAcService;
	
	@Test
	@Rollback(value = false)
	public void testParamsCheckingAcCreation() {
		String tenantId="01";
		String moduleCode="10";
		String productCode="Prd-Test4";
		Double adhocInt = 13.12d;
		try {
			ParamCheckingAc paramCheckingAc = new ParamCheckingAc();
			paramCheckingAc.setTenantId(tenantId);
			paramCheckingAc.setModuleCode(moduleCode);
			paramCheckingAc.setProdCode(productCode);
			paramCheckingAc.setAdhocInterestRate(adhocInt);
			paramCheckingAc = (ParamCheckingAc)paramsCheckingAcService.saveOrUpdate(paramCheckingAc);
			if(paramCheckingAc==null){
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
	public void testGetParamsCheckingUnique() {
		String tenantId="01";
		String moduleCode="10";
		String branchCode="01";
		String productCode="Prd-Test4";
		Date effFromDate = new Date();
		try {
			ParamCheckingAc paramCheckingAc = new ParamCheckingAc();
			paramCheckingAc  = (ParamCheckingAc)paramsCheckingAcService.getParamCheckingAcByUniqueComposite(tenantId, moduleCode, productCode, branchCode,effFromDate);
			if(paramCheckingAc==null){
				Assert.assertEquals(true, false);
			}else{
				if(paramCheckingAc.getTenantId().equalsIgnoreCase(tenantId)){
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
