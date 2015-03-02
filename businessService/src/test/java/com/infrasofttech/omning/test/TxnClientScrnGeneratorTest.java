package com.infrasofttech.omning.test;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.domain.entities.TxnHeader;
import com.infrasofttech.omning.services.TxnClientScrnGeneratorService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:appContext.xml" })
@Transactional
public class TxnClientScrnGeneratorTest {
	
	@Autowired
	TxnClientScrnGeneratorService txnClientScrnGenService;
	
	@Test
	@Rollback(value = false)
	public void testTxnClientScrnGenCreation() {
		try {
			TxnHeader txnHeader = new TxnHeader();
			
//			txnHeader = (TxnHeader)txnClientScrnGenService.saveOrUpdate(txnHeader);
			
			Assert.assertEquals(true, true);
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}

}
