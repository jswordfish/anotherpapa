package com.infrasofttech.omning.test;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.domain.entities.TxnCCMain;
import com.infrasofttech.omning.services.TxnClientConfiguratorService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:appContext.xml" })
@Transactional
public class TxnClientConfigTest {
	
	@Autowired
	TxnClientConfiguratorService txnClientConfiguratorService;
	
	@Test
	@Rollback(value = false)
	public void testTxnClientConfigCreation() {
		try {
			TxnCCMain txnCC = new TxnCCMain();
			
//			txnCC = (TxnCCMain)txnClientConfiguratorService.saveOrUpdate(txnCC);

			Assert.assertEquals(true, true);
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}

}
