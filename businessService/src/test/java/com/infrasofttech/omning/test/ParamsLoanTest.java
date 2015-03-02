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

import com.infrasofttech.domain.entities.ParamLoanAc;
import com.infrasofttech.omning.services.ParamsLoanService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:appContext.xml" })
@Transactional
public class ParamsLoanTest {
	
	@Autowired
	ParamsLoanService paramsLoanService;
	
	@Test
	@Rollback(value = false)
	public void testParamsLoanCreation() {
		String tenantId="01";
		String moduleCode="11";
		String productCode="Prd-Test4";
		try {
			ParamLoanAc paramLoanAc = new ParamLoanAc();
			paramLoanAc.setTenantId(tenantId);
			paramLoanAc.setModuleCode(moduleCode);
			paramLoanAc.setProdCode(productCode);
			paramLoanAc.setMinimumAmount(21d);
			paramLoanAc = (ParamLoanAc)paramsLoanService.saveOrUpdate(paramLoanAc);
			if(paramLoanAc==null){
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
	public void testGetParamsLoanUnique() {
		String tenantId="01";
		String moduleCode="10";
		String productCode="Prd-Test4";
		String branchCode="01";
		Date effFromDate = new Date();

		try {
			ParamLoanAc paramsLoan = new ParamLoanAc();
			paramsLoan  = (ParamLoanAc)paramsLoanService.getParamLoanByUniqueComposite(tenantId, moduleCode, productCode, branchCode,effFromDate);
			if(paramsLoan==null){
				Assert.assertEquals(true, false);
			}else{
				if(paramsLoan.getTenantId().equalsIgnoreCase(tenantId)){
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
